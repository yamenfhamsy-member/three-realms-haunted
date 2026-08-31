# Baseline Audit — THREE REALMS Haunted

**Audit date:** 2026-08-31  
**Source:** `~/three_realms/three_realms_haunted.mcaddon`  
**Source SHA-256:** `9fa24fd4099d14667fa3d6b088fb91ce43e658e1a04d9e39e16374e6f66d0025`  
**Audit scope:** local artifact inspection and editable-project preparation only. No external project, asset, sound, model, texture, or tool was downloaded.

## Preservation and editable project

- Original artifact remains unchanged at `~/three_realms/three_realms_haunted.mcaddon`.
- Identical inspection copy: `/tmp/three_realms_workspace/archives/three_realms_haunted_original.mcaddon`.
- Extracted inspection tree: `/tmp/three_realms_workspace/extracted/`.
- Editable Behavior Pack: `~/three_realms/BP/`.
- Editable Resource Pack: `~/three_realms/RP/`.
- Timestamped baseline backup: `~/three_realms/backups/baseline_2026-08-31_19-17-03/`.
- The backup artifact SHA-256 matches the original and temporary inspection copy.
- No Git repository metadata was present in the local project at audit time.

## Complete extracted inventory

The artifact contains **22 files**: 11 JSON files, 1 JavaScript file, 1 TypeScript source file, 1 language file, 6 PNG files, and 2 OGG files.

### Behavior Pack — `~/three_realms/BP/`

| Path | Purpose |
|---|---|
| `manifest.json` | Pack manifest, data module, script module, dependencies |
| `blocks/haunted_portal.json` | `three_realms:haunted_portal` frame block |
| `blocks/cursed_gate_core.json` | `three_realms:cursed_gate_core` portal-surface block |
| `items/soul_igniter.json` | `three_realms:soul_igniter` activation item |
| `scripts/main.js` | Runtime script entry point declared by the manifest |
| `scripts/main.ts` | Included TypeScript source/reference; not the manifest entry point |

### Resource Pack — `~/three_realms/RP/`

| Path | Purpose |
|---|---|
| `manifest.json` | Resource pack manifest |
| `blocks.json` | Sound mapping for the two custom blocks |
| `models/blocks/haunted_gate.geo.json` | Active portal geometry `geometry.three_realms.haunted_gate` |
| `models/blocks/haunted_gate_test.geo.json` | Additional test geometry; no active reference found |
| `models/blocks/haunted_gate.png` | PNG stored beside geometry; no active reference found |
| `models/blocks/haunted_gate_test.png` | PNG stored beside test geometry; no active reference found |
| `models/blocks/cursed_gate_core.png` | Duplicate PNG stored beside model files; no active reference found |
| `textures/blocks/haunted_gate_frame.png` | Frame texture atlas entry |
| `textures/blocks/cursed_gate_core.png` | Core texture atlas entry |
| `textures/items/soul_igniter.png` | Item texture |
| `textures/item_texture.json` | Soul Igniter item atlas mapping |
| `textures/terrain_texture.json` | Frame and core terrain atlas mappings |
| `sounds/sound_definitions.json` | Activation and teleport sound definitions |
| `sounds/haunted_activate.ogg` | Activation sound, mono, 22050 Hz |
| `sounds/haunted_teleport.ogg` | Teleport sound, mono, 22050 Hz |
| `texts/en_US.lang` | Three display-name translations |

## Requested category inventory

| Category | Present | Count / result |
|---|---:|---|
| Behavior Pack | Yes | 1 |
| Resource Pack | Yes | 1 |
| Manifests | Yes | 2 |
| Dependencies | Yes | `@minecraft/server` 2.9.0 plus RP UUID dependency |
| Scripts | Yes | `main.js`, `main.ts` |
| Entities | No | 0 behavior entity files |
| Client entities | No | 0 client entity files |
| Blocks | Yes | 2 behavior block definitions; 1 RP block mapping |
| Items | Yes | 1 item definition |
| Recipes | No | 0 |
| Loot tables | No | 0 |
| Spawn rules | No | 0 |
| Structures | No | 0 |
| Models / geometry | Yes | 2 geometry JSON files; 3 PNGs under `models/blocks` |
| Textures | Yes | 3 active atlas texture files plus duplicate/test PNGs |
| Animations | No | 0 |
| Animation controllers | No | 0 |
| Render controllers | No | 0 |
| Particles | No | 0 custom particle files; script uses vanilla particle IDs |
| Sounds | Yes | 2 OGG files and 1 sound definition file |
| Functions | No | 0 |

### Existing asset count

- **10 content asset files:** 2 geometry JSON files, 6 PNG files, and 2 OGG files.
- **6 PNG files** are all 1920×1920, 8-bit RGB, non-interlaced.
- **2 OGG files** are mono Vorbis at 22050 Hz.
- Exact duplicate hashes exist for:
  - `models/blocks/cursed_gate_core.png` and `textures/blocks/cursed_gate_core.png`.
  - `models/blocks/haunted_gate.png`, `models/blocks/haunted_gate_test.png`, and `textures/blocks/haunted_gate_frame.png`.
- No visual or audio asset was modified during this audit.

## Existing Haunted Portal implementation

The existing implementation is already present; no new portal was created.

### Identifiers

- Frame block: `three_realms:haunted_portal`
- Portal surface: `three_realms:cursed_gate_core`
- Activation item: `three_realms:soul_igniter`
- Script destination: `three_realms:haunted`
- Frame geometry: `geometry.three_realms.haunted_gate`

### Runtime flow in `scripts/main.js`

1. Registers `three_realms:haunted` during `system.beforeEvents.startup` using `event.dimensionRegistry.registerCustomDimension`.
2. On `world.afterEvents.worldLoad`, attempts to create a return gate at origin `(0, 79, 0)` in the custom dimension, using a temporary ticking area.
3. Listens to `world.beforeEvents.itemUse` for the Soul Igniter.
4. Searches a limited area around the player for a complete 5×6 frame at the player's Z plane.
5. Requires all 16 frame positions to be `three_realms:haunted_portal` and the 3×4 interior to be air.
6. Moves through `ACTIVATING → CHARGING → OPENING → ACTIVE` using scheduled ticks:
   - activating immediately;
   - charging after 10 ticks;
   - opening after 80 ticks;
   - active after 110 ticks total.
7. Places twelve core blocks only in `OPENING` and `ACTIVE` states.
8. Emits one vanilla particle attempt every 10 ticks while not inactive.
9. Detects players in the active opening and teleports them to `(0.5, 66, 0.5)` in `three_realms:haunted`.
10. Sends players from the Haunted dimension to the Overworld fallback `(0.5, 80, 0.5)`.
11. Uses an 80-tick per-player in-memory cooldown and a ten-minute active timeout.
12. Stores the entering player's previous location in an in-memory `Map` only.

### Source/runtime drift

`main.ts` is not equivalent to the runtime `main.js`:

- TypeScript uses `world.afterEvents.itemUseOn`; the current stable API changelog documents removal of the old `itemUseOn` property, while the runtime JS uses `world.beforeEvents.itemUse`.
- TypeScript accepts `minecraft:obsidian` as a frame block; runtime JS accepts only `three_realms:haunted_portal`.
- TypeScript checks the single center block for core placement; runtime JS fills the complete 3×4 interior.
- TypeScript does not store the previous Overworld location; runtime JS does so in memory.
- TypeScript has no ticking-area setup in `ensureReturnGate`; runtime JS does.
- The manifest executes `main.js`, not `main.ts`.

Do not compile or replace the runtime script from `main.ts` without reconciling this drift against the target API.

## Working systems identified

- Pack manifests are parseable and have unique UUIDs.
- BP-to-RP dependency UUID matches the RP header UUID.
- The two custom block identifiers are mapped in `RP/blocks.json`.
- The portal block references an existing geometry identifier.
- Terrain texture keys resolve to existing texture files.
- The Soul Igniter icon resolves to an existing texture file.
- Sound definitions resolve to existing OGG files.
- Runtime `main.js` passes Node syntax checking.
- The current implementation uses a physical 5×6 frame flow rather than time/day progression.

## Incomplete systems

- No Haunted mobs, bosses, entities, client entities, spawn rules, loot, recipes, structures, animations, animation controllers, render controllers, custom particles, or functions exist.
- No actual Haunted world generation, region content, or structure content exists.
- No persistent progression or persistent portal state exists.
- No build metadata, TypeScript configuration, or reproducible compile step exists.

## Broken references and risks

No missing primary file reference was found by the static audit. The following issues require resolution or explicit acceptance in the next portal task:

1. Custom-dimension registration errors are caught and logged, so a failed registration can leave the pack without a usable destination.
2. The custom dimension is registered as a void-generator dimension; no terrain or entry area is defined.
3. Portal state, cooldowns, and return locations are in-memory Maps and are not persisted across save/reload/process restart.
4. The return location fallback is fixed and may not be safe in an actual world.
5. `main.ts` is stale relative to `main.js` and should not be treated as the runtime source.
6. `models/blocks/haunted_gate_test.geo.json` and associated test/model PNGs have no active reference and should not be assumed production assets.
7. The geometry declares a 16×16 UV space while the PNG textures are 1920×1920; this was not visually tested.
8. The runtime catches and suppresses particle-spawn errors without recording the failing effect.
9. The artifact declares a minimum of 1.26.40; it provides no evidence for earlier 1.26.x releases.
10. No Minecraft client/server runtime or mobile-device test was available, so portal activation, teleportation, multiplayer behavior, save/reload behavior, and visual loading are **NOT TESTED**.

## Things that should not be modified during the next task without explicit technical need

- `three_realms_haunted.mcaddon` original artifact.
- The timestamped backup.
- Existing PNG and OGG artwork/audio.
- Existing geometry files unless a verified integration issue requires a technical correction.
- Pack UUIDs and namespace identifiers.
- The manifest's `main.js` entry point until the TypeScript/runtime drift is intentionally resolved.

## Audit conclusion

The baseline is a small portal prototype, not a complete Haunted Realm. Its static file references are internally coherent, but runtime functionality and 1.26.40 compatibility are not proven. The project is prepared for the next task: **HAUNTED PORTAL**, beginning with official API verification and portal stabilization rather than creating a duplicate portal.
