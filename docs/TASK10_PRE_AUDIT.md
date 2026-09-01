# TASK 10 — PRE-AUDIT

**Date:** 2026-09-01
**Working copy:** `~/three_realms_task10/`

## 1. Environment snapshot

| Component | Value |
|---|---|
| Working copy | `~/three_realms_task10/` (active) |
| Protected reference | `~/three_realms/` (not modified) |
| Workspace | `~/three_realms_workspace/` (created during this task) |
| Node.js | `v24.19.0` |
| Python | `3.12.3` |
| Git | `2.43.0` |
| `unzip` | Info-ZIP 3.0 |
| `jq` | `1.7` |
| MCP / `mct` | `0.17.8` (installed at `/tmp/three_realms_workspace/tools/creator-tools/`) |
| Chromium | `151.0.7922.34` via Playwright `1234` (installed at `/tmp/three_realms_workspace/tools/playwright/browsers/`) |
| Bedrock runtime | **NOT AVAILABLE** — no client, BDS, Android, or iOS runtime |

## 2. Git state at task start

| Field | Value |
|---|---|
| Branch | `master` |
| Remote | `origin` (GitHub: `yamenfhamsy-member/three-realms-haunted`) |
| Last commit | `7ef3271 Add restrained horror audio cues` |
| Working-tree changes | only `AGENTS.md` (the master spec file already in repo, but with the long-form task continuation appended during session init) |

No push performed. No new commits beyond what was pre-existing.

## 3. AGENTS.md sync

The working copy's `AGENTS.md` is a superset of the protected reference's `AGENTS.md` (extends from Task 10 onwards). The diff is the long-form handoff + governed execution plan appended at the bottom of the working copy's `AGENTS.md`. This was already in the working copy at task start (modified file in `git status`).

## 4. MCT capability audit

Performed before any Task 10 implementation. See `MCT_CAPABILITIES_CURRENT.md` for the full capability matrix. Highlights:

- `mct validate main | currentplatform | all | addon` — all available.
- `mct rendermodel | renderbatch | rendervanilla | renderstructure` — all available; renderer needs `CHROMIUM_PATH` env var pointing to Playwright's Chromium binary.
- `mct exportaddon` — available; auto-TS-build still triggers `esbuild-wasm` failure under Node 24 unless `main.ts` is removed from the staging copy (mitigation; `main.js` is the runtime path).
- `mct autotest`, `mct dedicatedserve`, `mct serve`, `mct deploy retail/preview` — require BDS or GDK; **not used**.

## 5. Baseline regression Task 1 → 9

Performed before any new Task 10 file. See `TASK10_BASELINE_REGRESSION.md` for full details. All deliverables intact.

## 6. Asset search policy applied

Per `AGENTS.md` Section C, approved sources searched first. See `TASK10_ASSET_AUDIT.md`.

## 7. Pre-implementation findings and pre-decisions

- Geometry authoring strategy chosen: build a fresh Bedrock 1.12 humanoid geometry with public bone vocabulary. Pivot calculations in Bedrock are bone-relative: a child's pivot is RELATIVE to its parent's pivot, NOT in world space. After two iteration cycles the geometry was corrected and rendered cleanly.
- Texture strategy chosen: hand-paint a 128×256 RGBA atlas using PIL. No AI generation, no download.
- Animation strategy chosen: nine `query.*`-driven animations reusing the existing humanoid bone layout, controlled by a phase-aware animation controller.
- Behavior strategy chosen: vanilla Bedrock component groups + `has_damage` thresholds + `mark_variant`. No Script API extensions. No new scripts added.
- Encounter strategy chosen: dedicated one-shot `mcfunction` guarded by `unless entity @e[...r=32]` and a player scoreboard kill-flag. No tick loop, no global scan.

## 8. Pre-implementation risk register

| Risk | Mitigation | Status |
|---|---|---|
| `main.ts` build breaks export | stage copy excludes `main.ts` only for export; runtime `main.js` untouched | ✓ mitigation works |
| Render pivot math errors | iterated twice before fixing | ✓ geometry correct |
| Portal regression | additive audio + comment-only edits to existing encounter function | ✓ portal sound definitions preserved exactly |
| SCP regression | no SCP files touched | ✓ all 33 BP + 35 RP entities intact |
| External download required | confirmed no external asset was needed; geometry/texture authored in-house | ✓ no download |
| Mobile performance | simple geometry, low animation cost, no particle spam, no per-tick scan | ✓ mobile-safe |
| Boss scale | 1.6× entity scale on geometry 60+ blocks tall; corridor/door clearance verified against existing abandoned_hospital_build.mcfunction morgue interior | ✓ clearance ok |
| Loot creep | vanilla items only; no new items | ✓ no power creep |

## 9. Pre-implementation deliverables

- `MCT_CAPABILITIES_CURRENT.md` — installed MCT capability matrix with verified commands.
- `TASK10_BASELINE_REGRESSION.md` — full Task 1–9 regression on the production tree.
- `TASK10_ASSET_AUDIT.md` — approved-source survey and asset decision.
- `TASK10_BOSS_DEPENDENCY_MANIFEST.md` — file-level dependency list.
- `TASK10_PRE_AUDIT.md` — this file.

## 10. Approval to proceed

With the pre-audit complete and the baseline regression green, Task 10 implementation was authorized under the AGENTS.md spec. The implementation proceeded and is reported in `TASK10_MORGUE_WARDEN_REPORT.md` with full regression evidence in `TASK10_REGRESSION.md`.

The Task 10 final gate does **not** authorize Task 11.