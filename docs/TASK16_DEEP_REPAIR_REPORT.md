# TASK 16 — DEEP REPAIR REPORT

**Date:** 2026-09-01
**Scope:** Repair verified defects from the Task 1→15 deep audit. No new features, no asset redesign.

## Git state

- **HEAD before repairs:** `1fd849a` (arrow render controller)
- **HEAD after repairs:** `d8608d0`
- **Branch:** `master`
- **Working tree:** clean

## Issue resolution summary

| # | Severity | Issue | Result |
|---|---|---|---|
| 1 | HIGH | haunted_watcher missing RP client entity + texture | **BLOCKED** — no approved visual asset exists in vendor/production (checked all `vendor/scp-dystopia` geometries and textures; nothing matches the 8-bone humanoid layout). Per policy, no AI/replacement art. Encounter function deactivated safely (summon + cue commented out with explanation), BP entity retained but spawn rule removed. |
| 2 | HIGH | `controller.render.three_realms.arrow` undefined | **FIXED** — created `RP/render_controllers/three_realms_arrow.json` referencing existing projectile geometry/material/texture. All 3 projectile client entities (`scp5167_dragon_shot*`) now resolve. |
| 3 | MEDIUM | `scp106_corrosion` geometry missing in production | **FIXED** — copied vendor geometry unchanged to `RP/models/entity/dt_scp106_corrosion.geo.json` (id `geometry.dt_scp106_corrosion`) and corrected the BP block reference from `geometry.three_realms.dt_scp106_corrosion` to match. Chain closes: block → geometry → texture `dt_scp106_corrosion` (in terrain_texture via vendor copy) → material. |
| 4 | MEDIUM | 4 blocks missing RP `blocks.json` entries | **FIXED** — added `three_realms:vine_wall` (grass), `void_blossom_healer` (grass), `gauntlet_blackstone` (stone), `sealed_blackstone` (stone). `scp106_corrosion` (slime) already present. |
| 5 | MEDIUM | 14 items missing `en_US.lang` display names | **FIXED** — added 19 `item.three_realms.*` entries (all 4 weapons: Arcane Blade, Fire Blade, Frost Blade, Hexblade + soul_igniter, scp items, etc.). No identifiers changed. |
| 6 | LOW | sealed_blackstone uses vanilla texture | **VALID — INTENTIONAL** — left unchanged; uses vanilla `polished_blackstone_bricks` with `minecraft:geometry.full_block`, a legitimate opaque-block rendering path. |
| 7 | INFO | haunted_portal missing terrain_texture entry | **VALID — LOGICAL/FRAME-ONLY BLOCK** — the portal block is the gameplay-only logical block; the frame (`haunted_gate_frame`) has its own terrain texture. Left unchanged. |
| 8 | INFO/MEDIUM | scp3199_egg translation key missing | **FIXED** — added `dt.nameslot.scp3199_egg=SCP-3199 Egg` to `en_US.lang`. |

## Additional repairs (found during audit)

- **Scoreboard init** — added `BP/functions/load.json` + `BP/functions/load_scoreboards.mcfunction` creating the 3 boss kill-flag objectives on world load (idempotent mechanism, no tick loop). Closes the pre-existing gap from Tasks 10–12.
- **Deep reference-graph scan** — corrected scanner (nested JSON parsing + `.png` suffix resolution): **56 client entities checked, 0 broken chains**. Every BP entity → RP client → geometry → texture → render controller → animations/controller chain closes. All 3 bosses included.

## Validation

| Check | Result |
|---|---|
| Test suite (`tools/run_tests.py`) | **68/68 PASS** |
| Package rebuilt from current source | **567 entries** |
| Watcher deactivated state in package | ✅ spawn rule absent, encounter function comments only |
| Lore + chests + full_walk + 3 bosses + arrow RC in package | ✅ all present |
| Staging/vendor/git leakage | ✅ none |
| MCT CLI | **UNAVAILABLE IN THIS ENVIRONMENT** (`mct` not found in PATH) |
| Render batch | **UNAVAILABLE** (requires MCT) |
| **Runtime** | **NOT TESTED — ENVIRONMENT LIMITATION** |

## Commits in this task

1. `f2ec188` — Fix scp106_corrosion rendering chain + add missing block/lang entries
2. `00b2796` — Rebuild mcaddon with scp106_corrosion chain fix included
3. `e2dacac` — Deactivate haunted_watcher encounter (BLOCKED: no visual asset)
4. `149300a` / `d8608d0` — Rebuild mcaddon with Task 16 repairs and scoreboard init included

## Remaining blockers

- **haunted_watcher visual chain** — BLOCKED pending an approved horror-humanoid asset from an approved source. Do not fabricate.

## Final gate

**TASK 16: PASS (static, with 1 documented BLOCKED item)** · Build: PASS · Package: PASS (567 entries) · Regression 1→16: PASS (68/68) · MCT: UNAVAILABLE · Render: UNAVAILABLE · **Runtime: NOT TESTED — ENVIRONMENT LIMITATION**
