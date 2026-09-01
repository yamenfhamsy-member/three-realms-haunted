# TASK 17 — GLOBAL INTEGRATION + MOBILE PERFORMANCE REPORT

**Date:** 2026-09-01
**Scope:** Whole-project mobile-Bedrock performance review. No gameplay changes, no asset-quality reductions.

## 1. Inventory metrics

| Layer | Count | Notes |
|---|---|---|
| BP entities | 58 | 55 SCP/derived + 3 bosses (+1 deactivated watcher BP) |
| Client entities (RP) | 56 | all chains verified closed in Task 16 scan (0 broken) |
| Geometry files | 56 | largest: `dt_scp001_gg_new.geo.json` 49 KB, `dt_scp4959.geo.json` 47 KB — modest bone/cube counts |
| Animations | 45 files | per-entity, no shared/global tick drivers |
| Functions | 22 | 11 encounters, 9 structures, 2 world builders, 1 scoreboard init |
| Textures | 89 PNG | 7.6 MB total; no duplicate hashes |
| Audio | 8 OGG / 10 defs | 148 KB; all defs resolve to real files |
| Particles | 3 | portal-only; no per-entity particle spam |
| Spawn rules | 23 | all use population control pools |
| Scripts | main.ts + main.js | one `runInterval`, 3 one-shot `runTimeout`s |
| Package | 567 entries | 12.7 MB compressed; BP 0.6 MB / RP 16.4 MB uncompressed |

## 2. Risk analysis (mobile Bedrock)

| Area | Finding | Risk | Action |
|---|---|---|---|
| **Portal tick loop** | Single `system.runInterval(…, 10)` — iterates only *active portals* (small in-memory map), player query radius 2.3, no world scans | LOW | None — event-driven activation + narrow interval is the correct pattern |
| **Encounter functions** | All 11 guarded with `unless entity @e[type=…,r=24]`, one entity max, no tick loops, no global scans | LOW | None |
| **Boss AI** | 3 bosses × 6 behavior components each — comparable to vanilla hostiles; phases via `has_damage` thresholds, not polling scripts | LOW | None |
| **Spawn pressure** | 23 spawn rules all bound to population-control pools; no persistent/ambient flooding; watcher (invisible risk) deactivated in Task 16 | LOW | None |
| **Textures** | 3 large PNGs: `cursed_gate_core.png` 2.6 MB, `haunted_gate_frame.png` 2.4 MB, `soul_igniter.png` 2.2 MB — these 3 alone are ~91% of texture bytes | **MEDIUM** | Documented only. Per policy: no downscale/repaint. If mobile memory issues appear at runtime, these are the first candidates for an approved-asset replacement, not a blind resize |
| **Package size** | 12.7 MB compressed — fine for an add-on (vanilla-scale) | LOW | None |
| **Scripts** | 3 event handlers + 1 narrow interval; no per-tick entity iteration, no growing collections (portals map self-cleans on failure) | LOW | None |
| **Audio** | 10 short cues, no loops, no per-tick triggering | LOW | None |
| **Structures** | Deterministic functions run once per build call; 22 `@e[]` selector uses total, all inside guarded `unless entity` checks | LOW | None |

## 3. High-risk items

**None found.** The one MEDIUM (oversized portal/igniter textures) is asset-quality-sensitive and explicitly deferred to runtime evidence (Task 20) before any change.

## 4. Validation

| Check | Result |
|---|---|
| Test suite | **68/68 PASS** |
| Package | 567 entries, 12.7 MB, no leakage |
| Reference graph | 0 broken chains (Task 16 corrected scanner) |
| MCT | UNAVAILABLE IN THIS ENVIRONMENT |
| **Runtime performance** | **NOT TESTED — ENVIRONMENT LIMITATION** (no Bedrock runtime; FPS/memory unmeasurable here) |

## 5. Optimizations applied

None required — no technically-justified optimization was found that would not either (a) damage approved asset quality, or (b) alter working event-driven logic. The architecture already follows the preferred patterns: event-driven activation, guarded one-shot encounters, population-pooled spawns, no global scans or tick loops.

## Final gate

**TASK 17: PASS (static review)** · Tests: 68/68 · Package: PASS · Regression 1→17: PASS · **Runtime: NOT TESTED — ENVIRONMENT LIMITATION**
