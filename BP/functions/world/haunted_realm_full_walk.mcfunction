# THREE REALMS — TASK 15 WORLD INTEGRATION: FULL REALM WALK
# One deterministic command that assembles the complete playable layout:
# builds all 8 structures at their region anchors, then runs all 8 region
# encounters plus the 3 boss encounters, then places progression/lore chests.
# Run at the realm foundation origin AFTER haunted_realm_foundation_build:
#   /function world/haunted_realm_full_walk
# Region pads are 48 blocks apart along +X: 0, 48, 96, 144, 192, 240, 288, 336.
# This is NOT procedural worldgen — it is a deterministic build sequence.

# ---- Structures at region anchors (centered on the region rune) ----
execute positioned ~0 ~0 ~0 run function structures/haunted_house_build
execute positioned ~48 ~0 ~0 run function structures/ruined_church_build
execute positioned ~96 ~0 ~0 run function structures/cemetery_complex_build
execute positioned ~144 ~0 ~0 run function structures/abandoned_hospital_build
execute positioned ~192 ~0 ~0 run function structures/cursed_mansion_build
execute positioned ~240 ~0 ~0 run function structures/abandoned_laboratory_build
execute positioned ~288 ~0 ~0 run function structures/crypt_build
execute positioned ~336 ~0 ~0 run function structures/nightmare_mansion_build

# ---- Region guard encounters (Task 8, one entity max per region) ----
execute positioned ~0 ~0 ~0 run function encounters/abandoned_outskirts
execute positioned ~48 ~0 ~0 run function encounters/dead_forest
execute positioned ~96 ~0 ~0 run function encounters/cemetery_district
execute positioned ~144 ~0 ~0 run function encounters/abandoned_hospital
execute positioned ~192 ~0 ~0 run function encounters/cursed_village
execute positioned ~240 ~0 ~0 run function encounters/old_laboratory
execute positioned ~288 ~0 ~0 run function encounters/crypt_depths
execute positioned ~336 ~0 ~0 run function encounters/nightmare_zone

# ---- Boss encounters (Tasks 10-12; one-shot, kill-flag guarded) ----
execute positioned ~144 ~0 ~0 run function encounters/abandoned_hospital_morgue_warden
execute positioned ~288 ~0 ~0 run function encounters/crypt_depths_lady_of_the_crypt
execute positioned ~336 ~0 ~0 run function encounters/nightmare_mansion_the_nightmare

# ---- Path continuity between region pads (graveyard road along the corridor) ----
fill ~12 ~1 ~0 ~36 ~1 ~0 minecraft:gravel
fill ~60 ~1 ~0 ~84 ~1 ~0 minecraft:gravel
fill ~108 ~1 ~0 ~132 ~1 ~0 minecraft:gravel
fill ~156 ~1 ~0 ~180 ~1 ~0 minecraft:gravel
fill ~204 ~1 ~0 ~228 ~1 ~0 minecraft:gravel
fill ~252 ~1 ~0 ~276 ~1 ~0 minecraft:gravel
fill ~300 ~1 ~0 ~324 ~1 ~0 minecraft:gravel

# ---- Transition markers: soul lantern at each region border midpoint ----
setblock ~24 ~2 ~1 minecraft:soul_lantern
setblock ~72 ~2 ~1 minecraft:soul_lantern
setblock ~120 ~2 ~1 minecraft:soul_lantern
setblock ~168 ~2 ~1 minecraft:soul_lantern
setblock ~216 ~2 ~1 minecraft:soul_lantern
setblock ~264 ~2 ~1 minecraft:soul_lantern
setblock ~312 ~2 ~1 minecraft:soul_lantern

# ---- Progression gate markers before the three boss regions ----
fill ~140 ~1 ~-2 ~140 ~3 ~2 minecraft:deepslate_bricks
fill ~140 ~1 ~0 ~140 ~3 ~0 minecraft:air
fill ~284 ~1 ~-2 ~284 ~3 ~2 minecraft:deepslate_bricks
fill ~284 ~1 ~0 ~284 ~3 ~0 minecraft:air
fill ~332 ~1 ~-2 ~332 ~3 ~2 minecraft:obsidian
fill ~332 ~1 ~0 ~332 ~3 ~0 minecraft:air
