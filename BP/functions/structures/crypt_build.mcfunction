# THREE REALMS — deterministic Bedrock 1.26.x structure builder
# Execute at the documented anchor/origin with /function structures/<name>
# No bosses, new mobs, worldgen, dimensions, or new assets are created here.
# Structure: crypt_build
# Anchor/origin: Crypt Depths — anchor K1 (recommended conceptual origin: 160 70 80)
# Purpose: descent through burial chambers and corridors to a boss-ready central chamber without implementing a boss

fill ~-10 ~0 ~-14 ~10 ~0 ~14 minecraft:deepslate_bricks
fill ~-10 ~1 ~-14 ~10 ~6 ~-14 minecraft:deepslate_bricks
fill ~-10 ~1 ~14 ~10 ~6 ~14 minecraft:deepslate_bricks
fill ~-10 ~1 ~-13 ~-10 ~6 ~13 minecraft:deepslate_bricks
fill ~10 ~1 ~-13 ~10 ~6 ~13 minecraft:deepslate_bricks
fill ~-9 ~1 ~-13 ~9 ~5 ~13 minecraft:air
fill ~-2 ~1 ~-12 ~2 ~5 ~12 minecraft:deepslate_bricks
fill ~-1 ~1 ~-11 ~1 ~4 ~11 minecraft:air
fill ~-8 ~1 ~-10 ~-3 ~3 ~-6 minecraft:air
fill ~3 ~1 ~-10 ~8 ~3 ~-6 minecraft:air
fill ~-8 ~1 ~-2 ~-3 ~3 ~2 minecraft:air
fill ~3 ~1 ~-2 ~8 ~3 ~2 minecraft:air
fill ~-8 ~1 ~6 ~-3 ~3 ~10 minecraft:air
fill ~3 ~1 ~6 ~8 ~3 ~10 minecraft:air
fill ~-6 ~1 ~-9 ~-5 ~2 ~-7 minecraft:bone_block
fill ~4 ~1 ~7 ~5 ~2 ~9 minecraft:bone_block
fill ~-6 ~1 ~-3 ~6 ~1 ~4 minecraft:polished_blackstone
fill ~-4 ~2 ~-1 ~4 ~5 ~2 minecraft:air
fill ~-1 ~1 ~10 ~1 ~1 ~13 minecraft:air
fill ~-1 ~-6 ~11 ~1 ~-1 ~13 minecraft:deepslate_bricks
fill ~0 ~-5 ~12 ~0 ~-1 ~12 minecraft:air
setblock ~0 ~-1 ~12 three_realms:obsidilith_rune
setblock ~-1 ~-1 ~12 minecraft:chest
loot insert ~-1 ~-1 ~12 slot.container 0 loot "loot_tables/lore/crypt_ritual_note"
setblock ~-7 ~2 ~4 minecraft:sculk_catalyst
setblock ~7 ~2 ~4 minecraft:sculk_catalyst
summon three_realms:scp439 ~0 ~2 ~0
