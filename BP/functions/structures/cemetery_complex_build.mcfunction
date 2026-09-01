# THREE REALMS — deterministic Bedrock 1.26.x structure builder
# Execute at the documented anchor/origin with /function structures/<name>
# No bosses, new mobs, worldgen, dimensions, or new assets are created here.
# Structure: cemetery_complex_build
# Anchor/origin: Cemetery District — anchor C1 (recommended conceptual origin: 80 80 0)
# Purpose: grave grounds, paths, mausoleum, crypt access, concealed area, loot and spectral encounter

fill ~-16 ~0 ~-12 ~16 ~0 ~12 minecraft:coarse_dirt
fill ~-16 ~1 ~-12 ~-16 ~3 ~12 minecraft:stone_bricks
fill ~16 ~1 ~-12 ~16 ~3 ~12 minecraft:stone_bricks
fill ~-15 ~1 ~-11 ~15 ~1 ~11 minecraft:grass_block
fill ~-1 ~1 ~-11 ~1 ~1 ~11 minecraft:gravel
fill ~-15 ~1 ~-1 ~15 ~1 ~1 minecraft:gravel
fill ~-13 ~1 ~-9 ~-9 ~1 ~-7 minecraft:stone_bricks
fill ~-5 ~1 ~-9 ~-1 ~1 ~-7 minecraft:stone_bricks
fill ~3 ~1 ~-9 ~7 ~1 ~-7 minecraft:stone_bricks
fill ~11 ~1 ~-9 ~14 ~1 ~-7 minecraft:stone_bricks
fill ~-13 ~2 ~-9 ~-9 ~3 ~-7 minecraft:air
fill ~-5 ~2 ~-9 ~-1 ~3 ~-7 minecraft:air
fill ~3 ~2 ~-9 ~7 ~3 ~-7 minecraft:air
fill ~11 ~2 ~-9 ~14 ~3 ~-7 minecraft:air
fill ~-6 ~1 ~3 ~6 ~1 ~10 minecraft:deepslate_bricks
fill ~-6 ~2 ~3 ~6 ~5 ~10 minecraft:deepslate_bricks
fill ~-4 ~2 ~5 ~4 ~4 ~8 minecraft:air
fill ~-4 ~5 ~5 ~4 ~5 ~8 minecraft:deepslate_tiles
setblock ~0 ~2 ~6 three_realms:obsidilith_rune
fill ~-2 ~1 ~10 ~2 ~1 ~12 minecraft:air
fill ~-2 ~-4 ~10 ~2 ~-1 ~12 minecraft:deepslate_bricks
fill ~-1 ~-3 ~11 ~1 ~-1 ~11 minecraft:air
setblock ~0 ~-1 ~11 minecraft:chest
loot insert ~0 ~-1 ~11 loot "loot_tables/entities/scpdt/scp939"
loot insert ~0 ~-1 ~11 loot "loot_tables/chests/common_rewards"
setblock ~-12 ~1 ~5 minecraft:sculk_catalyst
setblock ~12 ~1 ~5 minecraft:sculk_catalyst
summon three_realms:scp106 ~0 ~2 ~7
