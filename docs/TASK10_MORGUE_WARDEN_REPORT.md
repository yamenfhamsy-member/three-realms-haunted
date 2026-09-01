# THREE REALMS — TASK 10 MORGUE WARDEN REPORT

**Final status: TASK 10 PASS (STATIC BOSS FOUNDATION)**
**Boss runtime:** NOT TESTED — ENVIRONMENT LIMITATION.

## 1. Boss identity

| Field | Value |
|---|---|
| Identifier | `three_realms:morgue_warden` |
| Display name | The Morgue Warden |
| Location | Abandoned Hospital morgue |
| Type family | `three_realms_morgue_warden`, `morgue_warden`, `boss`, `monster`, `mob` |
| HP | 200 |
| Scale | 1.6 (geometry 1.6× entity + `minecraft:scale` component 1.6) |
| Collision | width 1.4, height 4.2 |
| Knockback resistance | 0.85 |
| Spawn type | summon only via controlled encounter function |
| Spawn egg | base `#C8C8C8` / overlay `#5C7080` |

## 2. Visual brief mapping

| Brief | Implementation |
|---|---|
| Extremely tall humanoid | geometry 60+ blocks tall in cube space, scaled 1.6× by entity component |
| Oversized shoulders | chest cube width 20 vs body cube width 10, with 0.6 inflate |
| Very long arms | leftArm + leftForearm + leftHand + 3 claws = 16+16+4+6 = 42 blocks; same for right; total reach past knees |
| Pale gray body | `PALE` (200,200,200) + `PALE_DARK` (150,150,155) base palette |
| Damaged medical clothing | `CLOTH_WHITE` and `CLOTH_DIRTY` palette on body/torso/arms/legs with tear marks, scratches, blood pixel detail |
| Rib-like anatomical details | dedicated `ribs` bone with 4 horizontal bars across the upper chest |
| Tilted head | head bone rotation `[15, 0, 0]` (forward tilt) |
| Asymmetrical damage | left side has cracked face + torn sleeve; right side has heavier damage and shoulder abnormality |
| Hollow eye sockets | UV `[44,144]` and `[48,144]` 2×2 hollowed pixel regions on head |
| Subtle cold glow | cool-blue tint layer composited over face and chest in texture |
| Long claws | 3 separate claw cubes per hand (claw1/claw2/claw3), 1×6 each |

The model is **avoid**:

- generic zombie: yes — silhouette is wide-shouldered and long-armed, not the typical hunched zombie
- cute horror: yes — proportions and damage convey dread
- cartoon styling: yes — flat-shaded blocky Bedrock aesthetic
- excessive neon: yes — only the eyes/chest have a subtle cool glow
- excessive red: yes — blood is a few isolated pixels, not full coverage
- random blood spam: yes — controlled detail at key locations

## 3. Asset audit outcome

Source survey conducted against:

1. `vendor/scp-dystopia/` — humanoid textures are 128×128 RGBA but visually generic; no entity with the requested silhouette.
2. `vendor/BOMD-Bedrock/` — blocks/items only, no humanoid.
3. `vendor/forg-cleannrooster-assets/` — armor/weapons only.

External download attempted via GitHub curl; rate-limited. **No external download performed.** No copyrighted visual content used.

Decision: original geometry, animation, and texture authored for this project. Skinny Monster 2, Sketchfab Watcher, and SCP-Dystopia mobs are **NOT** used.

Full audit: `TASK10_ASSET_AUDIT.md`.

## 4. Files created

| Path | Purpose |
|---|---|
| `BP/entities/three_realms/morgue_warden.json` | Behavior entity with phase1/phase2/phase3 component groups |
| `BP/loot_tables/entities/three_realms_morgue_warden.json` | Controlled loot (bones, rotten flesh, iron ingot, iron nugget) |
| `BP/functions/encounters/abandoned_hospital_morgue_warden.mcfunction` | One-shot summon at morgue interior |
| `BP/functions/encounters/abandoned_hospital.mcfunction` | Existing function extended additively (note only) |
| `RP/entity/three_realms/morgue_warden.json` | Client entity wired to geometry, animations, render controller |
| `RP/models/entity/three_realms/morgue_warden.geo.json` | 27-bone humanoid geometry, format 1.12.0 |
| `RP/textures/entity/three_realms/morgue_warden.png` | 128×256 RGBA texture, hand-painted |
| `RP/animations/three_realms/morgue_warden.animation.json` | 9 animations, format 1.10.0 |
| `RP/animation_controllers/three_realms/morgue_warden.json` | Phase-aware controller |
| `RP/render_controllers/three_realms_morgue_warden.json` | entity_emissive_alpha material for glow channels |
| `RP/sounds/sound_definitions.json` | +2 additive definitions (portal + scp-door unchanged) |

11 files touched/created. No pre-existing asset was regen/repaint/recolor/redesign/remade/replaced.

## 5. Phase design

Three phases driven by `has_damage` thresholds and `mark_variant`:

| Phase | Trigger | Movement | Attack damage | Extra | Animation |
|---|---|---:|---:|---|---|
| Phase 1 | spawn | 0.18 | 6 | none | idle + breathing + head |
| Phase 2 | has_damage ≥ 70 | 0.26 | 9 | none | stalking + breathing |
| Phase 3 | has_damage ≥ 150 | 0.34 | 13 | area_attack radius 1.5 / 2 per tick | enraged + breathing |

Transitions handled in `three_realms:on_hurt` event. `mark_variant` 0/1/2 maps to phase1/2/3 respectively, controlled by `minecraft:variant` value in the active component group.

On death: `mark_variant` 99 + `can_be_attacked: false` + `damage_sensor` with `deals_damage: false`. Player scoreboard `three_realms.morgue_warden_killed = 1` blocks respawn.

## 6. Animations

| Animation | Purpose |
|---|---|
| `idle` | continuous breathing sway, head drift, limb flicker |
| `breathing` | chest scale modulation for subtle breathing effect |
| `head` | head micro-rotation, independent of body |
| `walk` | slow walk cycle, legs swing, arms counter-swing |
| `attack` | 1.0s lunge with both arms forward, jaw drops, body tilt |
| `hurt` | 0.4s reaction recoil |
| `death` | 2.5s collapse to ground with permanent pose |
| `enraged` | phase 3 idle — bigger sway, wider head motion, louder rib movement |
| `stalking` | phase 2 idle — slow forward lean |

Animation controller: `controller.animation.three_realms.morgue_warden`. States: `phase1_idle`, `walk`, `attack`, `hurt`, `phase2`, `phase3`, `death`. Transitions driven by `query.modified_move_speed`, `query.is_delayed_attacking`, `query.hurt_time`, `query.health`, `query.mark_variant`.

## 7. Encounter wiring

The Morgue Warden is **not** auto-summoned by the existing `abandoned_hospital.mcfunction` encounter. The encounter function is intentionally left at its Task 8 behavior (one `scp939` guard at `(12, 2, -8)` within radius 24).

The boss is summoned via a dedicated one-shot function:

```
/function encounters/abandoned_hospital_morgue_warden
```

This function (run with player at the morgue anchor) checks:

1. No `three_realms:morgue_warden` exists within radius 32.
2. No player has `three_realms.morgue_warden_killed = 1` in their scoreboard.

If both pass, one breath cue plays and one entity is summoned with tag `three_realms:morgue_warden_active`.

No tick loop. No global scan. No automatic respawn.

The `three_realms:morgue_warden_active` tag ensures the boss entity is identifiable in future scripted encounters (e.g., scripted follow-up cutscene audio, scripted door close on entry). No other code uses this tag in Task 10.

## 8. Audio

Two additive definitions in `RP/sounds/sound_definitions.json`:

```json
"three_realms.morgue_warden.breath": hostile, max_distance 24, sources doors/door1_close1+2, volume 0.4, pitch 0.55/0.6
"three_realms.morgue_warden.attack": hostile, max_distance 28, sources doors/door1_open2+3, volume 0.45, pitch 0.4/0.45
```

Reuses existing OGG files. Portal definitions untouched. Total OGG count unchanged (8). Total definitions: 4 → 6.

Cue points:

- spawn (1×): `breath`
- target acquired (per occurrence): `breath`
- hurt (per occurrence): `breath`
- death (1×): `attack`

No loops. No ambient spam. Mobile-safe volume envelope.

## 9. Loot

| Item | Range | Weight |
|---|---|---|
| `minecraft:bone` | 6..12 | 1 |
| `minecraft:rotten_flesh` | 4..10 | 1 |
| `minecraft:iron_ingot` | 2..4 | 1 |
| `minecraft:iron_nugget` | 4..10 | 1 |

Each pool rolls 1 time. Total 1-4 distinct items per kill. **No new items introduced.** No progression-coupled drops. No boss-specific relics (those belong to Task 14).

## 10. Build, package, render evidence

- `mct validate main` / `currentplatform` / `all` → exit 0 on isolated staging.
- `mct exportaddon` → PASS, generated `.mcaddon` at `~/three_realms_task10/three_realms_haunted.mcaddon`.
- `unzip -tq` → no archive errors.
- 531 entries (was 515 before Task 10).
- 12,648,886 bytes (was 12,638,969 before Task 10; +9,917 for Morgue Warden content).
- Render: `render_reports/morgue_warden_main.png` (512×768 PNG, 23,367 bytes).

## 11. Regression

- Tasks 1–9 unchanged or additively extended (audio).
- `BP/scripts/main.js` (portal runtime) untouched.
- `BP/scripts/main.ts` present, not used in export (preserved for future task when TS build path is fixed).
- All four portal sound definitions preserved exactly.
- All eight structure builders preserved.
- All eight region encounter functions preserved.
- Foundation function preserved.
- All SCP mob definitions preserved (33 BP + 35 RP).
- All four blade weapons preserved.
- All ten BOMD blocks/items preserved.
- Skinny Monster 2, Sketchfab Watcher, SCP-Dystopia mobs are **NOT** used for Morgue Warden.

Detailed checks in `TASK10_REGRESSION.md`.

## 12. Blockers and runtime limitation

> **NOT TESTED — ENVIRONMENT LIMITATION.**

No Bedrock runtime, so the following were not verified:

- Boss spawn behavior in the morgue interior.
- Component group transitions under actual combat damage.
- Pathfinding through the hospital morgue corridors.
- Melee hit detection with reach_multiplier 2.4.
- Phase 3 area attack radius and damage.
- Audio playback and volume mixing.
- Animation transitions during live combat.
- Death animation and loot table execution.
- Mobile FPS and memory pressure.
- Multiplayer synchronization.

Static validation, build success, package presence, and render output are **NOT** equivalent to in-game boss behavior.

## 13. Stop condition

- Lady of the Crypt boss — **NOT** started.
- The Nightmare boss — **NOT** started.
- Lore, progression, world integration, special systems — **NOT** started.
- New mobs, weapons, armor — **NOT** started.
- No Task 11 work performed.

## 14. References

- `MCT_CAPABILITIES_CURRENT.md`
- `TASK10_BASELINE_REGRESSION.md`
- `TASK10_ASSET_AUDIT.md`
- `TASK10_BOSS_DEPENDENCY_MANIFEST.md`
- `TASK10_REGRESSION.md`
- `MCTools 0.17.8`: <https://github.com/Mojang/minecraft-creator-tools>
- Bedrock Creator documentation: <https://learn.microsoft.com/en-us/minecraft/creator/>
- Project repository: <https://github.com/yamenfhamsy-member/three-realms-haunted>