# AGENTS.md
# THREE REALMS — HAUNTED REALM
# Minecraft Bedrock Mobile 1.26.x
# Agent operating rules, workspace policy, research policy,
# asset acquisition policy, implementation workflow, and QA rules

---

# 0. PROJECT IDENTITY

Project name:

THREE REALMS

Current world:

HAUNTED / NIGHTMARE REALM

Namespace:

three_realms

Target platform:

Minecraft Bedrock Edition Mobile
Android / iOS

Target version family:

Minecraft Bedrock 1.26.x

Do NOT target Minecraft 1.21.x.

The project is a Minecraft Bedrock Add-On.

The project consists primarily of:

- Behavior Pack
- Resource Pack
- Bedrock-compatible scripts when required
- Supporting tools
- Supporting source assets
- Documentation
- Tests
- Build/package artifacts

---

# 1. PRIMARY PROJECT REPOSITORY

The user's current project repository is:

https://github.com/yamensyfham-cmyk/minecraft-addon-hor

Current baseline release:

v1.0

Release URL:

https://github.com/yamensyfham-cmyk/minecraft-addon-hor/releases/tag/v1.0

Current saved artifact:

three_realms_haunted.mcaddon

IMPORTANT:

This repository/release is the user's current baseline.

Do NOT assume the repository is disposable.

Do NOT overwrite the original baseline.

Do NOT destroy the existing implementation.

Create a working copy before making significant changes.

The current release is a starting point, not something to rebuild
from zero.

---

# 2. WORKSPACE LOCATION RULE

The permanent working project MUST live under HOME.

Preferred location:

~/three_realms

The project may contain:

~/three_realms/
    BP/
    RP/
    scripts/
    tools/
    tests/
    docs/
    assets/
    reference/
    build/
    backups/
    AGENTS.md

Use the actual project structure when one already exists.

Do not unnecessarily reorganize a working project.

---

# 3. ABSOLUTE DOWNLOAD DIRECTORY RULE

THIS RULE IS MANDATORY.

EVERYTHING DOWNLOADED FROM THE INTERNET MUST FIRST BE DOWNLOADED
UNDER /tmp.

This includes:

- Git repositories cloned for inspection
- GitHub archives
- GitHub release assets
- .zip files
- .tar.gz files
- .mcaddon files
- .mcpack files
- .mcworld files
- texture packs
- image files
- PNG assets
- model files
- OBJ
- FBX
- glTF
- GLB
- WAV
- OGG
- MP3
- sound libraries
- sample projects
- documentation exports
- installer packages
- executable installers
- MCT downloads
- Blockbench downloads
- Blender downloads
- scripts downloaded from external sources
- reference repositories
- external Add-Ons
- third-party libraries downloaded as archives
- test fixtures downloaded from the internet

NEVER clone or download an external repository directly into:

~/three_realms/

Instead:

1. Download/clone into /tmp.
2. Inspect it there.
3. Verify provenance/license there.
4. Extract/process it there.
5. Only copy the required files into the permanent project
   when they are approved for use.

Example:

GOOD:

/tmp/three_realms_downloads/
/tmp/reference_bomd/
/tmp/official_bedrock_samples/
/tmp/texture_sources/
/tmp/sound_sources/

then copy approved files to:

~/three_realms/

BAD:

~/three_realms/bomd/
~/three_realms/downloads/
~/three_realms/random_texture.zip

---

# 4. TEMPORARY DOWNLOAD STRUCTURE

Use a dedicated temporary workspace.

Preferred:

/tmp/three_realms_workspace/

Inside:

/tmp/three_realms_workspace/
    downloads/
    git/
    archives/
    extracted/
    installers/
    tools/
    textures/
    models/
    sounds/
    docs/
    inspection/
    logs/
    staging/

You may create more folders when useful.

All external downloads must remain under this temporary tree
until they are approved and copied into the permanent project.

---

# 5. TOOL DOWNLOAD POLICY

When installing tools:

The installer/archive/download MUST first exist under:

/tmp/three_realms_workspace/installers/

or:

/tmp/three_realms_workspace/tools/

Examples:

/tmp/three_realms_workspace/installers/tool.zip
/tmp/three_realms_workspace/tools/blockbench/
 /tmp/three_realms_workspace/tools/reference-tool/

Do not download installers into:

~/Downloads
~/Desktop
~/three_realms

Use /tmp first.

If a tool can be installed through an existing package manager,
prefer the package manager, but configure download/cache directories
under /tmp whenever the package manager safely supports that.

Do not copy random downloaded binaries directly into the project.

Only actual project-related source/configuration files belong
inside ~/three_realms.

---

# 6. PACKAGE CACHE POLICY

When possible, use temporary caches under:

/tmp/three_realms_workspace/cache/

for:

- npm
- pip
- package downloads
- archive extraction
- model conversion
- image processing
- other temporary package artifacts

Do not unnecessarily pollute the project with dependency caches.

Do not commit:

- node_modules
- Python virtual environments
- package caches
- downloaded installers
- temporary archives
- build scratch files

unless explicitly required by the project.

---

# 7. WHAT IS PERMANENT

Only approved project materials should remain in:

~/three_realms/

Permanent materials include:

- source code
- Behavior Pack
- Resource Pack
- approved asset files
- approved textures
- approved models
- approved sounds
- scripts
- project configs
- documentation
- tests
- build scripts
- reproducible asset metadata
- license/attribution records
- final package when intentionally stored

Temporary internet downloads should NOT remain unless they
have been intentionally promoted to approved project assets.

---

# 8. USER'S BASELINE MUST BE PRESERVED

Before significant modifications:

Create a backup in:

~/three_realms/backups/

The baseline should include at minimum:

- current project source
- current manifests
- current BP
- current RP
- current scripts
- current docs

Create a timestamped backup.

Example:

~/three_realms/backups/baseline_YYYY-MM-DD_HH-MM-SS/

Do NOT rely only on GitHub.

Do NOT delete the user's current baseline.

---

# 9. GIT RULES

The working project should remain under Git.

Before substantial work:

git status

Record the current branch and commit.

Never perform destructive Git commands such as:

- git reset --hard
- git clean -fd
- force push
- deleting branches

unless explicitly instructed by the user.

Prefer:

- new branch
- normal commit
- small commits
- reversible changes

Suggested branch naming:

feature/haunted-portal
feature/watcher
feature/crawler
feature/wailer
feature/morgue-warden

---

# 10. EXTERNAL PROJECT REFERENCE POLICY

Technical references may be used.

Potential reference sources include:

1. Official Mojang/Microsoft Bedrock Samples
2. Official Minecraft Creator documentation
3. BOMD-Bedrock
4. Other legitimate open-source Bedrock projects

Official samples:

https://github.com/Mojang/bedrock-samples

BOMD-Bedrock:

https://github.com/vandaaniels/BOMD-Bedrock

IMPORTANT:

The current BOMD-Bedrock repository states that its current version
targets Minecraft Bedrock 1.26.40+ and Script API @minecraft/server
2.9.0.

DO NOT assume BOMD is compatible with every 1.26.x version.

Verify the actual target version first.

---

# 11. REFERENCE PROJECT DOWNLOAD RULE

When downloading BOMD or another reference:

FIRST:

download/clone into:

/tmp/three_realms_workspace/git/

Example:

/tmp/three_realms_workspace/git/BOMD-Bedrock/

DO NOT clone directly into:

~/three_realms/

Inspect first.

Only after approval should relevant technical material be
copied/adapted into the working project.

Do not destroy the original reference.

---

# 12. REFERENCE PROJECT PURPOSE

A reference project is used to learn:

- Bedrock architecture
- Behavior Pack organization
- Resource Pack organization
- entity architecture
- scripts
- boss systems
- animation systems
- particles
- sounds
- structures
- recipes
- loot
- build workflows
- testing workflows
- performance patterns

Do NOT blindly copy its content.

Do NOT assume its APIs are current.

Do NOT assume its assets are free to redistribute.

---

# 13. OFFICIAL DOCUMENTATION FIRST

For Minecraft Bedrock technical questions:

The primary authority is current official Microsoft/Minecraft
Creator documentation.

Use:

https://learn.microsoft.com/en-us/minecraft/creator/

Also inspect:

https://github.com/Mojang/bedrock-samples

when official examples are useful.

Before implementing:

- entities
- blocks
- items
- scripts
- dimensions
- animations
- controllers
- particles
- render controllers
- custom geometry
- manifest changes
- API changes

read the relevant current documentation first.

---

# 14. CUSTOM DIMENSION RULE

The Haunted Realm is intended to be a separate realm.

Investigate the CURRENT official Custom Dimension implementation.

Relevant official concepts may include:

- DimensionRegistry
- registerCustomDimension
- startup registration
- dimension definitions
- generation
- teleportation

Do not rely on an old tutorial.

The official current Custom Dimension workflow must be checked
against the actual target 1.26.x environment.

If Custom Dimensions are supported:

implement them correctly.

If they require an experimental/Beta API:

document it clearly.

If they are unavailable or unsafe in the target configuration:

do not fake a custom dimension.

Use the strongest supported alternative and document it.

---

# 15. TARGET VERSION POLICY

Supported target family:

Minecraft Bedrock 1.26.x

Do NOT support 1.21.x.

Do NOT silently raise the minimum version above the intended target.

Do NOT use APIs from a later Bedrock release without verification.

Create:

docs/BEDROCK_126_COMPATIBILITY.md

Track:

- exact target version
- tested version
- API version
- experimental requirements
- unsupported features
- known differences between 1.26.x releases

---

# 16. VERSION MINIMUM RULE

Choose the lowest practical 1.26.x version that supports
the actual implementation.

Do not use:

min_engine_version

or a Script API version

higher than necessary.

Do not claim all 1.26.x versions work without evidence.

Separate:

CONFIRMED TESTED
DOCUMENTATION VERIFIED
NOT TESTED
UNSUPPORTED

---

# 17. CURRENT BASELINE PROJECT

Before any modification:

Inspect the user's existing repository/release.

Current repository:

https://github.com/yamensyfham-cmyk/minecraft-addon-hor

Current release:

v1.0

Do NOT assume the current source state is identical to the
.mcaddon artifact.

Compare if both are available.

Determine:

- BP structure
- RP structure
- scripts
- manifests
- UUIDs
- current portal
- current assets
- current animations
- current particles
- current sounds
- current structures

Create:

docs/BASELINE_AUDIT.md

---

# 18. DO NOT REBUILD FROM SCRATCH

The existing project is the starting point.

Preserve working systems.

Prefer:

AUDIT
→
ADAPT
→
EXTEND
→
VALIDATE

instead of:

DELETE
→
REBUILD

Only rewrite a system if there is a clear technical reason.

---

# 19. ASSET POLICY

For this project:

READY-MADE ASSETS ARE PREFERRED.

Use ready-made:

- textures
- 3D models
- sounds

when appropriate and legally usable.

DO NOT unnecessarily regenerate good assets.

DO NOT modify good assets simply because an AI could generate
something else.

The goal is to preserve:

- quality
- detail
- resolution
- visual fidelity

---

# 20. TEXTURE POLICY

Use ready-made textures where suitable.

DO NOT:

- repaint
- recolor
- pixelate
- crop
- resize
- upscale
- downscale
- sharpen
- blur
- denoise
- alter transparency
- alter colors

unless a purely technical format conversion is absolutely required.

Preferred:

KEEP ORIGINAL
→
PLACE CORRECTLY
→
REFERENCE CORRECTLY
→
ADAPT UV IF NEEDED
→
VALIDATE

Do not modify the artwork itself.

---

# 21. MODEL POLICY

Use ready-made 3D models where suitable.

Preferred formats:

- Bedrock geometry
- Blockbench-compatible models
- legally convertible 3D formats

When conversion is necessary:

perform ONLY the technical conversion needed to make it
compatible with Bedrock.

Preserve whenever possible:

- geometry
- silhouette
- proportions
- bones
- pivots
- UV
- animation structure
- texture mapping

Do not artistically redesign an existing model.

---

# 22. SOUND POLICY

Use ready-made sound assets where suitable.

Preferred sources include:

- Pixabay
- Freesound
- OpenGameArt
- other clearly licensed sound libraries

Before using any external sound:

record:

- source
- author
- license
- original filename
- final filename
- usage

Create:

docs/SOUND_SOURCES.md

Do not use:

- ripped movie audio
- ripped game audio
- copyrighted franchise sounds
- copyrighted character voices
- copyrighted soundtrack material

---

# 23. TEXTURE SOURCE RECORD

For each external texture create/maintain:

docs/TEXTURE_SOURCES.md

Record:

- filename
- source URL
- author
- license
- original resolution
- where used
- whether modified
- whether only technical conversion was performed

---

# 24. MODEL SOURCE RECORD

Create:

docs/MODEL_SOURCES.md

Record:

- filename
- source URL
- author
- license
- original format
- converted format
- conversion performed
- where used

---

# 25. ASSET PROVENANCE

Create:

docs/ASSET_PROVENANCE.md

Classify assets:

OFFICIAL
OPEN_SOURCE
CC0
CC-BY
OTHER_CLEAR_LICENSE
USER_CREATED
DERIVED
UNKNOWN
DO_NOT_USE

Never silently use UNKNOWN assets in the final build.

If an asset's origin cannot be verified:

do not integrate it into the production build.

---

# 26. IMAGE GENERATION POLICY

Image-generation tools may be used for:

- concept references
- temporary design exploration
- missing visual references

But because the project prefers ready-made assets:

Do NOT regenerate an existing high-quality production texture.

Only use image generation when:

- an approved asset does not exist
- the user explicitly wants a new asset
- or a concept image is needed

When creating final production artwork through image generation,
document the generation source/tool.

Do not use Python to create the final artistic texture.

---

# 27. MOBILE-FIRST ART POLICY

The game runs on mobile.

Textures, models and sounds must remain practical for Android/iOS.

Prefer:

- efficient texture sizes
- low-poly geometry
- controlled particles
- short/efficient sound assets
- efficient animation controllers

Do not sacrifice visual quality unnecessarily.

---

# 28. PORTAL IMPLEMENTATION

The Haunted Portal is the first major system.

Identifier:

three_realms:haunted_portal

Portal surface:

three_realms:cursed_gate_core

Activation item:

three_realms:soul_igniter

Physical frame:

5 blocks wide
6 blocks high

Inner opening:

3 blocks wide
4 blocks high

---

# 29. PORTAL ACCESS RULE

The player MUST access Haunted through a physical portal.

DO NOT unlock the realm through:

- day progression
- night progression
- sleeping
- time
- timer
- random teleport
- coordinate-only trigger
- automatic event

Required flow:

OVERWORLD
→
PLAYER GETS PORTAL MATERIALS
→
PLAYER BUILDS PORTAL
→
PLAYER USES ACTIVATION ITEM
→
ACTIVATING
→
CHARGING
→
OPENING
→
ACTIVE
→
PLAYER ENTERS PHYSICALLY
→
HAUNTED

---

# 30. PORTAL STATES

Use:

INACTIVE
ACTIVATING
CHARGING
OPENING
ACTIVE

Optional:

COOLDOWN
DEACTIVATING

Do not add unnecessary state complexity.

---

# 31. PORTAL SAFETY

The portal must have:

- correct frame detection
- invalid-frame rejection
- activation protection
- duplicate activation protection
- per-player teleport cooldown
- safe destination
- return system
- multiplayer safety
- save/reload handling

---

# 32. RETURN LOCATION

Prefer storing the player's previous safe Overworld position.

The return location should ideally survive:

- save
- world reload
- process restart

If the target version makes persistent player storage
unreliable, use the safest supported alternative.

Document the limitation.

---

# 33. PORTAL VISUAL DESIGN

Visual concept:

An ancient damaged supernatural gate.

Frame:

- blackened stone
- cracked surfaces
- irregular construction
- faint supernatural markings

Portal interior:

- deep black
- pale spectral energy
- cold mist
- subtle movement
- restrained particles

Do NOT simply recolor a Nether portal.

---

# 34. PORTAL AUDIO

Required:

- activation
- charge
- opening
- active ambience
- teleport
- deactivation where useful

Source from legitimate SFX.

Preserve source quality.

Only technically convert for Bedrock.

---

# 35. PORTAL VALIDATION

Validate:

- block identifiers
- item identifiers
- manifest dependencies
- portal state logic
- frame validation
- activation
- teleport
- cooldown
- return
- particles
- sounds
- animations
- texture references

---

# 36. CREATURE-BY-CREATURE DEVELOPMENT

After the portal is stable:

BUILD ONE CREATURE AT A TIME.

Do NOT generate all mobs at once.

Each creature is its own production task.

Required per creature:

1. concept verification
2. technical design
3. gameplay behavior
4. model
5. texture
6. UV
7. animation
8. animation controller when needed
9. sound
10. particles when needed
11. loot
12. spawn rules
13. validation
14. test
15. documentation

Only after the creature passes should the next creature begin.

---

# 37. WATCHER

Identifier:

three_realms:haunted_watcher

Visual:

- extremely tall
- extremely thin
- narrow torso
- long arms
- long fingers
- tiny head
- hunched posture
- almost featureless face
- two tiny pale eyes

Body:

dark charcoal

Eyes:

very pale

Behavior:

- distant observation
- stalking
- slow approach
- controlled aggression

Animation:

- idle sway
- head movement
- slow walk
- attack
- hurt
- death

---

# 38. CRAWLER

Identifier:

three_realms:haunted_crawler

Visual:

- low four-limbed body
- elongated torso
- oversized hands
- thin limbs
- distorted head
- unnaturally wide mouth

Behavior:

- rapid crawling
- ambush
- lunge

Animation:

- crawl
- twitch
- lunge
- hurt
- death

---

# 39. WAILER

Identifier:

three_realms:haunted_wailer

Visual:

- floating spectral body
- torn lower body
- long arms
- hollow face
- open dark mouth
- pale spectral body

Behavior:

- floating
- ranged attack where supported
- distant cry
- retreats when damaged

Animation:

- float
- idle
- attack
- hurt
- death

---

# 40. MOURNER

Visual:

- tall spectral silhouette
- dark hair-like mass
- long dress-like form
- pale hands
- hidden face
- unnatural posture

Do NOT copy an existing famous horror character.

---

# 41. HOLLOW CHILD

Visual:

- small humanoid
- oversized head
- thin limbs
- unnatural proportions
- pale face
- dark eyes

Do NOT copy an existing horror character.

---

# 42. BLOODLESS DOCTOR

Visual:

- old medical coat
- elongated arms
- obscured face
- asymmetrical body
- damaged clothing
- medical-tool silhouette details

Primary location:

Hospital

---

# 43. PATIENT

Visual:

- hospital clothing
- bandages
- oversized hands
- distorted posture
- damaged face

Behavior:

- slow approach
- sudden burst

---

# 44. GRAVE HAND

Visual:

Huge hand emerging from ground.

Behavior:

- ambush
- attack
- retreat

Use only supported mechanics.

---

# 45. MIMIC

Concept:

An apparently harmless object/entity that becomes hostile.

Do not invent unsupported disguise mechanics.

Use the strongest verified Bedrock implementation.

---

# 46. HUSHER

Visual:

- tall hooded body
- narrow silhouette
- long sleeves
- no visible face

Behavior:

- stealth
- stalking
- close-range danger

---

# 47. RAVENING SHADE

Visual:

- floating shadow
- fragmented body
- long claws

Behavior:

- rare
- fast
- aggressive

---

# 48. POSSESSED

Visual:

- bent neck
- asymmetrical limbs
- distorted face
- unnatural posture

Behavior:

- unpredictable
- aggressive

---

# 49. GRAVEDIGGER

Visual:

- huge body
- heavy clothing
- broad shoulders
- shovel
- damaged face

Behavior:

- cemetery guardian
- slow
- powerful

---

# 50. RED VEIL

Visual:

- humanoid silhouette
- supernatural veil
- hidden face

Role:

Extremely rare encounter.

Strong audio/VFX identity.

---

# 51. PALE WARDEN

Visual:

- tall spectral guardian
- spectral armor
- cracked mask
- glowing core
- long limbs

Role:

Endgame elite.

---

# 52. BOSSES

Create three original bosses.

Do not create "normal mob + huge HP."

---

# 53. BOSS 1 — MORGUE WARDEN

Location:

Abandoned Hospital Morgue

Visual:

- extremely tall
- oversized shoulders
- very long arms
- pale gray body
- damaged medical clothing
- rib-like details
- tilted head
- asymmetrical damage
- hollow eyes
- cold glow
- long claws

Phases:

PHASE 1
- slow melee
- sweeping attack

PHASE 2
- faster
- stronger
- limited summons where supported

PHASE 3
- enraged
- strongest attack pattern
- environmental effects

Required:

- custom geometry
- texture
- UV
- animations
- sounds
- particles
- AI
- loot
- arena
- entrance
- death

---

# 54. BOSS 2 — LADY OF THE CRYPT

Location:

Deep Crypt

Visual:

- tall spectral humanoid
- floating lower body
- very long arms
- pale fingers
- featureless face
- black eyes
- dark hair-like mass
- spectral cloth

Do NOT copy an existing famous horror character.

Phases:

PHASE 1
- spectral attacks
- area control

PHASE 2
- stronger attacks
- limited summons

PHASE 3
- dangerous arena
- strongest attacks

Required:

- custom model
- texture
- UV
- animations
- sounds
- particles
- AI
- loot
- arena

---

# 55. BOSS 3 — THE NIGHTMARE

Location:

Nightmare Zone

Visual:

- extremely tall
- exaggerated limbs
- layered silhouette
- dark gray body
- glowing chest/core
- hidden face
- asymmetrical appendages
- long fingers
- unnatural posture
- spectral fragments

Phases:

PHASE 1
- stalking
- melee

PHASE 2
- supernatural attacks
- arena hazards

PHASE 3
- enraged
- strongest attacks
- limited summons

Required:

- unique 3D
- texture
- UV
- animations
- controller
- AI
- sounds
- VFX
- unique loot
- entrance
- death

---

# 56. STRUCTURES

Create approximately:

1. Haunted House
2. Abandoned Hospital
3. Cemetery Complex
4. Ruined Church
5. Cursed Mansion
6. Abandoned Laboratory
7. Crypt
8. Nightmare Mansion

Every structure must contain:

- purpose
- rooms
- enemies
- loot
- secrets
- lore
- progression value

Do not create empty decorative buildings.

---

# 57. WORLD REGIONS

Create:

1. Abandoned Outskirts
2. Dead Forest
3. Cemetery District
4. Abandoned Hospital
5. Cursed Village
6. Old Laboratory
7. Crypt Depths
8. Nightmare Zone

Each region must have actual representation.

Do not merely document the names.

---

# 58. ITEMS

Target:

approximately 15 meaningful items/materials.

Examples:

- Ectoplasm
- Soul Fragment
- Cursed Thread
- Spectral Dust
- Grave Iron
- Haunted Crystal
- Ritual Ash
- Medical Key
- Soul Shard
- Phantom Essence
- Cursed Metal
- Nightmare Fragment
- Spirit Residue
- Ancient Relic
- Boss Essence

---

# 59. WEAPONS

Target:

approximately 10.

Examples:

- Spirit Blade
- Gravekeeper Sword
- Exorcist Staff
- Cursed Axe
- Spectral Crossbow
- Soul Reaper
- Phantom Spear
- Wraith Blade
- Nightmare Weapon
- Boss Weapon

Each must have a meaningful gameplay role.

---

# 60. TOOLS

Target:

approximately 5.

Examples:

- Grave Pick
- Spirit Miner
- Ritual Tool
- Haunted Excavator
- Spectral Lantern Tool

---

# 61. ARMOR

Create:

SURVIVOR GEAR
EXORCIST GEAR
NIGHTMARE ARMOR

Each:

- helmet
- chestplate
- leggings
- boots

---

# 62. BLOCKS

Target:

approximately 25 meaningful blocks.

Categories:

- rotten wood
- plaster
- concrete
- rusted metal
- hospital tile
- grave stone
- crypt stone
- cursed stone
- ritual stone
- haunted glass
- spectral materials
- candles
- altar materials
- lab materials
- nightmare materials

Do not fill the count with trivial recolors.

---

# 63. FUNCTIONAL OBJECTS / MACHINES

Create approximately 5 useful functional objects.

Examples:

- Ritual Altar
- Spirit Extractor
- Soul Furnace
- Paranormal Analyzer
- Cursed Workshop

They must actually do something.

---

# 64. PLANTS / FOOD

Create approximately 5 useful horror-themed plants/food.

Examples:

- Dead Root
- Grave Mushroom
- Cursed Herb
- Spectral Fruit
- Nightmare Fungus

---

# 65. SPECIAL OBJECTS

Approximately 4:

- Cursed Relic
- Hospital Access Key
- Crypt Seal
- Nightmare Sigil

---

# 66. PROGRESSION

Required progression:

OVERWORLD
→
HAUNTED PORTAL
→
ENTRY AREA
→
EARLY HORROR
→
CURSED MATERIALS
→
SURVIVAL GEAR
→
DEEPER AREAS
→
ELITES
→
BOSS 1
→
ADVANCED EQUIPMENT
→
BOSS 2
→
NIGHTMARE ZONE
→
BOSS 3
→
LEGENDARY EQUIPMENT

---

# 67. HORROR EVENTS

Rare supported events may include:

- distant scream
- footsteps
- shadow encounter
- ghost appearance
- environmental changes
- hospital alarm
- cemetery event
- cursed room
- boss warning

Do not spam the player.

---

# 68. AUDIO DESIGN

Use ready-made, legally usable SFX.

Suggested categories:

WATCHER:
- breathing
- distant whisper
- subtle movement
- attack
- hurt
- death

CRAWLER:
- crawling
- claw movement
- wet movement
- lunge
- attack
- death

WAILER:
- distant wail
- crying
- spectral hum
- scream
- death

MORGUE WARDEN:
- heavy movement
- deep breathing
- hospital machinery
- roar
- attack
- phase transition
- death

LADY OF THE CRYPT:
- female whisper
- ghostly ambience
- spectral attack
- distant crying
- scream
- phase transition

THE NIGHTMARE:
- deep drone
- creature movement
- heavy impact
- distorted vocal
- phase transition
- death

PORTAL:
- activation
- charging
- opening
- ambient
- teleport

HOSPITAL:
- electrical hum
- ventilation
- distant metal
- doors
- footsteps
- machine sounds
- distant scream

CEMETERY:
- wind
- branches
- distant crow
- gravel footsteps
- gate creak
- spectral ambience

---

# 69. SOUND SOURCE POLICY

Potential legitimate sources:

- Pixabay Sound Effects
- Freesound
- OpenGameArt
- clearly licensed alternatives

Before downloading:

record source information.

DOWNLOAD TO:

/tmp/three_realms_workspace/sounds/

Do NOT download directly into the project.

After approval:

copy only selected assets into:

~/three_realms/RP/

or the actual correct Resource Pack location.

---

# 70. READY-MADE TEXTURE SEARCH

When a texture is needed:

SEARCH FIRST.

Do not immediately generate a new texture.

Potential sources:

- open-source GitHub repositories
- CC0
- CC-BY
- clearly licensed Bedrock packs
- legitimate texture libraries

All downloads first go to:

/tmp/three_realms_workspace/textures/

Inspect.

Choose.

Document.

Then copy the original approved file into the project.

---

# 71. READY-MADE MODEL SEARCH

When a model is needed:

SEARCH FIRST.

Potential sources:

- open-source Bedrock model repositories
- Blockbench-compatible public assets
- CC0/CC-BY model sources
- technically convertible legal assets

Downloads first go to:

/tmp/three_realms_workspace/models/

Then inspect.

Then approve.

Then copy.

Do not modify the model artistically unless explicitly necessary.

---

# 72. READY-MADE ASSET QUALITY RULE

Never replace a high-quality existing asset with a worse generated asset.

Compare:

- resolution
- details
- silhouette
- color
- UV
- geometry
- readability
- mobile cost

Preserve the better asset.

---

# 73. MODEL + TEXTURE MATCHING

When a ready-made model and texture are used:

check:

- UV layout
- texture resolution
- material mapping
- texture path
- geometry identifier
- animation compatibility

If texture does not fit:

FIRST try adapting the model UV/reference.

Do NOT alter the source artwork unless explicitly authorized.

---

# 74. ANIMATION POLICY

Reuse ready-made animations where they are compatible and high quality.

If a selected model already has:

- idle
- walk
- attack
- death

preserve them.

Only create missing animations.

Do not replace working animations unnecessarily.

---

# 75. IMAGE TO TEXTURE RULE

If an image source must be used:

DO NOT automatically treat it as the final Minecraft texture.

Verify:

- resolution
- transparency
- UV
- pixel readability
- Bedrock compatibility

However:

Do NOT artistically regenerate the image if the original asset
is already good.

Only do technical preparation required for integration.

---

# 76. NO PYTHON ART GENERATION

Python may be used for:

- validation
- file organization
- checksums
- file operations
- build automation

Python MUST NOT be the primary artistic generator for:

- final textures
- final concept art
- final visual artwork

Use ready-made assets first.

---

# 77. VISUAL STYLE

The Haunted Realm must remain:

- oppressive
- decayed
- supernatural
- disturbing
- mysterious
- dark

Avoid:

- generic Halloween
- cartoon horror
- excessive red
- excessive neon
- random blood
- inconsistent art styles

---

# 78. 3D STYLE

Use:

- low-poly
- Minecraft-compatible proportions
- strong silhouettes
- efficient bones
- efficient UV
- mobile-friendly geometry

Do not use unnecessary high-poly models.

---

# 79. MOBILE PERFORMANCE

Target:

Android / iOS

Audit:

- entity count
- model complexity
- texture sizes
- particle counts
- script ticks
- sound loops
- structures
- AI

Avoid:

- unbounded spawning
- world-wide every-tick scans
- excessive particles
- huge textures
- high-poly models
- inefficient scripts

---

# 80. FILE REFERENCE INTEGRITY

For every important entity verify:

Behavior Entity
→
Client Entity
→
Geometry
→
Texture
→
Animations
→
Animation Controller
→
Render Controller where required
→
Particles
→
Sounds

Every reference must point to an actual file.

---

# 81. UUID POLICY

Every new UUID must be unique.

Never reuse UUID accidentally.

Before adding a new UUID:

search the project.

After adding it:

validate duplicates.

---

# 82. NAMESPACE POLICY

Use:

three_realms:haunted_*

Examples:

three_realms:haunted_portal
three_realms:haunted_watcher
three_realms:haunted_crawler
three_realms:haunted_wailer
three_realms:haunted_morgue_warden

Do not create custom content under:

minecraft:*

---

# 83. CONTENT INDEX

Maintain:

CONTENT_INDEX.md

Each gameplay asset must include:

- identifier
- display name
- category
- purpose
- behavior path
- resource path
- texture
- model
- animation
- controller
- particles
- sounds
- source
- license
- status

Counts must reflect actual files.

---

# 84. DOCUMENTATION

Maintain:

README.md

docs/BASELINE_AUDIT.md
docs/REFERENCE_ANALYSIS.md
docs/ASSET_PROVENANCE.md
docs/TEXTURE_SOURCES.md
docs/MODEL_SOURCES.md
docs/SOUND_SOURCES.md
docs/TOOLS_USED.md
docs/BEDROCK_126_COMPATIBILITY.md
docs/TECHNICAL_LIMITATIONS.md
docs/ASSET_PIPELINE.md

World specific:

docs/HAUNTED_IMPLEMENTATION.md

Portal:

docs/HAUNTED_PORTAL_IMPLEMENTATION.md
docs/HAUNTED_PORTAL_TESTS.md

---

# 85. TESTING POLICY

After EVERY major task:

1. Validate.
2. Test.
3. Fix.
4. Validate again.
5. Update documentation.
6. Update CONTENT_INDEX.
7. Commit if appropriate.

Never accumulate many unvalidated systems.

---

# 86. TASK EXECUTION MODEL

Tasks must execute ONE AT A TIME.

Never build:

- portal
- Watcher
- Crawler
- Wailer

simultaneously.

Instead:

PORTAL
→
VALIDATE
→
TEST
→
COMMIT

then:

WATCHER
→
VALIDATE
→
TEST
→
COMMIT

then:

CRAWLER
→
VALIDATE
→
TEST
→
COMMIT

etc.

---

# 87. TASK COMPLETION REQUIREMENT

A task is NOT complete just because files were created.

The task is complete only when:

- implementation exists
- references work
- validation passes
- tests pass as far as possible
- documentation is updated
- no known critical errors remain

---

# 88. BLOCKER POLICY

When a feature is blocked:

1. Inspect the error.
2. Read official documentation.
3. Check current target-version support.
4. Search the official samples.
5. Try the simplest supported implementation.
6. If still blocked, document the exact limitation.
7. Implement the best reliable alternative.
8. Continue only when the current task is stable.

Never invent APIs.

---

# 89. INTERNET ACCESS POLICY

Use the internet for:

- official Minecraft documentation
- GitHub references
- legal asset sources
- compatibility research
- tool documentation
- library documentation

Every downloaded external file MUST first land in:

/tmp/three_realms_workspace/

Never directly download to:

~/three_realms/

---

# 90. DOWNLOAD VERIFICATION

Before promoting a downloaded file from /tmp into the permanent project:

verify:

- source
- URL
- file type
- file integrity
- license
- compatibility
- purpose

If the file is an archive:

inspect contents before copying.

---

# 91. DO NOT TRUST FILE NAMES

Never assume an asset is:

- Bedrock-compatible
- licensed
- safe
- high quality
- correct resolution

based only on its filename.

Inspect it.

---

# 92. SOURCE CHECKSUMS

For important external binary assets, consider recording:

- SHA-256
- original filename
- source URL

in:

docs/ASSET_PROVENANCE.md

This helps preserve reproducibility.

---

# 93. CLEAN TEMPORARY FILES

Temporary downloads may remain in:

/tmp/three_realms_workspace/

during active work.

At the end of a task:

clean only unnecessary temporary material.

Do NOT delete anything that may be needed for an active build.

Do NOT clean the permanent project's approved source assets.

---

# 94. NO ACCIDENTAL HOME POLLUTION

Do NOT create random files in:

~/Downloads
~/Desktop
~/

unless explicitly required.

Use:

/tmp/three_realms_workspace/

for temporary downloads and processing.

Use:

~/three_realms/

for permanent project content.

---

# 95. BUILD ARTIFACTS

Temporary build output should preferably live under:

/tmp/three_realms_workspace/build/

Final intentionally retained packages may live under:

~/three_realms/build/

or:

~/three_realms/releases/

Do not keep multiple random copies of the same package.

---

# 96. FINAL .MCADDON POLICY

The final package should contain:

- Behavior Pack
- Resource Pack
- correct manifests
- dependencies
- required assets

Validate archive integrity.

If packaging tool exists:

use it.

Do not hand-create a fake archive without testing it.

---

# 97. FINAL PACKAGE TEST

After creating:

THREE_REALMS_HAUNTED.mcaddon

inspect its archive contents.

Verify:

- BP exists
- RP exists
- manifests exist
- dependencies are valid
- important assets exist
- no placeholders remain

---

# 98. NO PLACEHOLDERS

Final production build must NOT contain:

placeholder.png
test_texture.png
dummy_entity
placeholder_model
fake_animation
TODO_ENTITY
fake_sound
unfinished_boss

Prototype placeholders must be replaced.

---

# 99. NO FAKE COMPLETION

Never claim:

"100 assets complete"

unless they actually exist.

Never claim:

"portal working"

unless it was actually tested or documented as untested.

Never claim:

"all 1.26.x compatible"

unless evidence exists.

Never claim:

"texture source verified"

unless provenance was checked.

Never claim:

"model ready"

unless it actually loads/references correctly.

---

# 100. PROGRESS FILE

Maintain:

docs/PROGRESS.md

After each task:

CURRENT TASK:
STATUS:
FILES CREATED:
FILES MODIFIED:
ASSETS ADDED:
VALIDATION:
TEST RESULTS:
KNOWN LIMITATIONS:
NEXT TASK:

This file must allow another agent/session to resume work
without repeating completed tasks.

---

# 101. RESUME POLICY

When starting a new session:

FIRST read:

AGENTS.md
docs/PROGRESS.md
CONTENT_INDEX.md
docs/TECHNICAL_LIMITATIONS.md

Then inspect current Git state.

Do NOT repeat completed work.

Do NOT regenerate approved assets.

Continue from the first incomplete task.

---

# 102. PORTAL FIRST

The first production task is always:

HAUNTED PORTAL

Do not create monsters before the portal is stable.

---

# 103. CREATURE ORDER

After portal:

1. Watcher
2. Crawler
3. Wailer
4. Mourner
5. Hollow Child
6. Bloodless Doctor
7. Patient
8. Grave Hand
9. Mimic
10. Husher
11. Ravening Shade
12. Possessed
13. Gravedigger
14. Red Veil
15. Pale Warden

Then:

16. Morgue Warden
17. Lady of the Crypt
18. The Nightmare

Do not skip ahead unless a documented dependency requires it.

---

# 104. ONE ASSET = ONE COMPLETE PIPELINE

For each creature:

RESEARCH
→
SELECT/CREATE DESIGN
→
MODEL
→
TEXTURE
→
UV
→
ANIMATION
→
BEHAVIOR
→
SOUND
→
PARTICLES
→
LOOT
→
SPAWN
→
INTEGRATE
→
VALIDATE
→
TEST
→
DOCUMENT

---

# 105. READY-MADE ASSET PREFERENCE

If a suitable ready-made asset exists:

USE IT.

Do not regenerate it.

Do not modify it artistically.

Only perform technical integration.

If no suitable asset exists:

evaluate whether a new asset must be generated.

---

# 106. SOUND LAYERING

Do not force one sound file to represent every event.

Use separate sound assets when appropriate:

- idle
- attack
- hurt
- death
- special
- ambience

Reuse a sound only when it remains appropriate.

---

# 107. ANIMATION REUSE

If a ready-made model contains high-quality animations
that already match the creature:

reuse them.

If animations are missing:

create only the missing animations.

---

# 108. PARTICLE CONTROL

Particles must be:

- restrained
- readable
- mobile-safe

Avoid full-screen spam.

---

# 109. AUDIO CONTROL

Avoid:

- constant screaming
- extremely loud ambience
- repetitive loops every few seconds

Use silence intentionally.

---

# 110. HORROR DESIGN PRINCIPLE

Fear should come from:

- anticipation
- silence
- movement
- sound
- silhouette
- uncertainty
- environment

Not just:

- red textures
- giant health bars
- particle spam
- constant jumpscares

---

# 111. STRUCTURE QUALITY

Every structure must have:

- gameplay purpose
- exploration
- danger
- reward
- lore

Do not create structure shells with no reason to enter them.

---

# 112. PROGRESSION QUALITY

Every powerful item should require meaningful progression.

Do not allow:

strongest gear
←
simple Overworld materials

---

# 113. MULTIPLAYER

Where applicable test:

- multiple players
- independent cooldowns
- independent return positions
- simultaneous entity interactions
- boss targeting
- portal usage

If real multiplayer testing is unavailable:

mark:

NOT TESTED — CLIENT RUNTIME UNAVAILABLE

Never pretend.

---

# 114. SAVE / RELOAD

Test persistence of:

- portal state
- player return data
- progression
- boss state if applicable
- world structures where applicable

---

# 115. CODE QUALITY

Prefer:

- modular code
- readable names
- reusable functions
- bounded loops
- event-driven logic
- comments on non-obvious behavior

Avoid:

- giant scripts
- duplicated logic
- magic coordinates everywhere
- uncontrolled tick loops

---

# 116. ERROR HANDLING

When a system fails:

do not silently swallow errors.

Record:

- system
- error
- probable cause
- attempted fix
- final result

---

# 117. DOCUMENTATION AFTER CHANGES

Any change to:

- entity
- portal
- dimension
- Script API
- animation
- assets
- pack dependencies

must be reflected in the appropriate documentation.

---

# 118. VISUAL CONSISTENCY

The Haunted Realm must feel like one game.

Do not allow:

- one hyper-realistic model
- one cartoon model
- one low-quality texture
- one bright neon creature

without deliberate design reason.

---

# 119. FINAL QUALITY STANDARD

The final result should resemble a professional
Minecraft Bedrock survival-horror expansion.

It should feel:

- cohesive
- polished
- original
- frightening
- playable
- mobile-friendly

---

# 120. FINAL DEFINITION OF DONE

The complete Haunted Realm is done only when:

- target 1.26.x is documented
- official documentation was used
- baseline project was audited
- external references were documented
- external assets have provenance
- portal works
- portal is physical
- portal is not time/day based
- Haunted travel works according to verified Bedrock capability
- 15 original mobs are implemented
- 3 bosses are implemented
- blocks exist
- items exist
- weapons exist
- tools exist
- armor exists
- structures exist
- regions exist
- crafting exists
- loot exists
- horror events exist
- models exist where required
- textures exist
- animations exist
- sounds exist
- particles exist
- mobile performance was reviewed
- validation was run
- tests were performed
- documentation is complete
- CONTENT_INDEX matches reality
- final .mcaddon has been inspected

---

# 121. FIRST ACTION ON ANY NEW SESSION

Do NOT immediately modify the project.

First:

1. Read AGENTS.md.
2. Read docs/PROGRESS.md if it exists.
3. Read CONTENT_INDEX.md if it exists.
4. Inspect Git status.
5. Inspect existing files.
6. Determine current task.
7. Inspect only the references/tools needed for that task.
8. Use /tmp/three_realms_workspace/ for ALL downloads.
9. Work only on the permanent project under ~/three_realms/.
10. Validate before proceeding.

---

# 122. FINAL OPERATING PRINCIPLE

The agent must behave like:

A careful Minecraft Bedrock engineer working with a real existing
project.

NOT like:

A chatbot generating random files.

The priority order is:

1. Existing project integrity
2. Bedrock compatibility
3. Correct technical implementation
4. Asset quality
5. Gameplay quality
6. Mobile performance
7. Documentation
8. Content quantity

When in doubt:

PRESERVE
→
VERIFY
→
TEST
→
THEN MODIFY

Never:

DOWNLOAD DIRECTLY INTO HOME
Never:
DESTROY THE BASELINE
Never:
INVENT BEDROCK APIS
Never:
REGENERATE GOOD EXISTING ASSETS UNNECESSARILY
Never:
CLAIM UNTESTED FEATURES WORK
Never:
MOVE ON FROM A BROKEN TASK

============================================================
END OF AGENTS.md
============================================================

