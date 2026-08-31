# Haunted Portal Test Report

Date: 2026-08-31
Scope: existing portal only.

## Static and tool results

| Test | Status | Evidence |
|---|---|---|
| JavaScript syntax | PASS | `node --check BP/scripts/main.js` |
| JSON syntax | PASS | Python JSON parse over production source JSON |
| MCTools current-platform validation | PASS | `mct validate currentplatform`, exit 0 |
| MCTools root `validate main` | FAIL/SCOPE-LIMITED | Root scan includes archived backup packs and reports duplicate/missing archived assets; log saved under `/tmp/three_realms_workspace/validation/gate_main.log` |
| MCTools root `validate addon` | FAIL/SCOPE-LIMITED | Same recursive backup-scan findings; log saved under `/tmp/three_realms_workspace/validation/gate_addon.log` |
| MCTools root `validate all` | FAIL/SCOPE-LIMITED | Same recursive backup-scan findings; log saved under `/tmp/three_realms_workspace/validation/gate_all.log` |
| Package creation | PASS | JS-only staging export using `mct exportaddon` |
| Archive integrity | PASS | `unzip -tq ~/three_realms/build/staging_portal_js.mcaddon` |
| Package extraction/contents | PASS | Extracted under `/tmp/three_realms_workspace/package_inspection/`; both packs and portal assets present |
| Original artifact preservation | PASS | SHA-256 remains `9fa24fd4099d14667fa3d6b088fb91ce43e658e1a04d9e39e16374e6f66d0025` |

## Acceptance matrix

- Frame: PASS by static/code review; runtime NOT TESTED
- Activation: PASS by static/code review; runtime NOT TESTED
- State machine: PASS by static/code review; runtime NOT TESTED
- Portal surface: PASS by references/static review; runtime NOT TESTED
- Physical entry: PASS by code-condition review; runtime NOT TESTED
- Teleport: PARTIAL; guarded implementation, no runtime available
- Safe destination: PASS by bounded code review; runtime NOT TESTED
- Return: PARTIAL; dynamic-property coordinate persistence implemented, runtime NOT TESTED
- Cooldown: PASS by code review; runtime NOT TESTED
- Multiplayer: CODE-REVIEWED; runtime NOT TESTED
- Save/reload: REVIEWED; active state and cooldown maps are memory-backed
- Mobile performance: REVIEWED; bounded interval and scans, runtime profiling NOT TESTED
- MCTools: PARTIAL — isolated platform validation PASS, recursive root addon modes contaminated by retained backups
- Build: PARTIAL — JS packaging PASS; automatic TypeScript build fails in MCTools/esbuild-wasm on Node 24
- Package: PASS for generated JS-runtime `.mcaddon`

## Runtime tests unavailable

NOT TESTED — ENVIRONMENT LIMITATION:

- valid/invalid frame in Bedrock
- wrong-item and Soul Igniter interaction in Bedrock
- activation timing and state transitions in Bedrock
- physical entry and teleport
- custom-dimension registration
- return portal
- cooldown behavior in-game
- multiplayer
- save/reload
- Android/iOS rendering and performance
- content log
