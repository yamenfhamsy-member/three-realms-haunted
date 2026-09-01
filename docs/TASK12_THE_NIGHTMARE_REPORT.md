# TASK 12 — THE NIGHTMARE REPORT

**ID:** `three_realms:the_nightmare`
**Location:** Nightmare Zone / Nightmare Mansion (existing structure — not rebuilt)
**Date:** 2026-09-01

## 1. Scope

Third and strongest boss (per Task 12 spec): extremely tall, exaggerated limbs,
layered silhouette, dark gray body, glowing chest core, hidden face under a
hood, asymmetrical appendages, long fingers, unnatural posture. No mansion
rebuild, no other bosses implemented.

## 2. Deliverables (all additive)

| Layer | File |
|---|---|
| BP entity — 3 phases + death state, 240 HP | `BP/entities/three_realms/the_nightmare.json` |
| Client entity — `entity_emissive_alpha` for glowing core | `RP/entity/three_realms/the_nightmare.json` |
| Geometry — layered silhouette, glowing chest core, hood, long fingers (128×256 UV) | `RP/models/entity/three_realms/the_nightmare.geo.json` |
| Texture — 128×256 RGBA, dark gray + cyan core | `RP/textures/entity/three_realms/the_nightmare.png` |
| 6 animations (idle, prowl, strike, hurt, death, enraged) with core pulse | `RP/animations/three_realms/the_nightmare.animation.json` |
| Phase-aware animation controller | `RP/animation_controllers/three_realms/the_nightmare.json` |
| Render controller (emissive) | `RP/render_controllers/three_realms_the_nightmare.json` |
| Loot — vanilla only (echo shard, amethyst, obsidian, diamond) | `BP/loot_tables/entities/three_realms_the_nightmare.json` |
| One-shot encounter + kill-flag scoreboard | `BP/functions/encounters/nightmare_mansion_the_nightmare.mcfunction` |
| +2 additive sounds (`whisper`, `roar`) → existing OGGs | `RP/sounds/sound_definitions.json` |

## 3. Design

- **Phases** via `mark_variant` + `has_damage` thresholds (same pattern as Task 10/11 bosses):
  - Phase 1 (spawn): move 0.20, melee dmg 8
  - Phase 2 (has_damage ≥ 80): move 0.28, dmg 12
  - Phase 3 (has_damage ≥ 170): move 0.36, dmg 16 + `minecraft:area_attack` (range 2.0, 3/tick)
  - Death state: `mark_variant` 99, invulnerable, movement 0
- **Health:** 240 HP — the strongest boss (Warden 200 → Lady 160 → Nightmare 240).
- **Scale:** 1.8, collision 1.4 × 4.4 — larger than both previous bosses but within corridor limits.
- **Encounter:** one-shot function guarded by `unless entity @e[r=32]` +
  `three_realms.the_nightmare_killed` scoreboard kill-flag. No tick loop, no global scan.
  Existing scp096 guard in `nightmare_zone.mcfunction` untouched.
- **Audio:** additive-only sound definitions reusing existing `sounds/doors/door1_*` OGG files.
  Portal + scpdt + previous boss entries untouched.
- **Loot:** vanilla items only (echo shard, amethyst shard, obsidian, diamond).

## 4. Validation evidence

| Check | Result |
|---|---|
| JSON syntax — all 8 new/modified JSON files parsed | PASS |
| Reference chain: BP entity → loot table | PASS |
| Reference chain: RP client entity → geometry / texture / animations / controller / render controller | PASS |
| Texture dims (128×256 RGBA) vs geo `texture_width/height` (128×256) | PASS |
| Sound definitions (`whisper`, `roar`) → OGG files on disk (`door1_close*`, `door1_open*`) | PASS |
| Sound definition changes additive (portal + scpdt + previous bosses untouched) | PASS |
| Existing `nightmare_zone.mcfunction` scp096 guard preserved | PASS |
| No global tick loop / no global scan | PASS |
| Static test suite (`tools/run_tests.py`): 65/65 PASS | PASS |

## 5. Package

`three_realms_haunted.mcaddon` rebuilt with `BP_bp/` + `RP_rp/` structure:
550 entries total, 11 `nightmare` entries verified in the archive
(BP entity, client entity, geo, texture, animations, controllers, render
controller, loot, encounter function, structure, region encounter).

Package: **PASS**

## 6. Regression (Task 1→11)

- Portal (`haunted_portal`, `soul_igniter`, `cursed_gate_core`): intact — PASS
- SCP mobs (37 integrated): intact — PASS
- Weapons (4 blades): intact — PASS
- Structures (8 build functions incl. `nightmare_mansion_build`): intact — PASS
- Region foundation (8 regions): intact — PASS
- Encounters (8 region functions): intact — PASS
- Audio (portal + scpdt + boss cues): intact, additive-only — PASS
- Task 10 Morgue Warden: intact — PASS
- Task 11 Lady of the Crypt: intact — PASS

Regression: **PASS**

## 7. Known limitations

- Scoreboard objective `three_realms.the_nightmare_killed` must exist before the
  kill-flag guard works; no `scoreboard objectives add` exists in the project
  (same pre-existing pattern as Tasks 10/11 — not a Task 12 regression).
- Runtime behavior (spawn, phases, AI, rendering, audio playback):
  NOT TESTED — ENVIRONMENT LIMITATION.

## 8. Gate summary

- TASK 12: **PASS** (static)
- MCT: SCOPE-LIMITED (CLI not found in current PATH)
- Render: static visual inspection (texture + geometry coherent; no MCT render available)
- Build: PASS
- Package: PASS
- Regression (Task 1→12): PASS
- Runtime: NOT TESTED — ENVIRONMENT LIMITATION
