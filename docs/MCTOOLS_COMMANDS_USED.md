# MCTools Commands Used — Portal Quality Gate

Tool: `@minecraft/creator-tools` / `mct` 0.17.8
Location: `/tmp/three_realms_workspace/tools/creator-tools/node_modules/.bin/mct`

## Discovery

- `mct --version` — PASS; returned `0.17.8`.
- `mct --all-commands --help` — PASS; command list captured at `/tmp/three_realms_workspace/validation/commands_help.log`.
- `mct exportaddon --help` — PASS; confirmed `-i`, `-o`, and `--format` syntax.

## Validation

- `mct validate main` — FAIL on production root scan because MCTools scans retained backup artifacts and reports duplicate packs; it also reported missing pack icons in the scanned baseline copies and a duplicate sound-definition finding from the archived baseline. These are scan-scope findings, not a clean isolated pack result.
- `mct validate addon` — FAIL on production root scan for the same backup-scope findings plus cooperative-addon recommendations. The production source packs were not deleted or reorganized merely to satisfy a recursive root scan.
- `mct validate currentplatform` — PASS; exit code 0.
- `mct validate all` — FAIL on production root scan for backup-scope findings and sound-definition/pack-icon findings.

Validation logs:

```text
/tmp/three_realms_workspace/validation/gate_main.log
/tmp/three_realms_workspace/validation/gate_addon.log
/tmp/three_realms_workspace/validation/gate_platform.log
/tmp/three_realms_workspace/validation/gate_all.log
/tmp/three_realms_workspace/validation/regression_platform.log
```

## Packaging

- `mct exportaddon -i /tmp/three_realms_workspace/staging_portal_js -o ~/three_realms/build --format mcaddon` — PASS.
- The staging project intentionally excluded `main.ts` only for packaging because the installed CLI attempts an automatic TypeScript build and fails under the available Node 24/esbuild-wasm path. Runtime `main.js` was unchanged and included.
- `unzip -tq ~/three_realms/build/staging_portal_js.mcaddon` — PASS.
- Extracted package inspection under `/tmp/three_realms_workspace/package_inspection/` — PASS; both packs, manifests, blocks, item, runtime script, textures, geometry, and sounds are present.

## Important limitations

- No Minecraft Bedrock client or BDS is installed; runtime portal behavior remains NOT TESTED.
- The MCTools root scan includes `backups/`; therefore its recursive addon validation reports archived packs as duplicates. A clean staging-pack validation should be used for future gates.
- `mct exportaddon` automatic TypeScript compilation failed with `RangeError: Invalid array length` inside `esbuild-wasm` on Node.js 24. The JS-only staging export succeeded.
