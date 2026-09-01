# TASK 7 — HAUNTED / NIGHTMARE REALM FOUNDATION

This is a static/deterministic environment foundation for Minecraft Bedrock 1.26.x. It is not a claim of automatic procedural world generation.

## Connectivity

`Abandoned Outskirts → Dead Forest → Cemetery District → Abandoned Hospital → Cursed Village → Old Laboratory → Crypt Depths → Nightmare Zone`


| Region | Relative anchor | Identity | Structure mapping | Static mob intent |
|---|---:|---|---|---|
| Abandoned Outskirts | x=0, y=0, z=0 | transition zone with ruined road, debris, and distant encounter sightlines | haunted_house_build | three_realms:haunted_watcher; intent only, no spawn-rule edits |
| Dead Forest | x=48, y=0, z=0 | sparse silhouettes, dark path, isolated clearing, and stalking sightlines | Existing environment only | three_realms:scp939; intent only, no spawn-rule edits |
| Cemetery District | x=96, y=0, z=0 | grave fields, paths, fences, mausoleum route, and crypt connection | cemetery_complex_build | three_realms:scp106; intent only, no spawn-rule edits |
| Abandoned Hospital | x=144, y=0, z=0 | existing hospital anchor and exterior decay/service transition; hospital is not rebuilt here | abandoned_hospital_build | three_realms:scp939; intent only, no spawn-rule edits |
| Cursed Village | x=192, y=0, z=0 | ruined street, empty homes, concealed path, and uncertain space | cursed_mansion_build | three_realms:scp966; intent only, no spawn-rule edits |
| Old Laboratory | x=240, y=0, z=0 | facility approach, service route, restricted boundary, and hospital connection | abandoned_laboratory_build | three_realms:scp191; intent only, no spawn-rule edits |
| Crypt Depths | x=288, y=0, z=0 | descending burial route, claustrophobic chamber, and controlled encounter space | crypt_build | three_realms:scp439; intent only, no spawn-rule edits |
| Nightmare Zone | x=336, y=0, z=0 | distorted route, isolated landmark, and future boss location without boss implementation | nightmare_mansion_build | three_realms:scp096; intent only, no spawn-rule edits |

## Implementation boundary

The function `BP/functions/world/haunted_realm_foundation_build.mcfunction` creates an 8-region linear route with distinct block palettes, path segments, landmark runes, environmental silhouettes, controlled decay cues, and structure mapping comments. The existing Abandoned Hospital function is referenced as a mapping but is not rebuilt inside this foundation function. No boss, new mob, new weapon, new armor, new block/item, automatic worldgen, new sound, or new particle is introduced.


## Runtime limitation

> Runtime: **NOT TESTED — ENVIRONMENT LIMITATION**.

Static deterministic placement is not equivalent to tested world generation, spawning, rendering, or gameplay.

