# THREE REALMS — TASK 8 CONTROLLED ENCOUNTER FUNCTION
# Bedrock 1.26.x deterministic/manual encounter foundation.
# Execute at a region anchor; not an automatic spawn-rule claim.
# Each encounter is capped by a local radius check and uses no tick loop.
# Region: Cemetery District
# Mob intent: three_realms:scp106
# Anchor-relative spawn point: (10, 1, -4)
# Encounter policy: one mob max inside radius 24 at this anchor; no per-tick loop.
# Audio policy: one short, quiet existing door cue before the guarded summon; no loop.
execute positioned ~0 ~0 ~0 unless entity @e[type=three_realms:scp106,r=24] run playsound three_realms.scpdt.door1.close @a ~ ~ ~ 0.14 0.55 0.02

execute positioned ~10 ~1 ~-4 unless entity @e[type=three_realms:scp106,r=24] run summon three_realms:scp106 ~ ~ ~
