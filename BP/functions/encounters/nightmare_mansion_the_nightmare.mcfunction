# THREE REALMS — TASK 12 THE NIGHTMARE BOSS ENCOUNTER
# Controlled deterministic spawn inside the Nightmare Mansion.
# Run once with: /function encounters/nightmare_mansion_the_nightmare
# Position the player at the mansion's inner sanctum first.
#
# Rules:
# - One The Nightmare max within radius 32.
# - One The Nightmare per player world save (kill state stored on the closest
#   player scoreboard; cleared on world reset).
# - No automatic tick-driven spawn.
# - No global scan.
# - No ambient sound spam (one whisper cue at spawn).

execute positioned ~0 ~2 ~0 unless entity @e[type=three_realms:the_nightmare,r=32] unless score @p three_realms.the_nightmare_killed matches 1.. run playsound three_realms.the_nightmare.whisper @a ~ ~ ~ 0.35 0.40 0.04

execute positioned ~0 ~2 ~0 unless entity @e[type=three_realms:the_nightmare,r=32] unless score @p three_realms.the_nightmare_killed matches 1.. run summon three_realms:the_nightmare ~ ~ ~
execute positioned ~0 ~2 ~0 unless entity @e[type=three_realms:the_nightmare,r=32] unless score @p three_realms.the_nightmare_killed matches 1.. run tag @e[type=three_realms:the_nightmare,r=5] add three_realms.the_nightmare_active
