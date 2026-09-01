# THREE REALMS — FINAL QA REPORT

Date: 2026-09-01
Project: Haunted / Nightmare Realm
Target: Minecraft Bedrock 1.26.x

## Final status

**PASS WITH DOCUMENTED LIMITATIONS** for static production QA.

Interactive gameplay and mobile measurements remain **NOT TESTED — ENVIRONMENT LIMITATION**.

## Task gate summary

| Task | Status |
|---|---|
| 1 Portal | PASS WITH DOCUMENTED LIMITATIONS |
| 2 Tooling/package baseline | PASS WITH DOCUMENTED LIMITATIONS |
| 3 SCP horror content | PASS WITH DOCUMENTED LIMITATIONS; SCP-173 BLOCKED by absent `lc:dt_broom` |
| 4 Blocks/items | PASS WITH DOCUMENTED LIMITATIONS |
| 5 Weapons | PASS WITH DOCUMENTED LIMITATIONS |
| 6 Structures | PASS WITH DOCUMENTED LIMITATIONS; deterministic functions, not proven automatic worldgen |
| 7 Regions | PASS WITH DOCUMENTED LIMITATIONS |
| 8 Encounters | PASS WITH DOCUMENTED LIMITATIONS |
| 9 Audio | PASS WITH DOCUMENTED LIMITATIONS |
| 10 Morgue Warden | PASS WITH DOCUMENTED LIMITATIONS |
| 11 Lady of the Crypt | PASS WITH DOCUMENTED LIMITATIONS |
| 12 The Nightmare | PASS WITH DOCUMENTED LIMITATIONS |
| 13 Lore | PASS WITH DOCUMENTED LIMITATIONS |
| 14 Progression/loot | PASS WITH DOCUMENTED LIMITATIONS |
| 15 World integration | PASS WITH DOCUMENTED LIMITATIONS |
| 16 Deep repair | PASS WITH DOCUMENTED LIMITATIONS; Watcher visual remains BLOCKED |
| 17 Performance review | PASS WITH DOCUMENTED LIMITATIONS |
| 18 MCT/render QA | PASS; static render/validation only |
| 19 Package QA | PASS |
| 20 Runtime/mobile QA | PARTIAL |

## Final evidence

- Test suite: **68 PASS / 0 FAIL**.
- JSON parse audit: **359 JSON files / 0 parse errors**.
- Current package: **488 entries**, archive integrity PASS, BP/RP manifests present, bosses present, no vendor/staging/.git leakage.
- MCT: v0.17.8 available under the temporary workspace; isolated validation previously recorded 42 schema passes and no production schema errors apart from the documented `functions/load.json` validator limitation.
- Rendering: MCT static model rendering was previously completed for the production geometry set; this is not Minecraft runtime evidence.
- BDS: real 1.26.45.1 executable provisioned; current BP deployed and verified identical to source.

## Repairs verified during Task 20

1. Supported entity event command form (`queue_command`) retained.
2. Custom structure block IDs use `three_realms:` namespace.
3. Structure loot insertion syntax no longer includes invalid container slot tokens.
4. SCP-096 breakable block IDs corrected for BDS parsing.
5. Test harness package-root assertions corrected to match the actual `.mcaddon` layout (`BP/`, `RP/`).

## Remaining blockers and limitations

- `three_realms:haunted_watcher` has no approved production RP client/texture asset. Its encounter was safely deactivated; no replacement art was invented.
- SCP-173 remains blocked because `lc:dt_broom` is absent from the approved source.
- Interactive Bedrock client testing was not available.
- Portal, encounters, AI, combat, bosses, structures, audio, lore, save/reload, multiplayer, and mobile performance are not runtime-verified.
- A fresh post-fix BDS content log could not be captured because the MCT broker manages and respawns the server process; the deployed source was nevertheless byte-verified and static tests pass.

## Git

Branch: `master`

Last recorded clean project checkpoint before the final runtime-source fixes: `de79914`.

The current working tree contains intentional Task 20 runtime repairs, package rebuild, test-harness correction, and this final report. No push was performed.
