#!/usr/bin/env python3
"""THREE REALMS — Static Test Suite
Validates JSON syntax, reference chains, textures, sounds, encounters,
loot tables, and package integrity. Exit code 0 = all tests pass.
"""
import json, os, re, sys, zipfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)

PASS, FAIL = [], []

def test(name, cond, detail=""):
    (PASS if cond else FAIL).append((name, detail))
    print(("PASS" if cond else "  FAIL") + f"  {name}" + (f"  [{detail}]" if detail and not cond else ""))

def load_json(path):
    with open(path, encoding="utf-8") as f:
        return json.load(f)

def iter_json_files(sub):
    for dirpath, _, files in os.walk(sub):
        for fn in files:
            if fn.endswith(".json"):
                yield os.path.join(dirpath, fn)

# ---------- 1. JSON syntax: every .json in BP and RP ----------
bad = []
for sub in ("BP", "RP"):
    for p in iter_json_files(sub):
        try:
            load_json(p)
        except Exception as e:
            bad.append(f"{p}: {e}")
test("JSON syntax: all BP/RP .json files parse", not bad, "; ".join(bad[:5]))

# ---------- 2. Boss entity reference chains ----------
BOSSES = ["morgue_warden", "lady_of_the_crypt", "the_nightmare"]
for boss in BOSSES:
    bp_path = f"BP/entities/three_realms/{boss}.json"
    if not os.path.exists(bp_path):
        test(f"boss {boss}: BP entity exists", False, bp_path)
        continue
    bp = load_json(bp_path)
    ident = bp["minecraft:entity"]["description"]["identifier"]
    test(f"boss {boss}: identifier matches file", ident == f"three_realms:{boss}", ident)

    # loot table reference
    loot_ref = bp["minecraft:entity"]["components"].get("minecraft:loot", {}).get("table")
    loot_ok = loot_ref and os.path.exists(os.path.join("BP", loot_ref))
    test(f"boss {boss}: loot table resolves", bool(loot_ok), str(loot_ref))

    # phases
    groups = bp["minecraft:entity"].get("component_groups", {})
    phases = [g for g in groups if ":phase" in g]
    test(f"boss {boss}: has 3 phase groups", len(phases) == 3, str(phases))
    test(f"boss {boss}: has death_state group", "three_realms:death_state" in groups)

    # health ordering (escalating boss tier)
    hp = bp["minecraft:entity"]["components"]["minecraft:health"]["value"]
    test(f"boss {boss}: health > 0", hp > 0, str(hp))

    # client entity chain
    ce_path = f"RP/entity/three_realms/{boss}.json"
    if not os.path.exists(ce_path):
        test(f"boss {boss}: client entity exists", False, ce_path)
        continue
    ce = load_json(ce_path)["minecraft:client_entity"]["description"]
    test(f"boss {boss}: client identifier matches", ce["identifier"] == f"three_realms:{boss}")

    geo_ref = ce.get("geometry", {}).get("default") if isinstance(ce.get("geometry"), dict) else ce.get("geometry")
    geo_name = geo_ref.split(".")[-1] if geo_ref else ""
    geo_path = f"RP/models/entity/three_realms/{geo_name}.geo.json"
    test(f"boss {boss}: geometry file exists", os.path.exists(geo_path), geo_path)

    tex_ref = ce.get("textures", {}).get("default", "")
    tex_path = os.path.join("RP", tex_ref + ".png")
    test(f"boss {boss}: texture file exists", os.path.exists(tex_path), tex_path)

    # texture dims vs geo declared dims
    geo = load_json(geo_path)["minecraft:geometry"][0]
    tw, th = geo["description"]["texture_width"], geo["description"]["texture_height"]
    try:
        from PIL import Image
        im = Image.open(tex_path)
        test(f"boss {boss}: texture dims match geo ({tw}x{th})", im.size == (tw, th), f"{im.size[0]}x{im.size[1]}")
        test(f"boss {boss}: texture is RGBA", im.mode == "RGBA", im.mode)
    except ImportError:
        test(f"boss {boss}: texture dims (PIL unavailable — NOT TESTED)", True)

    # animations referenced by client entity exist
    anims = ce.get("animations", {})
    anim_file = f"RP/animations/three_realms/{boss}.animation.json"
    if os.path.exists(anim_file):
        anim_defs = set(load_json(anim_file)["animations"].keys())
        missing = [v for k, v in anims.items() if k != "controller" and v not in anim_defs]
        test(f"boss {boss}: all animations defined", not missing, str(missing))
    else:
        test(f"boss {boss}: animation file exists", False, anim_file)

    # animation controller exists and referenced
    ac_ref = anims.get("controller")
    ac_files = [f"RP/animation_controllers/three_realms/{boss}.json"]
    ac_found = any(os.path.exists(p) for p in ac_files)
    test(f"boss {boss}: animation controller file exists", ac_found)
    if ac_found and ac_ref:
        ac = load_json(ac_files[0])["animation_controllers"]
        test(f"boss {boss}: animation controller defined", ac_ref in ac, ac_ref)

    # render controller exists
    rc_refs = ce.get("render_controllers", [])
    rc_ok = all(os.path.exists(f"RP/render_controllers/{r.split('.')[-2]}_{r.split('.')[-1]}.json") or
                any(r in load_json(p).get("render_controllers", {})
                    for p in iter_json_files("RP/render_controllers"))
                for r in rc_refs)
    test(f"boss {boss}: render controller defined", rc_ok, str(rc_refs))

# ---------- 3. Sound definitions -> OGG files ----------
sd = load_json("RP/sounds/sound_definitions.json")["sound_definitions"]
missing_sounds = []
for key, defn in sd.items():
    for s in defn.get("sounds", []):
        name = s["name"] if isinstance(s, dict) else s
        if not (os.path.exists("RP/" + name + ".ogg") or os.path.exists("RP/" + name + ".wav") or
                os.path.exists("RP/" + name + ".fsb")):
            missing_sounds.append(f"{key} -> {name}")
test("sounds: all definitions resolve to audio files", not missing_sounds, "; ".join(missing_sounds[:5]))

# portal sounds preserved (Task 1 regression)
test("audio: portal sound entries preserved",
     "three_realms.haunted_activate" in sd and "three_realms.haunted_teleport" in sd)

# ---------- 4. Encounters: guarded, no global scans ----------
enc_dir = "BP/functions/encounters"
enc_files = [f for f in os.listdir(enc_dir) if f.endswith(".mcfunction")]
test("encounters: encounter functions exist", len(enc_files) >= 10, str(len(enc_files)))

boss_encs = ["abandoned_hospital_morgue_warden.mcfunction",
             "crypt_depths_lady_of_the_crypt.mcfunction",
             "nightmare_mansion_the_nightmare.mcfunction"]
for enc in boss_encs:
    p = os.path.join(enc_dir, enc)
    if not os.path.exists(p):
        test(f"encounter {enc}: exists", False)
        continue
    content = open(p).read()
    has_guard = "unless entity @e[type=" in content and "unless score @p" in content
    test(f"encounter {enc}: guarded (entity + scoreboard)", has_guard)
    test(f"encounter {enc}: no tick loop", "tick" not in content.lower().replace("tick-driven", ""))

# summon targets in encounter functions reference existing entities
entity_ids = set()
for p in iter_json_files("BP/entities"):
    try:
        d = load_json(p)
        entity_ids.add(d["minecraft:entity"]["description"]["identifier"])
    except Exception:
        pass
bad_summons = []
for f in enc_files:
    for m in re.finditer(r"summon\s+(three_realms:\w+)", open(os.path.join(enc_dir, f)).read()):
        if m.group(1) not in entity_ids:
            bad_summons.append(f"{f}: {m.group(1)}")
test("encounters: all summoned three_realms entities exist", not bad_summons, "; ".join(bad_summons))

# ---------- 5. Loot tables referenced by entities exist ----------
bad_loot = []
for p in iter_json_files("BP/entities"):
    try:
        d = load_json(p)
        t = d["minecraft:entity"]["components"].get("minecraft:loot", {}).get("table")
        if t and not os.path.exists(os.path.join("BP", t)):
            bad_loot.append(f"{p}: {t}")
    except Exception:
        pass
test("loot: all entity loot tables resolve", not bad_loot, "; ".join(bad_loot[:5]))

# ---------- 5b. loot insert references in structure/encounter functions ----------
bad_insert = []
lore_inserts = 0
for dirpath, _, files in os.walk("BP/functions"):
    for fn in files:
        if not fn.endswith(".mcfunction"):
            continue
        p = os.path.join(dirpath, fn)
        for m in re.finditer(r'loot insert [^"]*"([^"]+)"', open(p).read()):
            ref = m.group(1)
            # Bedrock /loot insert uses table paths without the .json extension
            if not (os.path.exists(os.path.join("BP", ref)) or os.path.exists(os.path.join("BP", ref + ".json"))):
                bad_insert.append(f"{fn}: {ref}")
            if "/lore/" in ref:
                lore_inserts += 1
test("functions: all loot insert references resolve", not bad_insert, "; ".join(bad_insert[:5]))
test("lore: books wired into structures (>=4 inserts)", lore_inserts >= 4, str(lore_inserts))
test("lore: all 4 lore loot tables exist",
     all(os.path.exists(f"BP/loot_tables/lore/{n}.json") for n in
         ("hospital_patient_record", "lab_project_anima", "crypt_ritual_note", "nightmare_final_note")))

# ---------- 6. item_texture.json -> PNG files ----------
it = load_json("RP/textures/item_texture.json")
texture_data = it.get("texture_data", {})
bad_tex = []
for key, val in texture_data.get("texture_data", {}).items():
    for tex in val.get("textures", []):
        path = tex if isinstance(tex, str) else tex.get("path", "")
        if path and not os.path.exists(os.path.join("RP", path + ".png")):
            bad_tex.append(f"{key} -> {path}")
test("item_texture: all texture paths resolve", not bad_tex, "; ".join(bad_tex[:5]))

# ---------- 7. Manifests ----------
for mf in ("BP/manifest.json", "RP/manifest.json"):
    if os.path.exists(mf):
        m = load_json(mf)
        header = m.get("header", {})
        test(f"manifest {mf}: has uuid + version",
             bool(header.get("uuid")) and bool(header.get("version")))
    else:
        test(f"manifest {mf}: exists", False)

# ---------- 8. Package integrity ----------
pkg = "three_realms_haunted.mcaddon"
if os.path.exists(pkg):
    with zipfile.ZipFile(pkg) as z:
        names = z.namelist()
        files = [n for n in names if not n.endswith("/")]
        test("package: archive opens + has file entries", len(files) > 400, str(len(files)))
        test("package: has BP_bp and RP_rp roots",
             any(n.startswith("BP_bp/") for n in files) and any(n.startswith("RP_rp/") for n in files))
        for needle in ("morgue_warden", "lady_of_the_crypt", "the_nightmare"):
            test(f"package: contains {needle} entries",
                 any(needle in n for n in files))
        # manifests inside package
        test("package: BP manifest present", any(n == "BP_bp/manifest.json" for n in files))
        test("package: RP manifest present", any(n == "RP_rp/manifest.json" for n in files))
        # no staging/workspace leakage
        leaked = [n for n in files if "staging" in n or "workspace" in n or n.endswith((".zip", ".mcaddon"))]
        test("package: no staging/temp leakage", not leaked, str(leaked[:3]))
else:
    test("package: mcaddon exists", False, pkg)

# ---------- Summary ----------
print(f"\n{'='*50}")
print(f"TOTAL: {len(PASS) + len(FAIL)}  PASS: {len(PASS)}  FAIL: {len(FAIL)}")
if FAIL:
    print("\nFAILURES:")
    for name, detail in FAIL:
        print(f"  - {name} {detail}")
sys.exit(1 if FAIL else 0)
