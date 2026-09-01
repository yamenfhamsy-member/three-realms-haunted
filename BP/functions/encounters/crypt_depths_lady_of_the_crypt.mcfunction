# THREE REALMS — TASK 11 LADY OF THE CRYPT BOSS ENCOUNTER
# Controlled deterministic spawn inside the Crypt Depths.
# Run once with: /function encounters/crypt_depths_lady_of_the_crypt
# Position the player at the crypt entrance first (anchor at the deepslate_bricks
# floor of the crypt interior).
#
# Rules:
# - One Lady of the Crypt max within radius 32.
# - One Lady of the Crypt per player world save (kill state stored on the closest
#   player scoreboard; cleared on world reset).
# - No automatic tick-driven spawn.
# - No global scan.
# - No ambient sound spam (one ambient cue at spawn).

execute positioned ~0 ~2 ~0 unless entity @e[type=three_realms:lady_of_the_crypt,r=32] unless score @p three_realms.lady_of_the_crypt_killed matches 1.. run playsound three_realms.lady_of_the_crypt.ambient @a ~ ~ ~ 0.30 0.50 0.04

execute positioned ~0 ~2 ~0 unless entity @e[type=three_realms:lady_of_the_crypt,r=32] unless score @p three_realms.lady_of_the_crypt_killed matches 1.. run summon three_realms:lady_of_the_crypt ~ ~ ~
execute positioned ~0 ~2 ~0 unless entity @e[type=three_realms:lady_of_the_crypt,r=32] unless score @p three_realms.lady_of_the_crypt_killed matches 1.. run tag @e[type=three_realms:lady_of_the_crypt,r=5] add three_realms.lady_of_the_crypt_active