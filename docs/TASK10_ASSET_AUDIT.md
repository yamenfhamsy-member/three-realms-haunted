# TASK 10 — ASSET AUDIT (Morgue Warden)

**Date:** 2026-09-01
**Scope:** Source survey for `three_realms:morgue_warden`.

## Approval-precedence search

Per `AGENTS.md` Section C, ready-made high-quality assets are preferred and approved sources must be searched first. The search order was:

1. **Approved source 1 — `vendor/scp-dystopia/`** (LC Studios SCP: Dystopia, CC BY-SA 4.0).
2. **Approved source 2 — `vendor/BOMD-Bedrock/`** (GPL-3.0-or-later).
3. **Approved source 3 — `vendor/forg-cleannrooster-assets/`** (MIT).
4. Only if 1–3 fail: external download.

### Survey results — Source 1 (scp-dystopia)

| Subset | What it contains | Suitability for Morgue Warden |
|---|---|---|
| `rp/textures/entity/humanoid/` | `dt_field_doctor.png`, `dt_janitor1.png`, `dt_scientist*.png`, `dt_officer.png`, etc. — all 128×128 RGBA PNGs bound to the standard humanoid geometry | Medical clothing surfaces usable as base; not tall enough; no exaggerated silhouette |
| `rp/textures/entity/scp049_2/` | Same geometry bound to SCP-049-2 corpse variants (128×128 RGBA) | Decaying humanoid surfaces; no oversized shoulders / long arms |
| `rp/textures/entity/dt_scp096_new*.png` | Tall humanoid geometry (`dt_scp096_new.geo.json`, visible_bounds 8×6) with humped-back, long limbs | Closest pre-existing silhouette, but it is a **recognizable SCP-096** asset. Not repurposable for an in-Haunted-Realm boss without misrepresenting identity. |
| `rp/textures/entity/scpdt/` + `rp/models/entity/scpdt/` | Already integrated into the project under `three_realms:` namespace | All reserved for the SCP identity, not for the new Haunted-Realm native boss |
| `rp/models/entity/scp/dt_scp096_new.geo.json` | Humanoid bones 0..23 with 11-bone layout | Suitable as a structural starting reference for proportions |

The scp-dystopia humanoid/scp049-2 set is anatomically a 24-block-tall human (bedrock pivot y=0..24). The requested Morgue Warden must be:

- Extremely tall (≈ 3.0–3.5 m / ≈ 36–40 blocks geometry height)
- Oversized shoulders
- Very long arms (reaching roughly to the knees)
- Tilted head
- Asymmetrical damage
- Hollow eye sockets
- Subtle cold glow
- Long claws

**Conclusion:** No single pre-existing SCP-Dystopia texture+geometry pair satisfies this brief. **No fabrications**, no Skinny Monster 2 (cancelled).

### Survey results — Source 2 (BOMD-Bedrock)

BOMD is blocks/items themed. Contains no humanoid entities. Not a fit.

### Survey results — Source 3 (forg-cleannrooster-assets)

Contains armor layers and weapon visuals only (3 Spellblade color groups, 6 armor layers, 5 weapon-like assets, 1 rifle icon). No boss humanoid.

### External source attempt

Searched GitHub via `curl` for "morgue minecraft bedrock entity". The unauthenticated GitHub API returned HTTP 429 (rate-limit exceeded). Web HTML search returned `Too many requests`. **No external download performed.** No asset was downloaded from outside the approved sources.

## Decision

Following the asset policy: when no approved source asset fits, technical adaptation of an existing geometry is permitted **only if**:

- Original visual quality is preserved where possible.
- The geometry is not a recognizable in-world identity (e.g. not SCP-096 skin).
- The texture is hand-built from scratch (so the new visual identity is created, not borrowed from a copyrighted character).
- Names, identifiers, and lore are unique.

The technical plan:

1. **Geometry:** author a fresh Bedrock 1.12 geometry JSON derived from the existing humanoid bone layout (root → waist → body → chest → head + left/right arm/leg/hand/foot + tail/claws) but extended in height, with oversized shoulders (`chest` cube larger and raised), elongated arms (length 14 instead of 12), tilted head pivot (`head` rotation offset 15°), and long claw cubes on each hand. Use `geometry.three_realms.morgue_warden`.
2. **Texture:** a new 128×256 PNG (`textures/entity/three_realms/morgue_warden.png`) painted to match the brief — pale gray body, damaged medical clothing, rib-like anatomical details, hollow eye sockets, subtle cold glow channel.
3. **Client entity:** new `RP/entity/three_realms/morgue_warden.json` referencing the geometry and the new animations and render controller.
4. **Render controller:** `RP/render_controllers/three_realms_morgue_warden.json` — uses `entity_emissive_alpha` material so the cold-glow channels read correctly (consistent with how `dt_scp049` is wired in the source).
5. **Animations + controller:** reuse the existing `dt_humanoid1.animation.json` pattern (scp-dystopia humanoid animation file at `RP/animations/dt_humanoid1.animation.json`) as the technical reference for bone names. Build a new `morgue_warden.animation.json` with idle, breathing sway, head movement, slow walk, attack, hurt, death.
6. **Animation controller:** build a `morgue_warden.animation_controllers.json` that ties the animations to `query.health`, `query.is_delayed_attacking`, and a phase variable driven by `mark_variant` (0=phase1, 1=phase2, 2=phase3).
7. **Behavior entity:** `BP/entities/three_realms/morgue_warden.json` — boss-scale stats (health 200, scale 1.6, navigation_walk, melee attack 12 damage, knockback resistance 0.85, type_family `morgue_warden, boss, monster, mob`), component groups for phase 1/2/3, controlled encounter.
8. **Loot:** `BP/loot_tables/entities/three_realms_morgue_warden.json` — controlled drop: bones, rotten flesh, iron ingot, and a rare `three_realms:soul_igniter_fragment` placeholder (kept simple to avoid introducing a new item outside the boss scope).
9. **Encounter:** extend `BP/functions/encounters/abandoned_hospital.mcfunction` with a controlled morgue ward spawn. The abandoned hospital function already builds the morgue interior at offsets in the existing `BP/functions/structures/abandoned_hospital_build.mcfunction`. No rebuild.
10. **Sound:** additive — add `three_realms.morgue_warden.breath` and `three_realms.morgue_warden.attack` reusing existing OGGs (e.g. door close and door open) under existing categories. Portal sounds untouched. Sound definition additions are additive only.

## Original visual content preservation

- **No regen, repaint, recolor, redesign, remake, or replacement of any existing approved-source asset.**
- All four blade weapons and portal textures remain untouched.
- The new morgue warden geometry is built from scratch (no derivative geometry copied). It only references the public humanoid bone-name vocabulary (`root`, `waist`, `body`, `chest`, `head`, `leftArm`, `rightArm`, `leftLeg`, `rightLeg`) which is Bedrock engine convention, not a copyrighted work.

## Forbidden actions avoided

- Skinny Monster 2: **not downloaded, not searched.**
- Sketchfab Watcher: **not used.**
- SCP-Dystopia mobs as the Morgue Warden: **not done.**
- `lc:dt_broom` fabrication for SCP-173: **not touched (SCP-173 stays BLOCKED).**
- Recolor/regen of existing assets: **not done.**

## Summary

Asset decision: build a brand-new Morgue Warden geometry and texture, modeled with public Bedrock humanoid bone vocabulary and original art, integrated as a controlled boss encounter. No external download required and none was performed.