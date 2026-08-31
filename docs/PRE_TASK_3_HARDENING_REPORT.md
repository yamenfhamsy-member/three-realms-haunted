# Pre-Task 3 Portal Hardening Report

Date: 2026-08-31

## Scope

Complete available quality gate for the existing Haunted Portal only. No creatures, bosses, structures, weapons, armor, or unrelated gameplay content were added.

## Backup and preservation

A quality-gate backup was created at:

`backups/quality_gate_2026-08-31_20-42-15/`

The original artifact remains unchanged. SHA-256:

`9fa24fd4099d14667fa3d6b088fb91ce43e658e1a04d9e39e16374e6f66d0025`

## Bugs and issues addressed

- Fixed value-based return-gate origin comparison.
- Kept explicit supported portal-plane/frame validation and exact 5×6 outer / 3×4 inner dimensions.
- Added/retained independent technical pack icons.
- Updated texture atlas entries to the schema-compatible array form.
- Synchronized `main.ts` and runtime `main.js` logic.
- Guarded return-gate setup and bounded the arrival platform.
- Added safe feet/headroom/floor checks and cooldown rollback on teleport failure.

## MCTools validation

MCTools 0.17.8 was executed with its actual commands. `validate currentplatform` passed with exit code 0.

The root-level `validate main`, `validate addon`, and `validate all` modes returned failures because the CLI recursively scanned retained `backups/` and the original `.mcaddon`, treating archived packs as additional packs. The logs also show archived missing-icon and duplicate sound-definition findings. These are scan-scope findings; the production source packs were not deleted or reorganized to hide them.

Logs are under `/tmp/three_realms_workspace/validation/`.

## Build and package

- JavaScript syntax: PASS (`node --check BP/scripts/main.js`).
- JSON parsing: PASS for production source JSON.
- MCTools JS-only staging export: PASS.
- Generated package: `build/staging_portal_js.mcaddon`.
- `unzip -tq`: PASS.
- Extracted package inspection: PASS; both packs, manifests, portal blocks, Soul Igniter, runtime script, textures, geometry, and sounds are present.
- MCTools automatic TypeScript export path: FAIL in the tool's `esbuild-wasm` under Node.js 24 with `RangeError: Invalid array length`. The production runtime uses the existing `main.js`; `main.ts` was excluded only from temporary staging for this export test.

## Runtime testing

NOT TESTED — ENVIRONMENT LIMITATION. No Minecraft Bedrock client, BDS, Android/iOS runtime, or content-log runtime is available. Activation, physical entry, teleport, custom-dimension registration, audio, particles, multiplayer, and save/reload therefore remain uncertified by runtime evidence.

## Final gate status

- Frame: PASS — static/code review; runtime NOT TESTED
- Activation: PASS — static/code review; runtime NOT TESTED
- State machine: PASS — static/code review; runtime NOT TESTED
- Portal surface: PASS — references/static review; runtime NOT TESTED
- Physical entry: PASS — code-condition review; runtime NOT TESTED
- Teleport: PARTIAL — guarded implementation; runtime NOT TESTED
- Safe destination: PASS — bounded code review; runtime NOT TESTED
- Return: PARTIAL — dynamic-property coordinate persistence; runtime NOT TESTED
- Cooldown: PASS — per-player code review; runtime NOT TESTED
- Multiplayer: CODE-REVIEWED; runtime NOT TESTED
- Save/reload: REVIEWED; active state/cooldowns remain memory-backed
- Mobile performance: REVIEWED; runtime profiling NOT TESTED
- MCTools: PARTIAL — platform mode PASS; root scan contaminated by archived backups
- Build: PARTIAL — JS packaging PASS; TypeScript auto-build fails in toolchain
- Package: PASS — generated package integrity and contents verified

## Gate result

The available static/tooling gate is complete. Task 3 remains locked in project documentation because runtime-dependent portal behavior is not tested and the root MCTools addon scan is not clean when backups are inside the scanned project root.
