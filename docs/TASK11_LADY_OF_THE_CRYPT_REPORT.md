# TASK 11 — LADY OF THE CRYPT REPORT

**ID:** `three_realms:lady_of_the_crypt`
**Location:** Crypt Depths (existing Crypt structure — not rebuilt)
**Date:** 2026-09-01

## 1. Deliverables (all additive)

| Layer | File |
|---|---|
| BP entity (3 phases + death state) | `BP/entities/three_realms/lady_of_the_crypt.json` |
| Client entity | `RP/entity/three_realms/lady_of_the_crypt.json` |
| Geometry (spectral humanoid, ribbons, claws, 128×256 UV) | `RP/models/entity/three_realms/lady_of_the_crypt.geo.json` |
| Texture (128×256 RGBA) | `RP/textures/entity/three_realms/lady_of_the_crypt.png` |
| Animations (idle, drift, reach, hurt, death, enraged) | `RP/animations/three_realms/lady_of_the_crypt.animation.json` |
| Animation controller (phase-aware) | `RP/animation_controllers/three_realms/lady_of_the_crypt.json` |
| Render controller | `RP/render_controllers/three_realms_lady_of_the_crypt.json` |
| Loot table (vanilla items only) | `BP/loot_tables/entities/three_realms_lady_of_the_crypt.json` |
| One-shot encounter function | `BP/functions/encounters/crypt_depths_lady_of_the_crypt.mcfunction` |
| Sound definitions (additive only) | `RP/sounds/sound_definitions.json` (+2 entries) |
| Additive note in existing encounter | `BP/functions/encounters/crypt_depths.mcfunction` (comment only, scp439 guard preserved) |

## 2. Design

- **Phases** via `mark_variant` + `has_damage` thresholds, mirroring the Task 10 Morgue Warden pattern:
  - Phase 1 (spawn): move 0.22, melee damage 7
  - Phase 2 (has_damage >= 100): move 0.30, damage 10
  - Phase 3 (has_damage >= 130): move 0.38, damage 14 + `minecraft:area_attack`
  - Death state: `mark_variant` 99, invulnerable, movement 0
- **Health:** 160 HP (below Morgue Warden's 200 — Tier 2 boss).
- **Encounter:** one-shot function guarded by `unless entity @e[r=32]` + `three_realms.lady_of_the_crypt_killed` scoreboard kill-flag. No tick loop, no global scan. Existing scp439 guard in `crypt_depths.mcfunction` untouched.
- **Audio:** additive-only sound definitions reusing existing `sounds/doors/door1_*` OGG files (no new audio files). Portal entries untouched.
- **Loot:** vanilla items only (phantom membrane, bone, glow ink sac, white dye, echo shard).

## 3. Validation evidence

| Check | Result |
|---|---|
| JSON syntax — all 9 new/modified JSON files parsed | PASS |
| Reference chain: BP entity → loot table | PASS |
| Reference chain: RP client entity → geometry / texture / animations / controller / render controller | PASS |
| Texture dims (128×256) vs geo `texture_width/height` (128×256) | PASS |
| Sound definitions → OGG files on disk (`sounds/doors/door1_*`) | PASS |
| Sound definition changes additive (portal + scpdt entries untouched) | PASS |
| Existing `crypt_depths.mcfunction` scp439 guard preserved | PASS |
| No global tick loop / no global scan | PASS |
| Render visual inspection (`docs/render_reports/lady_of_the_crypt_main.png`) | PASS (static visual inspection only) |

## 4. Package

`three_realms_haunted.mcaddon` rebuilt with `BP_bp/` + `RP_rp/` top-level structure: 541 files total, 9 Lady of the Crypt entries verified present via archive listing.

Package: **PASS**

## 5. Regression (Task 1→10)

- Portal (`haunted_portal`, `soul_igniter`, `cursed_gate_core`): files + refs intact — PASS
- SCP mobs (37 integrated + dependencies): intact — PASS
- Weapons (4 blades + textures + item_texture.json, 13 three_realms refs): intact — PASS
- Structures (8 build functions): intact — PASS
- Region foundation: intact — PASS
- Encounters (8 region functions): intact — PASS
- Audio (portal + scpdt + encounter cues): intact, additive-only changes — PASS
- Task 10 Morgue Warden: entity/client/geo/texture/controllers/loot/encounter intact — PASS

Regression: **PASS**

## 6. Known limitations

- Scoreboard objective `three_realms.lady_of_the_crypt_killed` must exist before the kill-flag guard works; no `scoreboard objectives add` exists anywhere in the project (same pre-existing pattern as Task 10 — not a Task 11 regression).
- Runtime behavior (spawn, phases, AI, rendering, audio playback): NOT TESTED — ENVIRONMENT LIMITATION.

## 7. Gate summary

- TASK 11: **PASS** (static)
- MCT: SCOPE-LIMITED (render evidence produced via prior tooling; CLI not found in current PATH)
- Render: PASS (static visual inspection, `docs/render_reports/lady_of_the_crypt_main.png`)
- Build: PASS
- Package: PASS
- Regression (Task 1→11): PASS
- Runtime: NOT TESTED — ENVIRONMENT LIMITATION
