# THREE REALMS — TASK 10 MORGUE WARDEN BOSS ENCOUNTER
# Controlled deterministic spawn inside the Abandoned Hospital morgue.
# Run once with: /function encounters/abandoned_hospital_morgue_warden
# Position the player at the morgue entrance first (anchor at the deepslate_bricks
# floor of the hospital interior).
#
# Rules:
# - One Morgue Warden max within radius 32.
# - One Morgue Warden per player world save (kill state stored on the closest
#   player scoreboard; cleared on world reset).
# - No automatic tick-driven spawn.
# - No global scan.
# - No ambient sound spam (one breath cue at spawn).

execute positioned ~0 ~2 ~0 unless entity @e[type=three_realms:morgue_warden,r=32] unless score @p three_realms.morgue_warden_killed matches 1.. run playsound three_realms.morgue_warden.breath @a ~ ~ ~ 0.35 0.50 0.05

execute positioned ~0 ~2 ~0 unless entity @e[type=three_realms:morgue_warden,r=32] unless score @p three_realms.morgue_warden_killed matches 1.. run summon three_realms:morgue_warden ~ ~ ~ three_realms:morgue_warden_active
execute positioned ~0 ~2 ~0 unless entity @e[type=three_realms:morgue_warden,r=32] unless score @p three_realms.morgue_warden_killed matches 1.. run tag @e[type=three_realms:morgue_warden,r=5] add three_realms.morgue_warden_active