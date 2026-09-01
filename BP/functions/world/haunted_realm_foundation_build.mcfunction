# THREE REALMS — TASK 7 STATIC HAUNTED/NIGHTMARE REALM FOUNDATION
# Deterministic Bedrock 1.26.x function; execute at the realm foundation origin.
# This is not procedural worldgen. It creates a static route and region markers.
# No bosses, new mobs, new items, new blocks, or new external assets.

# Foundation corridor: each region occupies a deterministic 24x24 pad centered on x=region_x.
fill ~-8 ~0 ~-4 344 ~0 ~4 minecraft:gravel
fill ~-8 ~1 ~-4 344 ~1 ~4 minecraft:polished_deepslate
# REGION Abandoned Outskirts — x=0; transition zone with ruined road, debris, and distant encounter sightlines
fill ~-12 ~0 ~-12 ~12 ~0 ~12 minecraft:coarse_dirt
fill ~-12 ~1 ~-12 ~-12 ~3 ~12 minecraft:deepslate_bricks
fill ~12 ~1 ~-12 ~12 ~3 ~12 minecraft:deepslate_bricks
fill ~-11 ~1 ~-11 ~11 ~1 ~11 minecraft:gravel
fill ~-2 ~1 ~-11 ~2 ~1 ~11 minecraft:gravel
fill ~-8 ~1 ~-8 ~8 ~1 ~8 minecraft:coarse_dirt
setblock ~0 ~2 ~0 three_realms:obsidilith_rune
# Structure mapping: haunted_house_build
# Static mob intent: three_realms:haunted_watcher — documentation intent only; no spawn-rule changes.

# REGION Dead Forest — x=48; sparse silhouettes, dark path, isolated clearing, and stalking sightlines
fill ~36 ~0 ~-12 ~60 ~0 ~12 minecraft:podzol
fill ~36 ~1 ~-12 ~36 ~3 ~12 minecraft:deepslate_tiles
fill ~60 ~1 ~-12 ~60 ~3 ~12 minecraft:deepslate_tiles
fill ~37 ~1 ~-11 ~59 ~1 ~11 minecraft:dark_oak_log
fill ~46 ~1 ~-11 ~50 ~1 ~11 minecraft:gravel
fill ~40 ~1 ~-8 ~56 ~1 ~8 minecraft:podzol
setblock ~48 ~2 ~0 three_realms:obsidilith_rune
fill ~40 ~1 ~-8 ~40 ~6 ~-8 minecraft:dark_oak_log
fill ~55 ~1 ~5 ~55 ~5 ~5 minecraft:dark_oak_log
setblock ~40 ~7 ~-8 minecraft:dark_oak_leaves
setblock ~55 ~6 ~5 minecraft:dark_oak_leaves
setblock ~51 ~2 ~-5 minecraft:cobweb
# Structure mapping: existing regional environment only
# Static mob intent: three_realms:scp939 — documentation intent only; no spawn-rule changes.

# REGION Cemetery District — x=96; grave fields, paths, fences, mausoleum route, and crypt connection
fill ~84 ~0 ~-12 ~108 ~0 ~12 minecraft:coarse_dirt
fill ~84 ~1 ~-12 ~84 ~3 ~12 minecraft:deepslate_bricks
fill ~108 ~1 ~-12 ~108 ~3 ~12 minecraft:deepslate_bricks
fill ~85 ~1 ~-11 ~107 ~1 ~11 minecraft:stone_bricks
fill ~94 ~1 ~-11 ~98 ~1 ~11 minecraft:gravel
fill ~88 ~1 ~-8 ~104 ~1 ~8 minecraft:coarse_dirt
setblock ~96 ~2 ~0 three_realms:obsidilith_rune
fill ~87 ~1 ~-8 ~105 ~1 ~-8 minecraft:stone_bricks
fill ~87 ~1 ~8 ~105 ~1 ~8 minecraft:stone_bricks
fill ~89 ~1 ~-5 ~91 ~2 ~-3 minecraft:bone_block
fill ~100 ~1 ~3 ~102 ~2 ~5 minecraft:bone_block
setblock ~96 ~2 ~6 minecraft:soul_lantern
# Structure mapping: cemetery_complex_build
# Static mob intent: three_realms:scp106 — documentation intent only; no spawn-rule changes.

# REGION Abandoned Hospital — x=144; existing hospital anchor and exterior decay/service transition; hospital is not rebuilt here
fill ~132 ~0 ~-12 ~156 ~0 ~12 minecraft:polished_deepslate
fill ~132 ~1 ~-12 ~132 ~3 ~12 minecraft:deepslate_bricks
fill ~156 ~1 ~-12 ~156 ~3 ~12 minecraft:deepslate_bricks
fill ~133 ~1 ~-11 ~155 ~1 ~11 minecraft:gravel
fill ~142 ~1 ~-11 ~146 ~1 ~11 minecraft:gravel
fill ~136 ~1 ~-8 ~152 ~1 ~8 minecraft:polished_deepslate
setblock ~144 ~2 ~0 three_realms:obsidilith_rune
fill ~133 ~1 ~-10 ~155 ~1 ~-8 minecraft:gravel
fill ~133 ~1 ~8 ~155 ~1 ~10 minecraft:gravel
setblock ~136 ~2 ~-6 three_realms:scp106_corrosion
setblock ~152 ~2 ~6 minecraft:sculk_sensor
# Structure mapping: abandoned_hospital_build
# Static mob intent: three_realms:scp939 — documentation intent only; no spawn-rule changes.

# REGION Cursed Village — x=192; ruined street, empty homes, concealed path, and uncertain space
fill ~180 ~0 ~-12 ~204 ~0 ~12 minecraft:coarse_dirt
fill ~180 ~1 ~-12 ~180 ~3 ~12 minecraft:cobblestone
fill ~204 ~1 ~-12 ~204 ~3 ~12 minecraft:cobblestone
fill ~181 ~1 ~-11 ~203 ~1 ~11 minecraft:dark_oak_planks
fill ~190 ~1 ~-11 ~194 ~1 ~11 minecraft:gravel
fill ~184 ~1 ~-8 ~200 ~1 ~8 minecraft:coarse_dirt
setblock ~192 ~2 ~0 three_realms:obsidilith_rune
fill ~182 ~1 ~-7 ~190 ~1 ~-5 minecraft:cobblestone
fill ~194 ~1 ~4 ~202 ~1 ~6 minecraft:cobblestone
fill ~182 ~2 ~-7 ~190 ~4 ~-5 minecraft:air
fill ~194 ~2 ~4 ~202 ~4 ~6 minecraft:air
fill ~191 ~1 ~-11 ~193 ~3 ~-9 three_realms:sealed_blackstone
# Structure mapping: cursed_mansion_build
# Static mob intent: three_realms:scp966 — documentation intent only; no spawn-rule changes.

# REGION Old Laboratory — x=240; facility approach, service route, restricted boundary, and hospital connection
fill ~228 ~0 ~-12 ~252 ~0 ~12 minecraft:polished_deepslate
fill ~228 ~1 ~-12 ~228 ~3 ~12 minecraft:deepslate_tiles
fill ~252 ~1 ~-12 ~252 ~3 ~12 minecraft:deepslate_tiles
fill ~229 ~1 ~-11 ~251 ~1 ~11 minecraft:iron_block
fill ~238 ~1 ~-11 ~242 ~1 ~11 minecraft:gravel
fill ~232 ~1 ~-8 ~248 ~1 ~8 minecraft:polished_deepslate
setblock ~240 ~2 ~0 three_realms:obsidilith_rune
fill ~231 ~2 ~-6 ~249 ~2 ~6 minecraft:iron_bars
fill ~234 ~1 ~-4 ~236 ~3 ~-2 minecraft:iron_block
fill ~244 ~1 ~2 ~246 ~3 ~4 minecraft:glass
fill ~239 ~1 ~9 ~241 ~3 ~11 three_realms:sealed_blackstone
# Structure mapping: abandoned_laboratory_build
# Static mob intent: three_realms:scp191 — documentation intent only; no spawn-rule changes.

# REGION Crypt Depths — x=288; descending burial route, claustrophobic chamber, and controlled encounter space
fill ~276 ~0 ~-12 ~300 ~0 ~12 minecraft:deepslate_bricks
fill ~276 ~1 ~-12 ~276 ~3 ~12 minecraft:polished_blackstone
fill ~300 ~1 ~-12 ~300 ~3 ~12 minecraft:polished_blackstone
fill ~277 ~1 ~-11 ~299 ~1 ~11 minecraft:bone_block
fill ~286 ~1 ~-11 ~290 ~1 ~11 minecraft:gravel
fill ~280 ~1 ~-8 ~296 ~1 ~8 minecraft:deepslate_bricks
setblock ~288 ~2 ~0 three_realms:obsidilith_rune
fill ~280 ~1 ~-6 ~283 ~2 ~-3 minecraft:bone_block
fill ~293 ~1 ~3 ~296 ~2 ~6 minecraft:bone_block
fill ~286 ~-4 ~8 ~290 ~-1 ~12 minecraft:deepslate_bricks
fill ~287 ~-3 ~9 ~289 ~-1 ~11 minecraft:air
# Structure mapping: crypt_build
# Static mob intent: three_realms:scp439 — documentation intent only; no spawn-rule changes.

# REGION Nightmare Zone — x=336; distorted route, isolated landmark, and future boss location without boss implementation
fill ~324 ~0 ~-12 ~348 ~0 ~12 minecraft:crying_obsidian
fill ~324 ~1 ~-12 ~324 ~3 ~12 minecraft:obsidian
fill ~348 ~1 ~-12 ~348 ~3 ~12 minecraft:obsidian
fill ~325 ~1 ~-11 ~347 ~1 ~11 minecraft:purpur_block
fill ~334 ~1 ~-11 ~338 ~1 ~11 minecraft:gravel
fill ~328 ~1 ~-8 ~344 ~1 ~8 minecraft:crying_obsidian
setblock ~336 ~2 ~0 three_realms:obsidilith_rune
fill ~327 ~1 ~-9 ~329 ~5 ~-7 minecraft:crying_obsidian
fill ~343 ~1 ~7 ~345 ~5 ~9 minecraft:obsidian
fill ~334 ~1 ~-11 ~338 ~1 ~-8 minecraft:purpur_block
fill ~334 ~2 ~-10 ~338 ~5 ~-9 minecraft:air
# Structure mapping: nightmare_mansion_build
# Static mob intent: three_realms:scp096 — documentation intent only; no spawn-rule changes.

