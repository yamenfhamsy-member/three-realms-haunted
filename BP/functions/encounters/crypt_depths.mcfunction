# THREE REALMS — TASK 8 CONTROLLED ENCOUNTER FUNCTION
# Bedrock 1.26.x deterministic/manual encounter foundation.
# Execute at a region anchor; not an automatic spawn-rule claim.
# Each encounter is capped by a local radius check and uses no tick loop.
# Region: Crypt Depths
# Mob intent: three_realms:scp439
# Anchor-relative spawn point: (12, 1, 7)
# Encounter policy: one mob max inside radius 24 at this anchor; no per-tick loop.

execute positioned ~12 ~1 ~7 unless entity @e[type=three_realms:scp439,r=24] run summon three_realms:scp439 ~ ~ ~

# TASK 11 ADDITIVE NOTE — Lady of the Crypt boss encounter
# The Lady of the Crypt boss is summoned via the dedicated function:
# /function encounters/crypt_depths_lady_of_the_crypt
# The scp439 guard above is preserved exactly.
