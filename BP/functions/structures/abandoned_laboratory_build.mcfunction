# THREE REALMS — deterministic Bedrock 1.26.x structure builder
# Execute at the documented anchor/origin with /function structures/<name>
# No bosses, new mobs, worldgen, dimensions, or new assets are created here.
# Structure: abandoned_laboratory_build
# Anchor/origin: Old Laboratory — anchor L1 (recommended conceptual origin: 80 80 80)
# Purpose: facility connected to the hospital with testing, observation, restricted section and hidden research

fill ~-14 ~0 ~-12 ~14 ~0 ~12 minecraft:polished_deepslate
fill ~-14 ~1 ~-12 ~14 ~7 ~-12 minecraft:deepslate_bricks
fill ~-14 ~1 ~12 ~14 ~7 ~12 minecraft:deepslate_bricks
fill ~-14 ~1 ~-11 ~-14 ~7 ~11 minecraft:deepslate_bricks
fill ~14 ~1 ~-11 ~14 ~7 ~11 minecraft:deepslate_bricks
fill ~-13 ~8 ~-12 ~13 ~8 ~12 minecraft:deepslate_tiles
fill ~-13 ~1 ~-11 ~13 ~6 ~11 minecraft:air
fill ~-2 ~1 ~-11 ~2 ~6 ~11 minecraft:iron_block
fill ~-12 ~1 ~-10 ~-3 ~4 ~-2 minecraft:air
fill ~3 ~1 ~-10 ~12 ~4 ~-2 minecraft:air
fill ~-12 ~1 ~1 ~-3 ~4 ~10 minecraft:air
fill ~3 ~1 ~1 ~12 ~4 ~10 minecraft:air
fill ~-11 ~2 ~-9 ~-4 ~5 ~-4 minecraft:glass
fill ~4 ~2 ~-9 ~11 ~5 ~-4 minecraft:iron_bars
fill ~-11 ~1 ~-9 ~-4 ~1 ~-4 minecraft:iron_block
setblock ~-8 ~2 ~-7 minecraft:sculk_sensor
setblock ~8 ~2 ~-7 three_realms:scp106_corrosion
fill ~-3 ~1 ~7 ~3 ~1 ~10 three_realms:sealed_blackstone
fill ~-2 ~-5 ~8 ~2 ~-1 ~10 minecraft:deepslate_bricks
fill ~-1 ~-4 ~9 ~1 ~-1 ~9 minecraft:air
setblock ~0 ~-1 ~9 minecraft:chest
loot insert ~0 ~-1 ~9 loot "loot_tables/entities/scpdt/scp131"
loot insert ~0 ~-1 ~9 loot "loot_tables/lore/lab_project_anima"
loot insert ~0 ~-1 ~9 loot "loot_tables/chests/uncommon_rewards"
setblock ~-9 ~2 ~5 three_realms:obsidilith_rune
summon three_realms:scp191 ~7 ~2 ~5
