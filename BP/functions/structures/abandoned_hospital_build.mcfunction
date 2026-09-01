# THREE REALMS — ABANDONED HOSPITAL
# Manual, deterministic structure-builder pipeline for Bedrock 1.26.x.
# Execute at the intended entrance anchor with:
# /function structures/abandoned_hospital_build
# The structure footprint is x=-14..14, y=0..10, z=-18..18 relative to execution.
# No portal, SCP, weapon, item, script, or worldgen files are changed by this function.

# Foundation and outer shell.
fill ~-14 ~0 ~-18 ~14 ~0 ~18 minecraft:deepslate_bricks
fill ~-14 ~1 ~-18 ~14 ~8 ~-18 minecraft:deepslate_bricks
fill ~-14 ~1 ~18 ~14 ~8 ~18 minecraft:deepslate_bricks
fill ~-14 ~1 ~-17 ~-14 ~8 ~17 minecraft:deepslate_bricks
fill ~14 ~1 ~-17 ~14 ~8 ~17 minecraft:deepslate_bricks
fill ~-14 ~9 ~-18 ~14 ~9 ~18 minecraft:deepslate_tiles

# Carve the walkable interior and create the central corridor.
fill ~-13 ~1 ~-17 ~13 ~8 ~17 minecraft:air
fill ~-2 ~1 ~-17 ~2 ~8 ~17 minecraft:polished_deepslate
fill ~-12 ~1 ~-16 ~-3 ~7 ~-3 minecraft:air
fill ~3 ~1 ~-16 ~12 ~7 ~-3 minecraft:air
fill ~-12 ~1 ~-2 ~-3 ~7 ~16 minecraft:air
fill ~3 ~1 ~-2 ~12 ~7 ~16 minecraft:air

# Entrance vestibule and reception.
fill ~-5 ~1 ~-17 ~5 ~4 ~-12 minecraft:air
fill ~-5 ~1 ~-16 ~5 ~1 ~-12 minecraft:polished_deepslate
fill ~-8 ~1 ~-16 ~-3 ~1 ~-10 minecraft:deepslate_bricks
fill ~-7 ~2 ~-16 ~-4 ~2 ~-16 minecraft:iron_bars
setblock ~-6 ~2 ~-14 minecraft:chest
loot insert ~-6 ~2 ~-14 slot.container 0 loot "loot_tables/entities/scpdt/scp131"

# Patient corridor with room thresholds and blocked routes.
fill ~-2 ~1 ~-16 ~2 ~1 ~16 minecraft:cracked_deepslate_bricks
fill ~-12 ~1 ~-4 ~-3 ~1 ~-4 minecraft:polished_deepslate
fill ~3 ~1 ~-4 ~12 ~1 ~-4 minecraft:polished_deepslate
fill ~-12 ~1 ~5 ~-3 ~1 ~5 minecraft:polished_deepslate
fill ~3 ~1 ~5 ~12 ~1 ~5 minecraft:polished_deepslate
fill ~-2 ~1 ~-9 ~2 ~3 ~-9 minecraft:sealed_blackstone
fill ~-2 ~1 ~8 ~2 ~3 ~8 minecraft:sealed_blackstone

# Treatment rooms: beds, observation windows, and environmental clues.
fill ~-11 ~1 ~-15 ~-4 ~1 ~-6 minecraft:stone
fill ~-11 ~2 ~-15 ~-4 ~2 ~-6 minecraft:air
fill ~4 ~1 ~-15 ~11 ~1 ~-6 minecraft:stone
fill ~4 ~2 ~-15 ~11 ~2 ~-6 minecraft:air
fill ~-11 ~1 ~6 ~-4 ~1 ~15 minecraft:stone
fill ~-11 ~2 ~6 ~-4 ~2 ~15 minecraft:air
fill ~4 ~1 ~6 ~11 ~1 ~15 minecraft:stone
fill ~4 ~2 ~6 ~11 ~2 ~15 minecraft:air
fill ~-3 ~3 ~-15 ~-3 ~5 ~-7 minecraft:iron_bars
fill ~3 ~3 ~-15 ~3 ~5 ~-7 minecraft:iron_bars
setblock ~-10 ~1 ~-13 minecraft:bed
setblock ~5 ~1 ~-13 minecraft:bed
setblock ~-10 ~1 ~9 minecraft:bed
setblock ~5 ~1 ~9 minecraft:bed
setblock ~-8 ~2 ~-12 minecraft:sculk_sensor
setblock ~8 ~2 ~-12 minecraft:sculk_sensor

# Operating area and utility room.
fill ~-12 ~1 ~-1 ~-3 ~1 ~4 minecraft:polished_blackstone
fill ~-12 ~2 ~-1 ~-3 ~2 ~4 minecraft:air
fill ~-11 ~1 ~0 ~-4 ~1 ~3 minecraft:iron_block
setblock ~-7 ~2 ~1 minecraft:lantern
fill ~4 ~1 ~-1 ~12 ~1 ~4 minecraft:stone
fill ~4 ~2 ~-1 ~12 ~6 ~4 minecraft:air
fill ~5 ~1 ~0 ~11 ~1 ~3 minecraft:iron_block
setblock ~10 ~2 ~2 minecraft:water

# Basement/service access: a vertical drop and a locked morgue route.
fill ~-1 ~1 ~10 ~1 ~1 ~12 minecraft:air
fill ~-1 ~0 ~10 ~1 ~0 ~12 minecraft:obsidilith_rune
fill ~-1 ~-4 ~10 ~1 ~-1 ~12 minecraft:deepslate_bricks
fill ~-10 ~-4 ~10 ~-2 ~-1 ~16 minecraft:deepslate_bricks
fill ~-9 ~-3 ~11 ~-3 ~-3 ~15 minecraft:air
fill ~-8 ~-2 ~12 ~-4 ~-2 ~14 minecraft:air
fill ~-8 ~-1 ~12 ~-4 ~-1 ~14 minecraft:air
setblock ~-6 ~-1 ~13 minecraft:chest
loot insert ~-6 ~-1 ~13 slot.container 0 loot "loot_tables/entities/scpdt/scp939"
fill ~3 ~-4 ~10 ~11 ~-1 ~16 minecraft:deepslate_bricks
fill ~4 ~-3 ~11 ~10 ~-3 ~15 minecraft:air
fill ~5 ~-2 ~12 ~9 ~-2 ~14 minecraft:air
fill ~5 ~-1 ~12 ~9 ~-1 ~14 minecraft:air
fill ~5 ~-1 ~12 ~9 ~-1 ~12 minecraft:sealed_blackstone
setblock ~7 ~-1 ~14 minecraft:obsidilith_rune

# Environmental storytelling and future-content anchors.
setblock ~-11 ~2 ~-2 minecraft:sculk_catalyst
setblock ~11 ~2 ~-2 minecraft:sculk_catalyst
setblock ~-10 ~2 ~3 minecraft:scp106_corrosion
setblock ~10 ~2 ~3 minecraft:scp106_corrosion
setblock ~-7 ~-1 ~14 minecraft:sealed_blackstone
setblock ~7 ~-1 ~14 minecraft:obsidilith_rune

# Controlled horror encounter: one existing SCP mob in the treatment wing.
summon three_realms:scp939 ~8 ~2 ~-8

# Signpost the next content hooks without creating new mobs or bosses.
setblock ~-1 ~2 ~-14 minecraft:oak_sign
setblock ~1 ~2 ~-14 minecraft:oak_sign
# Future hooks: Patient/Doctor content at treatment rooms; Morgue Warden content below.
