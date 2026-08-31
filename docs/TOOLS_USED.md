# Tools Used — Baseline Audit

**Date:** 2026-08-31

## Local tools and commands

- `mkdir -p` — created `/tmp/three_realms_workspace/` and its dedicated subdirectories.
- `cp -p` — copied the original local artifact into `/tmp/three_realms_workspace/archives/` without changing the source.
- `unzip` — extracted the artifact into `/tmp/three_realms_workspace/extracted/` and ran `unzip -tq` for archive integrity.
- `find` — enumerated the complete extracted tree and categorized file counts.
- `file` — identified JSON, JavaScript, TypeScript, PNG, and OGG file types.
- `sha256sum` — verified the original, temporary copy, backup, and copied asset hashes.
- `diff -qr` — verified that editable `BP/` and `RP/` copies match the extracted baseline.
- `grep` — inspected identifiers and cross-file references.
- Python standard library JSON parsing — checked all 11 JSON files for syntax validity and checked manifest UUID uniqueness and primary references.
- `node --check` — checked runtime `BP/scripts/main.js` syntax.

No source file, model, texture, sound, or archive was downloaded from the Internet. No external tool was installed.

## Official documentation consulted

- [Minecraft Bedrock 1.26.40 Update Notes](https://learn.microsoft.com/en-us/minecraft/creator/documents/update1.26.40?view=minecraft-bedrock-stable)
  - Confirms the 1.26.40 creator target and release of `@minecraft/server` v2.9.0.
  - Notes stricter validation and version-specific behavior changes.
- [DimensionRegistry Class](https://learn.microsoft.com/en-us/minecraft/creator/scriptapi/minecraft/server/dimensionregistry?view=minecraft-bedrock-stable)
  - Confirms custom dimensions must be registered during startup.
  - Documents `registerCustomDimension` and its void-generator behavior.
- [Building with the Custom Dimension API](https://learn.microsoft.com/en-us/minecraft/creator/documents/scripting/custom-dimension-api-tutorial?view=minecraft-bedrock-stable)
  - Documents the current scripted custom-dimension workflow.
  - States that the API is experimental, requires Beta APIs in the tutorial, and requires destination preparation/loading.
- [WorldBeforeEvents Class](https://learn.microsoft.com/en-us/minecraft/creator/scriptapi/minecraft/server/worldbeforeevents?view=minecraft-bedrock-stable)
  - Confirms current `itemUse` and player interaction event availability and the restriction that before-events cannot directly modify gameplay state.
- [WorldAfterEvents Class](https://learn.microsoft.com/en-us/minecraft/creator/scriptapi/minecraft/server/worldafterevents?view=minecraft-bedrock-stable)
  - Consulted for current after-event names, including item-use-on lifecycle events.
- [@minecraft/server Changelog](https://learn.microsoft.com/en-us/minecraft/creator/scriptapi/minecraft/server/changelog?view=minecraft-bedrock-stable)
  - Confirms `DimensionRegistry` and `StartupEvent.dimensionRegistry` history in 2.8.0, `@minecraft/server` 2.9.0 changes, and current event/API migration notes.

## Not done in this task

- No GitHub access or repository clone.
- No external asset search or download.
- No Blockbench, Blender, or other asset tool installation.
- No Minecraft client/server launch.
- No mobile-device test.
- No gameplay, multiplayer, save/reload, visual, audio, or portal runtime test.
