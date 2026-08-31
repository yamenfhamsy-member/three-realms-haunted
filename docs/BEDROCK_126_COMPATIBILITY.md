# Bedrock 1.26.x Compatibility

**Audit date:** 2026-08-31  
**Project target family:** Minecraft Bedrock Mobile 1.26.x  
**Artifact evidence:** `~/three_realms/three_realms_haunted.mcaddon`

## Version facts from the artifact

| Field | Actual value | Evidence / status |
|---|---|---|
| BP `format_version` | `2` | Confirmed in `BP/manifest.json` |
| RP `format_version` | `2` | Confirmed in `RP/manifest.json` |
| BP `header.min_engine_version` | `[1, 26, 40]` | Confirmed in `BP/manifest.json` |
| RP `header.min_engine_version` | `[1, 26, 40]` | Confirmed in `RP/manifest.json` |
| Script dependency | `@minecraft/server` `2.9.0` | Confirmed in `BP/manifest.json` |
| Runtime script entry | `scripts/main.js` | Confirmed in BP manifest |
| BP block format versions | `1.21.60` | Confirmed in both BP block files |
| RP block mapping format | `1.21.0` | Confirmed in `RP/blocks.json` |
| Geometry format | `1.12.0` | Confirmed in both geometry JSON files |
| Sound definitions format | `1.14.0` | Confirmed in `RP/sounds/sound_definitions.json` |
| Exact installed game version | Not stated | No client/server metadata in the artifact |
| Runtime test version | None | Not tested in this environment |

The artifact therefore declares **1.26.40 as its minimum engine version**, not proof that every 1.26.x release works. The highest/actual installed Minecraft version is unknown.

## Official documentation verification

- Microsoft’s [1.26.40 Creator Update Notes](https://learn.microsoft.com/en-us/minecraft/creator/documents/update1.26.40?view=minecraft-bedrock-stable) confirms Bedrock 1.26.40 and release of stable `@minecraft/server` v2.9.0.
- The [DimensionRegistry API page](https://learn.microsoft.com/en-us/minecraft/creator/scriptapi/minecraft/server/dimensionregistry?view=minecraft-bedrock-stable) confirms `registerCustomDimension(typeId)` and that registration must occur during the system startup event. It also says the registered dimension uses the void generator.
- Microsoft’s [Custom Dimension API tutorial](https://learn.microsoft.com/en-us/minecraft/creator/documents/scripting/custom-dimension-api-tutorial?view=minecraft-bedrock-stable) still labels custom dimensions experimental, describes Beta APIs, requires a world with the Beta APIs experiment in its tutorial prerequisites, and requires destination chunks/platforms to be prepared before teleporting.
- The [@minecraft/server changelog](https://learn.microsoft.com/en-us/minecraft/creator/scriptapi/minecraft/server/changelog?view=minecraft-bedrock-stable) records `DimensionRegistry` and `StartupEvent.dimensionRegistry` in the 2.8.0 API history and the 2.9.0 release changes. It also records removal/migration of older event properties, which is relevant to the included TypeScript source.

## Compatibility classification

### Confirmed by files

- Manifest schema is JSON-valid.
- BP and RP UUID dependency linkage is internally consistent.
- Declared script API matches the API version shipped with Bedrock 1.26.40 according to the official update notes.
- Runtime entry `main.js` is syntactically valid JavaScript.

### Documentation verified

- Custom dimension registration belongs in `system.beforeEvents.startup`.
- Custom dimensions are void-generator destinations unless the script builds a landing area.
- Destination chunks should be loaded/prepared before placing blocks or teleporting.
- The runtime script’s use of `world.beforeEvents.itemUse` and `world.afterEvents.worldLoad` is aligned with the current event direction; the included TypeScript source uses a different/stale event path and must not be assumed current.

### Not tested

- Pack import into Minecraft Bedrock 1.26.40.
- Pack loading on Android or iOS.
- Beta APIs experiment behavior for custom dimensions.
- Custom dimension registration and destination generation.
- Frame placement, Soul Igniter activation, state transitions, particles, sounds, or teleportation.
- Multiplayer behavior.
- Save/reload/process-restart persistence.
- Visual correctness of 1920×1920 textures with the geometry’s declared 16×16 UV dimensions.

## Compatibility and version risks

1. **Custom-dimension experiment risk:** official tutorial material still describes this API as experimental/Beta, while the artifact declares stable `@minecraft/server` 2.9.0. The required world experiment and final manifest approach must be verified in the target 1.26.40 runtime.
2. **Void destination risk:** registration alone creates no Haunted terrain. The current script only creates a small return gate and no realm generation.
3. **Persistence risk:** portal state, cooldowns, and return positions use in-memory Maps. They are not durable across save/reload or process restart.
4. **Source drift risk:** `main.ts` uses `world.afterEvents.itemUseOn`, accepts obsidian, and has different portal logic than the manifest-executed `main.js`. It is not a safe build source without reconciliation.
5. **Minimum-version risk:** `[1,26,40]` is higher than early 1.26.x releases. Compatibility with 1.26.0–1.26.39 is not claimed or tested.
6. **Older content formats:** block and geometry definitions retain 1.21.x-era format versions. They parsed statically, but should not be mass-upgraded without testing because 1.26.40 introduced validation and rendering changes.
7. **Missing build metadata:** there is no TypeScript compiler configuration, package manifest, API typings package, or reproducible build command in the artifact.
8. **Error visibility risk:** custom-dimension and particle failures are caught in the runtime script; a content-log review in Minecraft is still required.

## Current compatibility conclusion

**Static compatibility status: PARTIAL / DOCUMENTATION VERIFIED.** The declared target and server API match the official 1.26.40 release notes, but the portal and custom dimension are **NOT runtime tested**. Treat the next Haunted Portal task as a compatibility/stability task first. Do not claim all 1.26.x support until a specific game version is tested.
