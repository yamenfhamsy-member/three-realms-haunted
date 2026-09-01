# THREE REALMS — deterministic Bedrock 1.26.x structure builder
# Execute at the documented anchor/origin with /function structures/<name>
# No bosses, new mobs, worldgen, dimensions, or new assets are created here.
# Structure: haunted_house_build
# Anchor/origin: Abandoned Outskirts — anchor A1 (recommended conceptual origin: 0 80 0)
# Purpose: oppressive abandoned home with rooms, upper floor, hidden room, basement, encounter and loot

fill ~-12 ~0 ~-12 ~12 ~0 ~12 minecraft:deepslate_bricks
fill ~-12 ~1 ~-12 ~12 ~7 ~-12 minecraft:deepslate_bricks
fill ~-12 ~1 ~12 ~12 ~7 ~12 minecraft:deepslate_bricks
fill ~-12 ~1 ~-11 ~-12 ~7 ~11 minecraft:deepslate_bricks
fill ~12 ~1 ~-11 ~12 ~7 ~11 minecraft:deepslate_bricks
fill ~-12 ~8 ~-12 ~12 ~8 ~12 minecraft:deepslate_tiles
fill ~-11 ~1 ~-11 ~11 ~7 ~11 minecraft:air
fill ~-1 ~1 ~-11 ~1 ~7 ~11 minecraft:polished_deepslate
fill ~-11 ~1 ~-10 ~-2 ~4 ~-2 minecraft:air
fill ~2 ~1 ~-10 ~11 ~4 ~-2 minecraft:air
fill ~-11 ~1 ~0 ~-2 ~4 ~10 minecraft:air
fill ~2 ~1 ~0 ~11 ~4 ~10 minecraft:air
fill ~-11 ~5 ~-10 ~-2 ~7 ~-2 minecraft:air
fill ~2 ~5 ~-10 ~11 ~7 ~-2 minecraft:air
fill ~-1 ~5 ~-9 ~1 ~7 ~9 minecraft:air
fill ~-1 ~1 ~8 ~1 ~3 ~10 three_realms:sealed_blackstone
fill ~7 ~2 ~-8 ~9 ~4 ~-6 minecraft:air
fill ~7 ~1 ~-8 ~9 ~1 ~-6 minecraft:bookshelf
fill ~-8 ~1 ~-8 ~-5 ~1 ~-5 minecraft:dark_oak_planks
setblock ~-7 ~2 ~-7 minecraft:lantern
setblock ~6 ~1 ~-7 minecraft:chest
loot insert ~6 ~1 ~-7 loot "loot_tables/entities/scpdt/scp131"
fill ~-7 ~-4 ~2 ~7 ~-1 ~9 minecraft:deepslate_bricks
fill ~-6 ~-3 ~3 ~6 ~-1 ~8 minecraft:air
setblock ~0 ~-1 ~5 minecraft:chest
loot insert ~0 ~-1 ~5 loot "loot_tables/entities/scpdt/scp939"
loot insert ~0 ~-1 ~5 loot "loot_tables/chests/common_rewards"
setblock ~6 ~1 ~5 minecraft:sculk_catalyst
summon three_realms:haunted_watcher ~5 ~2 ~-6
