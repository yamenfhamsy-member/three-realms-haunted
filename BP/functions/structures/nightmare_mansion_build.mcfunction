# THREE REALMS — deterministic Bedrock 1.26.x structure builder
# Execute at the documented anchor/origin with /function structures/<name>
# No bosses, new mobs, worldgen, dimensions, or new assets are created here.
# Structure: nightmare_mansion_build
# Anchor/origin: Nightmare Zone — anchor N1 (recommended conceptual origin: 160 70 0)
# Purpose: surreal mansion with distorted routes, isolated rooms, hidden passages and future boss chamber

fill ~-15 ~0 ~-15 ~15 ~0 ~15 minecraft:deepslate_tiles
fill ~-15 ~1 ~-15 ~15 ~7 ~-15 minecraft:deepslate_bricks
fill ~-15 ~1 ~15 ~15 ~7 ~15 minecraft:deepslate_bricks
fill ~-15 ~1 ~-14 ~-15 ~7 ~14 minecraft:deepslate_bricks
fill ~15 ~1 ~-14 ~15 ~7 ~14 minecraft:deepslate_bricks
fill ~-15 ~8 ~-15 ~15 ~8 ~15 minecraft:deepslate_tiles
fill ~-14 ~1 ~-14 ~14 ~6 ~14 minecraft:air
fill ~-3 ~1 ~-14 ~-1 ~6 ~14 minecraft:polished_deepslate
fill ~1 ~1 ~-14 ~3 ~6 ~14 minecraft:polished_deepslate
fill ~-13 ~1 ~-13 ~-4 ~4 ~-4 minecraft:air
fill ~4 ~1 ~4 ~13 ~4 ~13 minecraft:air
fill ~-13 ~1 ~5 ~-4 ~4 ~13 minecraft:air
fill ~4 ~1 ~-13 ~13 ~4 ~-4 minecraft:air
fill ~-12 ~2 ~-2 ~-5 ~4 ~1 minecraft:air
fill ~5 ~2 ~-1 ~12 ~4 ~2 minecraft:air
fill ~-12 ~1 ~-2 ~-5 ~1 ~1 three_realms:sealed_blackstone
fill ~5 ~1 ~-1 ~12 ~1 ~2 three_realms:sealed_blackstone
fill ~-1 ~1 ~-1 ~1 ~1 ~1 three_realms:obsidilith_rune
fill ~-4 ~1 ~-4 ~4 ~1 ~4 minecraft:polished_blackstone
fill ~-2 ~2 ~-2 ~2 ~5 ~2 minecraft:air
fill ~-1 ~2 ~-1 ~1 ~2 ~1 minecraft:sculk_catalyst
setblock ~-10 ~2 ~9 three_realms:scp106_corrosion
setblock ~10 ~2 ~-9 three_realms:scp106_corrosion
setblock ~0 ~2 ~10 minecraft:chest
loot insert ~0 ~2 ~10 loot "loot_tables/entities/scpdt/scp131"
loot insert ~0 ~2 ~10 loot "loot_tables/lore/nightmare_final_note"
loot insert ~0 ~2 ~10 loot "loot_tables/chests/rare_rewards"
summon three_realms:scp096 ~8 ~2 ~8
