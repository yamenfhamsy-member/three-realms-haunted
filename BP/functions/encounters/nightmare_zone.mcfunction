# THREE REALMS — TASK 8 CONTROLLED ENCOUNTER FUNCTION
# Bedrock 1.26.x deterministic/manual encounter foundation.
# Execute at a region anchor; not an automatic spawn-rule claim.
# Each encounter is capped by a local radius check and uses no tick loop.
# Region: Nightmare Zone
# Mob intent: three_realms:scp096
# Anchor-relative spawn point: (14, 2, 8)
# Encounter policy: one mob max inside radius 24 at this anchor; no per-tick loop.

execute positioned ~14 ~2 ~8 unless entity @e[type=three_realms:scp096,r=24] run summon three_realms:scp096 ~ ~ ~
