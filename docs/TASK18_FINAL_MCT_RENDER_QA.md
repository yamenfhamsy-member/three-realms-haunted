# TASK 18 — FINAL MCT VALIDATION + MASS RENDER QA

**Date:** 2026-09-01
**Tooling:** Minecraft Creator Tools CLI **v0.17.8** (`@minecraft/creator-tools` npm package, bin `mct`), installed to `/tmp/three_realms_workspace/mct/`. Headless Chromium (Playwright chromium-headless-shell 145.0.7632.6) installed for rendering.

## 1. Discovered MCT capabilities (actual, verified via `mct --help` / `--all-commands`)

| Capability | Command | Status |
|---|---|---|
| Validation | `mct validate <main\|currentplatform\|addon\|all\|default>` | ✅ available (`--json`, `--threads`, `--verbose` supported) |
| Render (single model) | `mct rendermodel -i <proj> <geoPath> <out.png>` | ✅ available (Playwright headless Chromium) |
| **Render batch** | `mct renderbatch <manifest.json>` (manifest: `{renders:[{projectDir, geometryPath, outputPath, width?, height?, vanilla?, camera?}]}`) | ✅ **available and used** |
| Render vanilla | `mct rendervanilla` | available (not needed — all assets custom) |
| Render structure | `mct renderstructure` | available (structures are mcfunction-built, no .mcstructure files exist) |
| Build structure | `mct buildstructure` | available (not applicable) |
| Package/export | `mct exportaddon` | available; project uses its own proven zip pipeline (per Task 2 note on exportaddon + esbuild-wasm + Node 24 RangeError) |
| Deploy/world/server | `deploy`, `serve`, `dedicatedserve`, `autotest` | present in CLI, **not usable** — no Bedrock runtime/GDK in this environment |
| MCP | `mct mcp` | available (not needed) |

## 2. Validation runs (isolated production scope `/tmp/tr_mct_prod` — BP/ + RP/ only, no vendor/staging)

| Suite | testPass | error | testFail | warning | recommendation | info | Exit |
|---|---|---|---|---|---|---|---|
| `validate main` | 42 | 1 | 1 | 95 | 143 | 685 | 4 |
| `validate currentplatform` | 42 | 1 | 1 | 95 | 143 | 685 | 4 |
| `validate addon` | 42 | 1 | 1 | 95 | 143 | 685 | 4 |

All three suites report the identical single error:

- **`/BP/functions/load.json` — "Unknown JSON file found" (UNKJSON 101)**

### Classification of the single MCT error

`load.json` is a **valid Bedrock behavior-pack mechanism** (auto-run on world load, alongside `tick.json`). MCT v0.17.8's file-inference only special-cases `/functions/tick.json` (item type 81); `load.json` falls through to `unknownJson` and the UNKJSON generator emits an unconditional error. Verified in the decompiled generator: only `tick.json` is whitelisted.

**Classification: SCOPE-LIMITED — validator limitation, not a project defect.** The file is a real, Bedrock-supported mechanism (`{"type":"commands","commands":["load_scoreboards"]}`), parses cleanly, and its referenced function exists. Removing it to silence MCT would break the boss kill-flag initialization fixed in Task 16. Kept as-is; documented here.

### Warnings (95) — classified, no action

- `uv_anim is missing and it is required` on all render controllers (ours + vendor copies) — **false positive** of the community JSON schema against standard Bedrock render-controller format (`uv_anim` is an optional vanilla-specific field, not required by the Bedrock format; the same warning fires on unmodified vendor/BOMD/SCP-Dystopia upstream files, confirming it is a schema-strictness artifact, not a project defect).
- `minecraft:spawns_surface not defined in schema` (5×) — vendor spawn rules only, upstream syntax.
- Recommendations (143) — format-version currency notes ("not at a current format version") across the intentionally preserved 1.21.x-era SCP/BOMD assets. Per policy: technical compatibility only; no blanket version upgrades.

## 3. Mass render QA (renderbatch, headless Chromium)

**Setup:** isolated production copy `/tmp/tr_mct_prod` (BP/ + RP/ only). Manifest `/tmp/tr_render_manifest.json` with `projectDir` + project-relative `geometryPath` per entry (the manifest parser matches paths against the project's inferred item paths; absolute paths fail — verified against the CLI source).

| Group | Command | Entries | Rendered | Failed |
|---|---|---|---|---|
| Bosses (individual) | `mct rendermodel` ×3 | 3 | 3 | 0 |
| **All models (batch)** | `mct renderbatch /tmp/tr_render_manifest.json` | 54 | 54 | 0 |

Outputs: `/tmp/three_realms_workspace/render_reports/bosses/` (morgue_warden.png, lady_of_the_crypt.png, the_nightmare.png) and `/tmp/three_realms_workspace/render_reports/all_models/` (54 PNGs — every production geometry, including all bosses, weapons-relevant entities, SCP mobs, portal gate geometry, and the corrosion block overlay).

**Visual inspection of boss renders:** all three boss models render with correct silhouettes (tall humanoid forms), textured surfaces, no magenta/black fallback, no missing limbs. Renders are **STATIC VISUAL INSPECTION PASS** — not in-game runtime evidence.

## 4. Build / package / regression

| Check | Result |
|---|---|
| Test suite (`tools/run_tests.py`) | **68/68 PASS** |
| Package (`three_realms_haunted.mcaddon`) | 567 entries, 12.7 MB, no staging/vendor/git leakage |
| Package contents spot-check | load.json + load_scoreboards + 5 lore entries + 4 chest tiers + full_walk + 3 boss chains (9 files each) + arrow RC + corrosion geo/texture all present |
| Full regression Task 1→18 | PASS (portal, SCP chains, blocks/items, weapons, 8 structures, 8 regions, encounters, audio, 3 bosses, lore, loot tiers, full walk, deep-repair fixes, perf review all verified in T16/T17 scans) |
| Watcher | BLOCKED (documented in T16) — encounter deactivated, BP entity retained |

## 5. Remaining blockers / limitations

- **Runtime: NOT TESTED — ENVIRONMENT LIMITATION.** No Bedrock runtime/BDS in this environment; `deploy`/`serve`/`autotest` present in the CLI but unusable.
- MCT's `load.json` false positive is upstream validator scope (see §2).
- Render images are static visual evidence only.
