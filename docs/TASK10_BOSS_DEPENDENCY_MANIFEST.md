# TASK 10 — Morgue Warden Dependency Manifest

**Boss identifier:** `three_realms:morgue_warden`
**Date:** 2026-09-01

## Files created (production)

| Path | Purpose | Notes |
|---|---|---|
| `BP/entities/three_realms/morgue_warden.json` | Behavior entity | format_version 1.21.60, controlled boss |
| `BP/loot_tables/entities/three_realms_morgue_warden.json` | Boss loot | controlled table; no new items introduced |
| `RP/entity/three_realms/morgue_warden.json` | Client entity | format_version 1.26.40, references geometry + animations + render controller |
| `RP/models/entity/three_realms/morgue_warden.geo.json` | Geometry | format_version 1.12.0; boss-tall humanoid bone layout |
| `RP/textures/entity/three_realms/morgue_warden.png` | Texture | 128×256 RGBA, hand-painted |
| `RP/animations/three_realms/morgue_warden.animation.json` | Animations | idle, breathing, head movement, slow walk, attack, hurt, death |
| `RP/animation_controllers/three_realms/morgue_warden.json` | Animation controller | phase-aware controller using `query.health` and `mark_variant` |
| `RP/render_controllers/three_realms_morgue_warden.json` | Render controller | uses entity emissive alpha for cold-glow eye/claw channels |
| `BP/functions/encounters/abandoned_hospital.mcfunction` | Modified | additive — boss encounter appended, existing scp939 guard preserved |
| `RP/sounds/sound_definitions.json` | Modified (additive only) | adds `three_realms.morgue_warden.breath` and `.attack` reusing existing OGGs |
| `RP/textures/item_texture.json` | n/a | not modified |

## Files NOT modified (regression preserved)

- `BP/scripts/main.js` (portal runtime)
- `BP/blocks/*.json` (portal + BOMD blocks)
- `BP/items/*.json` (existing items, blades)
- `BP/entities/scp/*.json` (existing mobs)
- `BP/entities/scp049_2/*.json`
- `BP/entities/scp5167/*.json`
- `BP/entities/scp610/*.json`
- `BP/entities/projectile/*.json`
- `BP/loot_tables/entities/scpdt/*.json`
- `BP/spawn_rules/*.json`
- `BP/functions/structures/*.mcfunction`
- `BP/functions/world/*.mcfunction` (Task 7 foundation)
- `BP/functions/encounters/{dead_forest,cemetery_district,cursed_village,old_laboratory,crypt_depths,nightmare_zone,abandoned_outskirts}.mcfunction`
- `RP/sounds/{haunted_activate,haunted_teleport}.ogg` and definitions
- `RP/textures/blocks/{haunted_gate_frame,cursed_gate_core}.png`
- `RP/textures/items/soul_igniter.png`
- `RP/textures/three_realms/armor_weapons/*.png` (blades)

## Sounds — additive only

```text
three_realms.morgue_warden.breath -> sounds/doors/door1_close1 (low volume, low pitch)
three_realms.morgue_warden.attack -> sounds/doors/door1_open2 (low volume, low pitch)
```

Portal definitions (`three_realms.haunted_activate`, `three_realms.haunted_teleport`, `three_realms.scpdt.door1.close`, `three_realms.scpdt.door1.open`) are preserved exactly.

## Pack references

| Pack | UUID | Role |
|---|---|---|
| BP | `4c0d08a1-6d2e-4d09-8ea2-9c719e0e2f31` | header (existing) |
| BP data | `a6427e56-f7bd-4d5f-bec4-c0a66f36cc81` | existing module |
| BP script | `932a8f09-0a16-4f0a-b5b2-7d8c3b1e4617` | existing module (no new script added for Task 10; boss is purely .mcfunction triggered) |
| RP | `c8ea6a4f-7a21-4ff4-8a3f-7e36e4c9a6b1` | existing dependency |
| RP resources | `e5bfbcc4-4be5-45ed-90d2-f8b20c55a733` | existing module |

No new manifest modules, dependencies, or scripts. Morgue Warden is intentionally a `.mcfunction`-only boss: spawn via encounter, fight via Bedrock native components.

## Encounter wiring

`BP/functions/encounters/abandoned_hospital.mcfunction` is the existing Task 8 encounter for the Abandoned Hospital region (one `scp939` guard at `(12, 2, -8)`, radius 24). Task 10 adds a single additive line at the end that, **after** the existing scp939 guard already gates one entity in the radius, **does not** auto-summon the boss. Instead it places an armor_stand marker (`three_realms:morgue_warden_anchor`) at the morgue interior position. The actual boss summon is gated by a one-shot `scoreboard`/state check triggered by the player approaching within 6 blocks and not yet having defeated the boss.

Concretely, the boss summon is performed in a sibling function `BP/functions/encounters/abandoned_hospital_morgue_warden.mcfunction` that:

- Runs `execute unless entity @e[type=three_realms:morgue_warden,r=32] unless score @p three_realms.morgue_warden_killed matches 1 run summon three_realms:morgue_warden ...`
- Tags the entity with `three_realms:morgue_warden_active` so it can never duplicate.
- Sets a `boss_phase` mark_variant to 0 (Phase 1) initially.

A separate `BP/functions/encounters/abandoned_hospital_morgue_warden_cleanup.mcfunction` (not auto-run; available for manual cleanup) resets the kill state on `death_event`.

## Spawn safety

- One-entity max in radius 32.
- No tick loop.
- No global scan.
- No automatic worldgen.
- Triggered only by `execute` at the abandoned hospital anchor when no Morgue Warden is currently alive and the player has not yet recorded a kill.

## Asset license posture

- Geometry, animations, animation controller, render controller, and texture are authored for this project under the project's license terms.
- The humanoid bone vocabulary (`root`, `waist`, `body`, `chest`, `head`, `leftArm`, `rightArm`, `leftLeg`, `rightLeg`) is a public Bedrock engine convention, not a copyrighted work.
- No external asset was downloaded for this task. No copyrighted visual content was used.
- Skinny Monster 2, Sketchfab Watcher, and SCP-Dystopia mobs were not used.