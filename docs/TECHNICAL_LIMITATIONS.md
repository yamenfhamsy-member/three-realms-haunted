# Technical Limitations — Baseline

- No Minecraft Bedrock client/server runtime is available in this audit environment; gameplay and visual behavior are not tested.
- The artifact declares minimum engine version 1.26.40 and `@minecraft/server` 2.9.0, but the exact installed game build is unknown.
- Official current custom-dimension documentation still identifies the API as experimental/Beta-oriented. The required world experiment and manifest approach need verification in the target 1.26.40 runtime.
- `registerCustomDimension` creates a void-generator dimension. The baseline does not contain terrain generation, region files, structures, or a Haunted entry area.
- Portal records, per-player cooldowns, and return locations are stored in JavaScript Maps only; they do not survive save/reload/process restart.
- The runtime entry is compiled/included `BP/scripts/main.js`; `BP/scripts/main.ts` is materially different and uses a stale/different item-use event path. There is no build configuration to reconcile them automatically.
- The source contains duplicate and test-named model/PNG files with no active references. They remain retained as baseline files.
- The portal script catches custom-dimension and particle errors, which can hide runtime failures until the Minecraft content log is inspected.
- The portal geometry uses 16×16 UV declarations with 1920×1920 RGB PNGs. This was not visually verified.
- No custom entities, bosses, recipes, loot, spawn rules, structures, animations, render controllers, animation controllers, custom particles, or functions are present.
