# THREE REALMS — TASK 8/10 CONTROLLED ENCOUNTER FUNCTION
# Bedrock 1.26.x deterministic/manual encounter foundation.
# Execute at a region anchor; not an automatic spawn-rule claim.
# Each encounter is capped by a local radius check and uses no tick loop.
# Region: Abandoned Hospital
# Mob intent: three_realms:scp939
# Anchor-relative spawn point: (12, 2, -8)
# Encounter policy: one mob max inside radius 24 at this anchor; no per-tick loop.
# Audio policy: one short, quiet existing door cue before the guarded summon; no loop.
execute positioned ~0 ~0 ~0 unless entity @e[type=three_realms:scp939,r=24] run playsound three_realms.scpdt.door1.close @a ~ ~ ~ 0.16 0.60 0.02

execute positioned ~12 ~2 ~-8 unless entity @e[type=three_realms:scp939,r=24] run summon three_realms:scp939 ~ ~ ~

# THREE REALMS — TASK 10 MORGUE WARDEN BOSS ENCOUNTER
# Controlled deterministic boss spawn inside the Abandoned Hospital morgue.
# Triggered by /function encounters/abandoned_hospital_morgue_warden.
# This function is a no-op when called as encounters/abandoned_hospital; the boss
# is summoned only by the dedicated morgue function to keep the regular
# encounter loop free of automatic boss spawns.
# (intentionally empty here; see encounters/abandoned_hospital_morgue_warden.mcfunction)