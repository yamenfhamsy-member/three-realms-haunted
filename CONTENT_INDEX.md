# Content Index — Baseline

**Baseline date:** 2026-08-31  
**Scope:** baseline plus Task 1 portal hardening; no new gameplay content or visual assets added.

## Summary

| Category | Actual count |
|---|---:|
| Behavior Pack block definitions | 2 |
| Resource Pack block mappings | 2 |
| Items | 1 |
| Entities / client entities | 0 |
| Recipes | 0 |
| Loot tables | 0 |
| Spawn rules | 0 |
| Structures | 0 |
| Geometry JSON | 2 |
| Animations / controllers | 0 |
| Render controllers | 0 |
| Custom particles | 0 |
| Sound files | 2 |
| Texture PNG files | 6 |
| Scripts | 2 files; `main.js` is the runtime entry |

## Existing gameplay content

| Identifier | Display name | Category | Purpose | Behavior path | Resource path | Texture / model / animation / controller | Particles / sounds | Source / license | Status |
|---|---|---|---|---|---|---|---|---|---|
| `three_realms:haunted_portal` | Haunted Gate | Block / portal frame | Physical 5×6 portal frame | `BP/blocks/haunted_portal.json`; `BP/scripts/main.js` | `RP/blocks.json`; `RP/models/blocks/haunted_gate.geo.json` | `RP/textures/blocks/haunted_gate_frame.png`; `geometry.three_realms.haunted_gate`; no animation/controller | Restrained vanilla particle IDs in script; activation and teleport OGG sounds | User-provided local baseline; license not stated | Hardened Task 1; static validation passed; runtime not tested |
| `three_realms:cursed_gate_core` | Cursed Gate Core | Block / portal surface | 3×4 active portal surface | `BP/blocks/cursed_gate_core.json`; `BP/scripts/main.js` | `RP/blocks.json` | `RP/textures/blocks/cursed_gate_core.png`; full-block geometry; no animation/controller | Restrained vanilla particle IDs in script; no direct block sound beyond `glass` mapping | User-provided local baseline; license not stated | Hardened Task 1; static validation passed; runtime not tested |
| `three_realms:soul_igniter` | Soul Igniter | Item / activation | Starts the existing portal state machine on block use | `BP/items/soul_igniter.json`; `BP/scripts/main.js` | `RP/textures/item_texture.json` | `RP/textures/items/soul_igniter.png`; no model/animation/controller | Triggers activation sound | User-provided local baseline; license not stated | Hardened Task 1; static validation passed; runtime not tested |

## Non-production/orphan candidates found

- `RP/models/blocks/haunted_gate_test.geo.json` — no active reference found.
- `RP/models/blocks/haunted_gate.png` — no active reference found.
- `RP/models/blocks/haunted_gate_test.png` — no active reference found.
- `RP/models/blocks/cursed_gate_core.png` — duplicate of the active core texture path; no active reference found.

These files are retained unchanged for baseline preservation and must not be assumed unused in a future task without checking intended authoring workflow.
