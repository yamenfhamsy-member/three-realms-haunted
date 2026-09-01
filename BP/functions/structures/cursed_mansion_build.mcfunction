# THREE REALMS — deterministic Bedrock 1.26.x structure builder
# Execute at the documented anchor/origin with /function structures/<name>
# No bosses, new mobs, worldgen, dimensions, or new assets are created here.
# Structure: cursed_mansion_build
# Anchor/origin: Cursed Village — anchor V1 (recommended conceptual origin: 0 80 80)
# Purpose: multi-floor cursed mansion with uncertain routes, concealed path, basement and encounter

fill ~-13 ~0 ~-13 ~13 ~0 ~13 minecraft:deepslate_bricks
fill ~-13 ~1 ~-13 ~13 ~8 ~-13 minecraft:deepslate_bricks
fill ~-13 ~1 ~13 ~13 ~8 ~13 minecraft:deepslate_bricks
fill ~-13 ~1 ~-12 ~-13 ~8 ~12 minecraft:deepslate_bricks
fill ~13 ~1 ~-12 ~13 ~8 ~12 minecraft:deepslate_bricks
fill ~-13 ~9 ~-13 ~13 ~9 ~13 minecraft:deepslate_tiles
fill ~-12 ~1 ~-12 ~12 ~7 ~12 minecraft:air
fill ~-1 ~1 ~-12 ~1 ~7 ~12 minecraft:polished_deepslate
fill ~-11 ~1 ~-11 ~-2 ~4 ~-2 minecraft:air
fill ~2 ~1 ~-11 ~11 ~4 ~-2 minecraft:air
fill ~-11 ~1 ~1 ~-2 ~4 ~11 minecraft:air
fill ~2 ~1 ~1 ~11 ~4 ~11 minecraft:air
fill ~-11 ~5 ~-11 ~11 ~7 ~11 minecraft:air
fill ~-10 ~2 ~-5 ~-5 ~5 ~-3 minecraft:air
fill ~-10 ~1 ~-5 ~-5 ~1 ~-3 minecraft:bookshelf
fill ~8 ~1 ~-10 ~10 ~1 ~-7 three_realms:sealed_blackstone
fill ~8 ~2 ~-10 ~10 ~5 ~-7 minecraft:air
fill ~-2 ~1 ~9 ~2 ~1 ~12 minecraft:air
fill ~-2 ~-4 ~9 ~2 ~-1 ~12 minecraft:deepslate_bricks
fill ~-1 ~-3 ~10 ~1 ~-1 ~11 minecraft:air
setblock ~0 ~-1 ~10 minecraft:chest
loot insert ~0 ~-1 ~10 slot.container 0 loot "loot_tables/entities/scpdt/scp939"
loot insert ~0 ~-1 ~10 slot.container 1 loot "loot_tables/chests/uncommon_rewards"
setblock ~7 ~2 ~4 three_realms:scp106_corrosion
setblock ~-7 ~2 ~4 minecraft:sculk_catalyst
summon three_realms:scp966 ~5 ~2 ~-5
