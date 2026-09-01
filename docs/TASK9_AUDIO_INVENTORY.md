# TASK 9 — AUDIO INVENTORY

Inventory generated from the actual production `RP/sounds`, `sound_definitions.json`, BP/RP entity JSON, functions, and scripts. No production file was modified.

Audio assets: **8**. Sound definitions: **4**. Duplicate byte-identical groups: **0**. Missing definition paths detected: **0**.

## Audio files

| Path | Format | Bytes | Duration (s) | Sample rate | Channels |
|---|---:|---:|---:|---|---|
| `RP/sounds/doors/door1_close1.ogg` | ogg | 23415 | 2.940952 | 44100 | 2 |
| `RP/sounds/doors/door1_close2.ogg` | ogg | 23030 | 2.81542 | 44100 | 2 |
| `RP/sounds/doors/door1_close3.ogg` | ogg | 23608 | 2.867664 | 44100 | 2 |
| `RP/sounds/doors/door1_open1.ogg` | ogg | 18983 | 2.247619 | 44100 | 2 |
| `RP/sounds/doors/door1_open2.ogg` | ogg | 19128 | 2.247619 | 44100 | 2 |
| `RP/sounds/doors/door1_open3.ogg` | ogg | 19534 | 2.293855 | 44100 | 2 |
| `RP/sounds/haunted_activate.ogg` | ogg | 6344 | 0.626939 | 22050 | 1 |
| `RP/sounds/haunted_teleport.ogg` | ogg | 14131 | 3.250023 | 22050 | 1 |

## Sound definitions

| Identifier | Definition summary |
|---|---|
| `three_realms.haunted_activate` | `{"category": "ambient", "sounds": [{"name": "sounds/haunted_activate", "volume": 0.8}]}` |
| `three_realms.haunted_teleport` | `{"category": "ambient", "sounds": [{"name": "sounds/haunted_teleport", "volume": 0.75}]}` |
| `three_realms.scpdt.door1.close` | `{"category": "neutral", "max_distance": 9.0, "sounds": [{"name": "sounds/doors/door1_close1"}, {"name": "sounds/doors/door1_close2"}, {"name": "sounds/doors/door1_close3"}]}` |
| `three_realms.scpdt.door1.open` | `{"category": "neutral", "max_distance": 9.0, "sounds": [{"name": "sounds/doors/door1_open1"}, {"name": "sounds/doors/door1_open2"}, {"name": "sounds/doors/door1_open3"}]}` |

## Project reference coverage

Files containing sound-related references: **21**. The complete snippets are in `audio_inventory.json`.

- `BP/scripts/main.js`: 5 reference snippet(s)
- `BP/scripts/main.ts`: 4 reference snippet(s)
- `BP/blocks/door/door1_v2.json`: 2 reference snippet(s)
- `BP/entities/scp/scp577.json`: 1 reference snippet(s)
- `BP/entities/scp/scp049.json`: 1 reference snippet(s)
- `BP/entities/scp/scp035_scientist.json`: 2 reference snippet(s)
- `BP/entities/scp/scp3199_egg.json`: 2 reference snippet(s)
- `BP/entities/scp/scp096legacy.json`: 2 reference snippet(s)
- `BP/entities/scp/scp096.json`: 2 reference snippet(s)
- `BP/entities/projectile/mp5a3.json`: 1 reference snippet(s)
- `BP/entities/projectile/scp5167_dragon_son_shot.json`: 3 reference snippet(s)
- `BP/entities/projectile/scp5167_dragon_shot.json`: 1 reference snippet(s)
- `BP/entities/projectile/scp5167_dragon_shot_fire.json`: 1 reference snippet(s)
- `BP/entities/scp5167/scp5167_dragon.json`: 1 reference snippet(s)
- `RP/blocks.json`: 2 reference snippet(s)
- `RP/manifest.json`: 1 reference snippet(s)
- `RP/sounds/sound_definitions.json`: 13 reference snippet(s)
- `RP/animations/scp/dt_scp096_new.animation.json`: 1 reference snippet(s)
- `RP/animations/scp/dt_scp106.animation.json`: 1 reference snippet(s)
- `RP/animations/scp/dt_scp3199.animation.json`: 1 reference snippet(s)
- `RP/animation_controllers/scp/scp066.json`: 2 reference snippet(s)

## Findings

Existing portal definitions and assets are recorded as part of the inventory and must be preserved. Any missing path or unused sound is an audit finding only; this phase does not delete or rename definitions.

