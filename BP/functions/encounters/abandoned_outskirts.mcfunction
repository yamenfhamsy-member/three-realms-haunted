# THREE REALMS — TASK 8 CONTROLLED ENCOUNTER FUNCTION
# Bedrock 1.26.x deterministic/manual encounter foundation.
# Execute at a region anchor; not an automatic spawn-rule claim.
# Each encounter is capped by a local radius check and uses no tick loop.
# Region: Abandoned Outskirts
# Mob intent: three_realms:haunted_watcher
# Anchor-relative spawn point: (10, 1, 0)
# Encounter policy: one mob max inside radius 24 at this anchor; no per-tick loop.
# Audio policy: one short, quiet existing door cue before the guarded summon; no loop.
execute positioned ~0 ~0 ~0 unless entity @e[type=three_realms:haunted_watcher,r=24] run playsound three_realms.scpdt.door1.close @a ~ ~ ~ 0.18 0.65 0.02

execute positioned ~10 ~1 ~0 unless entity @e[type=three_realms:haunted_watcher,r=24] run summon three_realms:haunted_watcher ~ ~ ~
