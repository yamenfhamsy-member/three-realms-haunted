# THREE REALMS — TASK 8 CONTROLLED ENCOUNTER FUNCTION
# Bedrock 1.26.x deterministic/manual encounter foundation.
# Execute at a region anchor; not an automatic spawn-rule claim.
# Each encounter is capped by a local radius check and uses no tick loop.
# Region: Dead Forest
# Mob intent: three_realms:scp939
# Anchor-relative spawn point: (11, 1, 4)
# Encounter policy: one mob max inside radius 24 at this anchor; no per-tick loop.

execute positioned ~11 ~1 ~4 unless entity @e[type=three_realms:scp939,r=24] run summon three_realms:scp939 ~ ~ ~
