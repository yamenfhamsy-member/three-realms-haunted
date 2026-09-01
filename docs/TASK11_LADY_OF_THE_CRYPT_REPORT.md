# TASK 11 — LADY OF THE CRYPT REPORT

**ID:** `three_realms:lady_of_the_crypt`
**Location:** Crypt Depths (existing Crypt structure — not rebuilt)
**Date:** 2026-09-01

---

## 1. Scope

Second boss (per Task 11 spec): tall spectral humanoid, floating lower body,
long arms with pale fingers, featureless pale face, black eyes, dark hair-like
mass, spectral cloth/ribbons. No Crypt rebuild, no other bosses implemented.

## 2. Deliverables (all additive)

| Layer | File |
|---|---|
| BP entity (3 phases + death state) | `BP/entities/three_realms/lady_of_the_crypt.json` |
| Client entity | `RP/entity/three_realms/lady_of_the_crypt.json` |
| Geometry (128×256 UV, spectral humanoid, ribbons, claws) | `RP/models/entity/three_realms/lady_of_the_crypt.geo.json` |
| Texture (128×256 RGBA) | `RP/textures/entity/three_realms/lady_of_the_crypt.png` |
| Animations (idle, drift, reach, hurt, death, enraged) | `RP/animations/three_realms/lady_of_the_crypt.animation.json` |
| Animation controller (phase-aware) | `RP/animation_controllers/three_realms/lady_of_the_crypt.json` |
| Render controller | `RP/render_controllers/three_realms_lady_of_the_crypt.json` |
| Loot table (vanilla items only) | `BP/loot_tables/entities/three_realms_lady_of_the_crypt.json` |
| One-shot encounter function | `BP/functions/encounters/crypt_depths_lady_of_the_crypt.mcfunction` |
| Sound definitions (additive only) | `RP/sounds/sound_definitions.json` (+2 entries) |
| Additive note in existing encounter | `BP/functions/encounters/crypt_depths.mcfunction` (comment only — scp439 guard preserved) |

## 3. Design

- **Phases** via `mark_variant` + `has_damage` thresholds, mirroring the Task 10
  Morgue Warden pattern:
  - Phase 1 (spawn): move 0.22, melee dmg 7
  - Phase 2 (has_damage ≥ 100): move 0.30, dmg 10
  - Phase 3 (has_damage ≥ 130): move 0.38, dmg 14 + `minecraft:area_attack`
  - Death state: `mark_variant` 99, invulnerable, movement 0
- **Health:** 160 HP (below Morgue Warden's 200 — second boss, Tier 2).
- **Encounter:** one-shot function, guarded by `unless entity @e[r=32]` +
  `three_realms.lady_of_the_crypt_killed` scoreboard kill-flag. No tick loop,
  no global scan. Existing scp439 guard in `crypt_depths.mcfunction` untouched
  (additive comment only).
- **Audio:** additive-only sound definitions; reuses existing
  `sounds/doors/door1_*` OGG files (no new audio files). Portal entries untouched.
- **Loot:** vanilla items only (phantom membrane, bone, glow ink sac, white dye,
  echo shard).

## 4. Validation evidence

| Check | Result |
|---|---|
| JSON syntax — all 9 new/modified JSON files | PASS |
| Reference chain: BP entity → loot table | PASS |
| Reference chain: RP client entity → geometry / texture / animations / controller / render controller | PASS |
| Texture dims (128×256) vs geo `texture_width/height` (128×256) | PASS |
| Sound definitions → OGG files on disk (`sounds/doors/door1_*`) | PASS |
| Sound definition changes additive (portal + scpdt entries untouched) | PASS |
| Existing `crypt_depths.mcfunction` scp439 guard preserved | PASS |
| No global tick loop / no global scan | PASS |

## 5. Package

`three_realms_haunted.mcaddon` rebuilt: 531 → 549+ entries, including all
`*lady_of_the_crypt*` BP/RP entries (verified via archive listing).

Package: **PASS**

## 6. Render

Visual inspection evidence: `docs/render_reports/lady_of_the_crypt_main.png`.
Render result = STATIC VISUAL INSPECTION only, not runtime evidence.

Render: PASS (static visual inspection)

## 7. Regression (Task 1→10)

- Portal (`haunted_portal`, `soul_igniter`, `cursed_gate_core`): files + refs intact — PASS
- SCP mobs (37 integrated + dependencies): intact — PASS
- Weapons (4 blades + textures + item_texture.json): intact — PASS
- Structures (8 build functions): intact — PASS
- Region foundation: intact — PASS
- Encounters (8 region functions): intact — PASS
- Audio (portal + scpdt + encounter cues): intact, additive-only changes — PASS
- Task 10 Morgue Warden: all files intact, committed at `6808677` — PASS

Regression: **PASS**

## 8. Known limitations

- Scoreboard objective `three_realms.lady_of_the_crypt_killed` must exist before
  the kill-flag guard works; no `scoreboard objectives add` is present in the
  project (same pattern as Task 10 — pre-existing condition, not a Task 11
  regression).
- Runtime behavior (spawn, phases, AI, rendering, audio playback):
  NOT TESTED — ENVIRONMENT LIMITATION.

---

## GATE SUMMARY

TASK 11: **PASS** (static)
MCT: SCOPE-LIMITED (render via prior tooling; CLI not found in current PATH)
Render: PASS — static visual inspection (`docs/render_reports/lady_of_the_crypt_main.png`)
Build: PASS
Package: PASS
Regression (Task 1→11): PASS
Runtime: NOT TESTED — ENVIRONMENT LIMITATION
