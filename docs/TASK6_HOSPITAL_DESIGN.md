# Abandoned Hospital — Task 6 Part 1 Design

## Purpose

Abandoned Hospital is the first representative production structure for the Haunted/Nightmare realm. It is a deterministic Bedrock function-built structure, not a decorative shell and not a placeholder. It is designed to be executed at an anchor position in a world and to provide a compact exploration loop with rooms, blocked paths, a basement/service level, loot opportunities, an encounter, and future content hooks.

## Footprint and playable loop

The footprint is approximately 29 blocks wide by 37 blocks long, with a main level from Y=0 through Y=9 and a service/basement extension down to Y=-4. The entrance opens to reception. From reception, the player enters a central corridor that connects four treatment-room zones, an operating area, a utility room, and two blocked thresholds. A basement access point leads to a service area and a locked morgue route.

| Zone | Function | Existing assets or supported blocks |
|---|---|---|
| Entrance and reception | Orientation, first loot opportunity, entry loop | Deepslate, chest, existing SCP-131 loot table |
| Patient corridors | Navigation and controlled sightlines | Polished/cracked deepslate, sealed_blackstone thresholds |
| Treatment rooms | Exploration and encounter space | Beds, iron bars, sculk sensors, SCP-106 corrosion |
| Operating area | Environmental storytelling and danger cue | Polished blackstone, iron blocks, lantern |
| Utility room | Spatial contrast and environmental detail | Stone, water, iron blocks |
| Basement/service area | Vertical variation and second loot opportunity | Obsidilith rune, deepslate bricks, chest, SCP-939 loot table |
| Morgue access | Locked future-content hook | Existing sealed_blackstone and obsidilith_rune |
| Encounter anchor | Horror encounter using existing content | Existing `three_realms:scp939` |

## Future-content hooks

Treatment rooms are reserved for future Patient/Doctor content, while the basement morgue route is reserved for future Morgue Warden content. No new mobs, bosses, scripts, world-wide generation, or boss systems are introduced in this part.

## Implementation approach

The project currently has no existing structure files, templates, feature rules, worldgen definitions, dimensions, or structure-generation scripts. The first pipeline therefore uses a supported Bedrock `.mcfunction` file with deterministic `fill`, `setblock`, `loot`, and `summon` commands. It is invoked manually at an intended anchor position; automatic worldgen is explicitly deferred until the structure pipeline has runtime evidence and a supported project mechanism.

## Asset policy

Only existing project assets and standard Bedrock blocks are used. Existing custom blocks referenced are `three_realms:sealed_blackstone`, `three_realms:obsidilith_rune`, and `three_realms:scp106_corrosion`. Existing entity content referenced is `three_realms:scp939`. Existing loot tables referenced are `loot_tables/entities/scpdt/scp131` and `loot_tables/entities/scpdt/scp939`. No external asset source, new texture, model, mob, or boss is introduced.

## Validation boundary

The function is validated statically through the installed Creator Tools checks in an isolated view. MCTools static validation cannot prove that a player executes the function at the intended anchor or that in-world block/entity behavior is correct. Runtime remains **NOT TESTED — ENVIRONMENT LIMITATION**.
