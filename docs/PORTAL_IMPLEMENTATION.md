# Haunted Portal Implementation

**Task:** 1 — Audit and harden the existing Haunted Portal  
**Status:** Implemented and statically validated; runtime not tested in this environment.  
**Checkpoint:** `backups/portal_checkpoint_2026-08-31_19-56-03/`

## Scope

This task hardened the existing portal prototype only. No Watcher, mobs, bosses, new portal identifiers, new visual assets, or external assets were added.

## Existing identifiers preserved

- Frame: `three_realms:haunted_portal`
- Surface: `three_realms:cursed_gate_core`
- Activation item: `three_realms:soul_igniter`
- Custom destination: `three_realms:haunted`
- Geometry: `geometry.three_realms.haunted_gate`

## Implemented flow

1. A player builds the exact existing 5-block-wide × 6-block-high frame from `three_realms:haunted_portal` blocks.
2. The 3×4 interior must be air-like before activation.
3. The player intentionally uses `three_realms:soul_igniter` on a block near the frame.
4. The script locates the complete frame using a bounded local scan.
5. The portal transitions through `ACTIVATING`, `CHARGING`, `OPENING`, then `ACTIVE`.
6. The existing core block is placed across the 3×4 opening only for `OPENING` and `ACTIVE`.
7. Players are detected inside the physical opening, not merely at a coordinate trigger.
8. The custom dimension is registered during the startup event.
9. The custom dimension receives an obsidian arrival platform at y=64 before the destination is used.
10. The player is teleported to `(0.5, 66, 0.5)` only after the destination safety check succeeds.
11. The previous Overworld location is saved to the player dynamic property `three_realms:return_location`.
12. Returning players use their persisted safe location, then the fallback, then the world default spawn if safe.

## Hardening changes

- Replaced broad `world.beforeEvents.itemUse` activation with documented `world.afterEvents.itemStartUseOn`, which gives the interacted block and source player.
- Removed the TypeScript/runtime behavior drift; `main.ts` now mirrors the runtime logic.
- Enforced the custom frame block only; obsidian is not accepted as a player-built frame.
- Added explicit air-like interior validation before activation.
- Revalidated the frame during each transition and while active; breaking the frame deactivates the portal.
- Added duplicate activation protection for all non-`INACTIVE` states.
- Added guarded sound, message, particle, dimension, block, and teleport operations with content-log warnings.
- Added a one-time return-gate initialization promise to avoid duplicate setup races.
- Added temporary ticking-area loading around the custom-dimension platform and return gate.
- Added an obsidian arrival platform so the void dimension has a safe landing surface.
- Added destination feet/head/below-block safety validation.
- Added persistent player return-location storage through dynamic properties.
- Added rollback of the per-player cooldown if teleport throws.
- Added bounded player detection radius and bounded portal scan ranges.
- Kept existing textures, geometry, sounds, identifiers, UUIDs, and manifests unchanged.

## Official references used

- [Custom Dimensions Sample](https://learn.microsoft.com/en-us/samples/microsoft/minecraft-samples/custom-dimensions-sample/)
- [Building with the Custom Dimension API](https://learn.microsoft.com/en-us/minecraft/creator/documents/scripting/custom-dimension-api-tutorial?view=minecraft-bedrock-stable)
- [DimensionRegistry](https://learn.microsoft.com/en-us/minecraft/creator/scriptapi/minecraft/server/dimensionregistry?view=minecraft-bedrock-stable)
- [ItemStartUseOnAfterEvent](https://learn.microsoft.com/en-us/minecraft/creator/scriptapi/minecraft/server/itemstartuseonafterevent?view=minecraft-bedrock-stable)
- [ItemStartUseOnAfterEventSignal](https://learn.microsoft.com/en-us/minecraft/creator/scriptapi/minecraft/server/itemstartuseonaftereventsignal?view=minecraft-bedrock-stable)
- [TickingAreaManager](https://learn.microsoft.com/en-us/minecraft/creator/scriptapi/minecraft/server/tickingareamanager?view=minecraft-bedrock-stable)
- [Entity](https://learn.microsoft.com/en-us/minecraft/creator/scriptapi/minecraft/server/entity?view=minecraft-bedrock-stable)
- [Minecraft Bedrock 1.26.40 Creator Update Notes](https://learn.microsoft.com/en-us/minecraft/creator/documents/update1.26.40?view=minecraft-bedrock-stable)

## Assets reused

No external assets were downloaded. Existing local assets were retained unchanged:

- `RP/textures/blocks/haunted_gate_frame.png`
- `RP/textures/blocks/cursed_gate_core.png`
- `RP/textures/items/soul_igniter.png`
- `RP/models/blocks/haunted_gate.geo.json`
- `RP/sounds/haunted_activate.ogg`
- `RP/sounds/haunted_teleport.ogg`

Source/license: user-provided local baseline; no external provenance metadata was available.

## Known limitations

- Custom Dimensions remain described as experimental/Beta-oriented by current official tutorial material; the target world experiment and actual 1.26.40 runtime must be verified.
- The Haunted destination is still a void-generator dimension with only a generated obsidian arrival platform and return gate. It is not yet a complete realm.
- Portal records and cooldowns remain in-memory. The return location itself is persisted, but active portal state is rebuilt only by script initialization.
- There is no true `TELEPORTING` state exposed to visuals; teleport is guarded as an operation but the existing asset set has no separate visual/audio state for it.
- No custom particle files exist; the implementation uses restrained vanilla particle IDs.
- No Minecraft runtime, mobile, multiplayer, or save/reload test was available.
