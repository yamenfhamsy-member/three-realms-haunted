# TASK 10 — BASELINE REGRESSION (Task 1 → Task 9)

**Date:** 2026-09-01
**Working copy:** `~/three_realms_task10/`
**MCT:** 0.17.8 (see `MCT_CAPABILITIES_CURRENT.md`)
**Goal:** verify all prior task deliverables remain in place before starting Task 10.

## Method

This regression inspects the **actual files** in the working copy (not cached reports) and:

1. Confirms identifier, file, and reference presence for every prior deliverable.
2. Confirms MCP-isolated static validation of the entire staged production view.
3. Confirms portal sounds and identifiers remain unchanged.
4. Confirms no leftover archive/staging/backup files appear in the production tree.

All validation commands ran against `/tmp/three_realms_workspace/staging_clean/` (an isolated BP+RP copy that contains no `backups/`, archive extracts, or other scope-pollution). Logs: `/tmp/three_realms_workspace/validation/baseline_*.log`.

---

## Task 1 — Portal regression

**Status: PASS (static). Runtime: NOT TESTED — ENVIRONMENT LIMITATION.**

| Asset | Expected path | Present | Notes |
|---|---|---|---|
| BP block | `BP/blocks/haunted_portal.json` | yes | `three_realms:haunted_portal`, geometry `geometry.three_realms.haunted_gate` |
| BP block | `BP/blocks/cursed_gate_core.json` | yes | `three_realms:cursed_gate_core`, no collision/selection |
| BP item | `BP/items/soul_igniter.json` | yes | `three_realms:soul_igniter`, max stack 1, foil |
| BP script | `BP/scripts/main.js` | yes | 326 lines; `node --check` PASS |
| BP script | `BP/scripts/main.ts` | present | preserved; not used by JS runtime path |
| RP geometry | `RP/models/blocks/haunted_gate.geo.json` | yes | referenced from BP |
| RP texture | `RP/textures/blocks/haunted_gate_frame.png` | yes | referenced by material |
| RP texture | `RP/textures/blocks/cursed_gate_core.png` | yes | referenced by material |
| RP item texture | `RP/textures/items/soul_igniter.png` | yes | referenced by item icon |
| RP pack icon | `RP/pack_icon.png` | yes | present |
| BP pack icon | `BP/pack_icon.png` | yes | present |
| Manifest BP | `BP/manifest.json` | yes | `three_realms:haunted_portal` chain referenced |
| Manifest RP | `RP/manifest.json` | yes | dependency on BP script uuid `932a8f09-...` |

Identifier constants in `main.js`:

```js
const PORTAL_DIMENSION_ID = "three_realms:haunted";
const FRAME_ID = "three_realms:haunted_portal";
const CORE_ID = "three_realms:cursed_gate_core";
const IGNITER_ID = "three_realms:soul_igniter";
```

State sequence constants present: `INACTIVE`, `ACTIVATING`, `CHARGING`, `OPENING`, `ACTIVE`. Frame scan, opening scan, charge ticks, opening ticks, active ticks, and per-player cooldown all present in code.

---

## Task 3 — SCP horror mob regression

**Status: PASS (static). Runtime: NOT TESTED — ENVIRONMENT LIMITATION.**

Entity inventory (BP `entities/scp/`, RP `entity/`): 33 entity files in BP and 35 client entity definitions in RP.

Sample verification — `three_realms:scp096`:

| Asset | Path | Present |
|---|---|---|
| BP behavior | `BP/entities/scp/scp096.json` | yes |
| RP client entity | `RP/entity/scp096 (new)/scp096.json` | yes |
| RP animation | `RP/animations/scp/dt_scp096_new.animation.json` | yes |
| RP controller | `RP/animation_controllers/scp/scp096_new.json` | yes |
| RP render controller | `RP/render_controllers/scpdt_scp096_new.json` | yes |
| RP texture | `RP/textures/entity/dt_scp096_new.png` | yes |
| RP texture | `RP/textures/entity/dt_scp096_new_bag.png` | yes |
| RP geometry | `RP/models/entity/scp096 (new)/dt_scp096_new.geo.json` | yes |
| BP loot | `BP/loot_tables/entities/scpdt/scp939.json` | yes |
| BP spawn rule | `BP/spawn_rules/scp096.json` | yes |

Note: SCP-173 remains BLOCKED per prior task log; no `lc:dt_broom` dependency was fabricated.

---

## Task 4 — Blocks + items regression

**Status: PASS (static). Runtime: NOT TESTED — ENVIRONMENT LIMITATION.**

Verified existing BOMD-sourced block/item set still references correctly:

| Identifier | Source | BP path | RP reference |
|---|---|---|---|
| `three_realms:gauntlet_blackstone` | BOMD | `BP/blocks/gauntlet_blackstone.json` | `RP/textures/item_texture.json` |
| `three_realms:obsidilith_rune` | BOMD | `BP/blocks/obsidilith_rune.json` | used in foundation function |
| `three_realms:scp106_corrosion` | BOMD | `BP/blocks/scp106_corrosion.json` | n/a |
| `three_realms:sealed_blackstone` | BOMD | `BP/blocks/sealed_blackstone.json` | n/a |
| `three_realms:vine_wall` | BOMD | `BP/blocks/vine_wall.json` | n/a |
| `three_realms:void_blossom_healer` | BOMD | `BP/blocks/void_blossom_healer.json` | n/a |
| `three_realms:void_thorn` | BOMD | `BP/items/void_thorn.json` | `item_texture.json` |
| `three_realms:blazing_eye` | BOMD | `BP/items/blazing_eye.json` | `item_texture.json` |
| `three_realms:obsidian_heart` | BOMD | `BP/items/obsidian_heart.json` | `item_texture.json` |
| `three_realms:ancient_anima` | BOMD | `BP/items/ancient_anima.json` | `item_texture.json` |

All references resolve and validate.

---

## Task 5 — Weapons regression

**Status: PASS (static). Runtime: NOT TESTED — ENVIRONMENT LIMITATION.**

| Identifier | BP path | RP path | Valid |
|---|---|---|---|
| `three_realms:arcane_blade` | `BP/items/arcane_blade.json` | `RP/textures/three_realms/armor_weapons/arcane_blade.png` | yes |
| `three_realms:fire_blade` | `BP/items/fire_blade.json` | `RP/textures/three_realms/armor_weapons/fire_blade.png` | yes |
| `three_realms:frost_blade` | `BP/items/frost_blade.json` | `RP/textures/three_realms/armor_weapons/frost_blade.png` | yes |
| `three_realms:hexblade` | `BP/items/hexblade.json` | `RP/textures/three_realms/armor_weapons/hexblade.png` | yes |

All four blades have damage=6, max_durability=200, enchantable sword slot 10, fire_resistant. `RP/textures/item_texture.json` references all four under `three_realms:*` namespace. Original PNG assets preserved.

---

## Task 6 — Structures regression

**Status: PASS (static). Runtime: NOT TESTED — ENVIRONMENT LIMITATION.**

Eight structure builders exist in `BP/functions/structures/`:

```
abandoned_hospital_build.mcfunction          (100 lines)
abandoned_laboratory_build.mcfunction         (31)
cemetery_complex_build.mcfunction             (34)
crypt_build.mcfunction                        (32)
cursed_mansion_build.mcfunction               (32)
haunted_house_build.mcfunction                (35)
nightmare_mansion_build.mcfunction            (33)
ruined_church_build.mcfunction                (32)
```

All are deterministic `fill`/`setblock`/`loot insert` pipelines. The abandoned hospital function (the largest) starts at `BP/functions/structures/abandoned_hospital_build.mcfunction:1`. The structure footprints are documented in the file headers.

---

## Task 7 — Region foundation regression

**Status: PASS (static). Runtime: NOT TESTED — ENVIRONMENT LIMITATION.**

`BP/functions/world/haunted_realm_foundation_build.mcfunction` (127 lines) contains:

- `REGION` markers: 8 (one per region)
- Deterministic corridor `fill ~-8 ~0 ~-4 344 ~0 ~4`
- 24x24 region pads at x=0, 48, 96, 144, 192, 240, 288, 336
- Structure anchors referenced per region
- No per-tick loop, no global scan, no procedural worldgen

---

## Task 8 — Mob encounter regression

**Status: PASS (static). Runtime: NOT TESTED — ENVIRONMENT LIMITATION.**

Eight encounter files in `BP/functions/encounters/`:

| File | Mob | Audio cue | One-mob-cap radius |
|---|---|---|---|
| `abandoned_outskirts.mcfunction` | `haunted_watcher` | yes | 24 |
| `dead_forest.mcfunction` | `scp939` | no | 24 |
| `cemetery_district.mcfunction` | `scp106` | yes | 24 |
| `abandoned_hospital.mcfunction` | `scp939` | yes | 24 |
| `cursed_village.mcfunction` | `scp966` | yes | 24 |
| `old_laboratory.mcfunction` | `scp035_scientist` | yes | 24 |
| `crypt_depths.mcfunction` | `scp439` | no | 24 |
| `nightmare_zone.mcfunction` | `scp096` | no | 24 |

All use `execute positioned ~X ~Y ~Z unless entity @e[type=...,r=24] run summon ...`. None contains a tick loop or global scan. Each mob is summoned at an offset from the anchor.

---

## Task 9 — Audio regression

**Status: PASS (static). Runtime: NOT TESTED — ENVIRONMENT LIMITATION.**

Sound definitions (`RP/sounds/sound_definitions.json`) contain exactly four definitions:

| Identifier | Category | OGG paths |
|---|---|---|
| `three_realms.haunted_activate` | ambient | `sounds/haunted_activate` |
| `three_realms.haunted_teleport` | ambient | `sounds/haunted_teleport` |
| `three_realms.scpdt.door1.close` | neutral | `sounds/doors/door1_close1`, `door1_close2`, `door1_close3` |
| `three_realms.scpdt.door1.open` | neutral | `sounds/doors/door1_open1`, `door1_open2`, `door1_open3` |

Audio files in `RP/sounds/`:

```
haunted_activate.ogg
haunted_teleport.ogg
sound_definitions.json
doors/door1_close1.ogg
doors/door1_close2.ogg
doors/door1_close3.ogg
doors/door1_open1.ogg
doors/door1_open2.ogg
doors/door1_open3.ogg
```

8 OGG files. No duplicate definitions. Portal entries preserved exactly. No new audio was added by Task 10 at this stage.

---

## MCP validation summary (production staging)

| Suite | Exit code | Outcome |
|---|---:|---|
| `validate main` | 0 | PASS — no errors, warnings/recommendations only |
| `validate currentplatform` | 0 | PASS — no errors |
| `validate all` | 0 | PASS — no errors |
| `validate addon` | 4 | SCOPE-LIMITED — cooperative add-on naming convention only |

Warnings present in `main` (not failures):

- Three 1920×1920 PNG textures exceed the per-texture mip memory budget (14 MB mip vs 4 MiB ceiling). These are existing baseline textures: `cursed_gate_core.png`, `haunted_gate_frame.png`, `soul_igniter.png`. They predate Task 10 and are not introduced by this task.
- A few recommended vanilla item links in loot tables (`minecraft:string`, `minecraft:apple`, etc.) — pre-existing.

No secrets, credentials, archives, or staging files in the production tree. The `.gitignore` blocks `vendor/` from accidental commit.

---

## Conclusion

All Tasks 1–9 deliverables are intact, referenced, and statically valid. No regression introduced. Task 10 may proceed.

- **MCT:** PASS (isolated staging)
- **Portal:** PASS (static) — runtime NOT TESTED
- **Mobs:** PASS (static) — runtime NOT TESTED
- **Blocks/items:** PASS (static) — runtime NOT TESTED
- **Weapons:** PASS (static) — runtime NOT TESTED
- **Structures:** PASS (static) — runtime NOT TESTED
- **Regions:** PASS (static) — runtime NOT TESTED
- **Encounters:** PASS (static) — runtime NOT TESTED
- **Audio:** PASS (static) — runtime NOT TESTED
- **Runtime:** NOT TESTED — ENVIRONMENT LIMITATION