# THREE REALMS — deterministic Bedrock 1.26.x structure builder
# Execute at the documented anchor/origin with /function structures/<name>
# No bosses, new mobs, worldgen, dimensions, or new assets are created here.
# Structure: ruined_church_build
# Anchor/origin: Cemetery District — anchor C2 (recommended conceptual origin: 130 80 0)
# Purpose: supernatural ruined church with nave, altar, collapsed side spaces, crypt and lore route

fill ~-12 ~0 ~-18 ~12 ~0 ~18 minecraft:deepslate_bricks
fill ~-12 ~1 ~-18 ~-12 ~8 ~18 minecraft:deepslate_bricks
fill ~12 ~1 ~-18 ~12 ~8 ~18 minecraft:deepslate_bricks
fill ~-12 ~1 ~-18 ~12 ~8 ~-18 minecraft:deepslate_bricks
fill ~-12 ~1 ~18 ~12 ~8 ~18 minecraft:deepslate_bricks
fill ~-11 ~1 ~-17 ~11 ~8 ~17 minecraft:air
fill ~-3 ~1 ~-17 ~-2 ~6 ~17 minecraft:stone_bricks
fill ~2 ~1 ~-17 ~3 ~6 ~17 minecraft:stone_bricks
fill ~-10 ~1 ~-15 ~10 ~1 ~13 minecraft:polished_deepslate
fill ~-4 ~1 ~13 ~4 ~1 ~17 minecraft:polished_blackstone
fill ~-3 ~2 ~14 ~3 ~4 ~14 minecraft:air
setblock ~0 ~2 ~14 three_realms:obsidilith_rune
fill ~-10 ~2 ~-12 ~-7 ~6 ~-8 minecraft:air
fill ~7 ~2 ~-12 ~10 ~6 ~-8 minecraft:air
fill ~-10 ~2 ~-12 ~-7 ~2 ~-8 minecraft:cobblestone
fill ~7 ~2 ~-12 ~10 ~2 ~-8 minecraft:cobblestone
fill ~-2 ~1 ~-2 ~2 ~1 ~3 three_realms:sealed_blackstone
fill ~-2 ~0 ~-17 ~2 ~0 ~-14 minecraft:air
fill ~-1 ~-4 ~-16 ~1 ~-1 ~-14 minecraft:deepslate_bricks
fill ~0 ~-3 ~-15 ~0 ~-1 ~-15 minecraft:air
setblock ~0 ~-1 ~-15 minecraft:chest
loot insert ~0 ~-1 ~-15 slot.container 0 loot "loot_tables/entities/scpdt/scp131"
setblock ~-8 ~2 ~0 minecraft:sculk_catalyst
setblock ~8 ~2 ~0 minecraft:sculk_catalyst
summon three_realms:scp049 ~0 ~2 ~8
