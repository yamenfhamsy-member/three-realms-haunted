THREE REALMS
MASTER LONG-FORM HANDOFF + GOVERNED EXECUTION PLAN
STARTING FROM TASK 10
CONTINUE TO FINAL RELEASE

====================================================================
A. PROJECT IDENTITY
====================================================================

Project:
THREE REALMS

Current Realm:
HAUNTED / NIGHTMARE REALM

Primary target:
Minecraft Bedrock Edition 1.26.x ONLY

Java Edition:
NOT SUPPORTED

Current working copy:
~/three_realms_task10/

Protected reference copy:
~/three_realms/

Temporary workspace:
~/three_realms_workspace/

IMPORTANT:
~/three_realms_task10/ is the ACTIVE WORKING COPY for all continued
development from TASK 10 onward.

~/three_realms/ is a protected historical/reference copy.

Do NOT overwrite or destroy the protected reference copy.

====================================================================
B. PROJECT DEVELOPMENT PHILOSOPHY
====================================================================

This project is NOT a one-shot generated Minecraft pack.

It is being developed like a real software/content product:

TASK
→ inspect
→ implement
→ validate
→ render/visual inspect when applicable
→ build
→ package
→ package extraction/inspection
→ regression
→ performance review
→ evidence report
→ Git checkpoint
→ gate
→ next task

Core rules:

FILE EXISTS != FEATURE COMPLETE

JSON VALID != FEATURE VALID

STATIC VALIDATION PASS != RUNTIME PASS

BUILD PASS != RUNTIME PASS

PACKAGE PASS != GAMEPLAY PASS

RENDER PASS != RUNTIME PASS

Every claim must be supported by evidence appropriate to that claim.

Use exactly these classifications where applicable:

PASS
PARTIAL
FAIL
BLOCKED
SCOPE-LIMITED
NOT TESTED
NOT TESTED — ENVIRONMENT LIMITATION

Never convert a static result into a runtime result.

====================================================================
C. ABSOLUTE ASSET POLICY
====================================================================

READY-MADE HIGH-QUALITY ASSETS ARE PREFERRED.

When an original asset already exists and is good:

PRESERVE IT.

Do NOT:

- regenerate
- repaint
- recolor
- redesign
- remake
- replace
- AI-generate a replacement
- crop unnecessarily
- resize unnecessarily
- upscale unnecessarily
- downscale unnecessarily
- pixelate
- simplify without a technical reason

Allowed:

- Bedrock format conversion
- technical UV adaptation
- technical bone/pivot adaptation
- animation/controller wiring
- render-controller wiring
- namespace changes
- UUID changes
- path corrections
- JSON compatibility
- manifest/dependency fixes
- API compatibility
- version compatibility
- technical performance fixes that do not unnecessarily damage quality

Technical integration is permitted.

Artistic redesign is NOT permitted unless explicitly requested.

====================================================================
D. RUNTIME LIMITATION
====================================================================

Historically, the development environment does NOT contain a verified
Minecraft Bedrock runtime.

There is no proven:

- Minecraft Bedrock Android client
- Minecraft Bedrock iOS client
- Bedrock desktop runtime
- BDS runtime

Therefore all runtime-dependent features must remain explicitly:

NOT TESTED — ENVIRONMENT LIMITATION

unless an actual runtime is introduced and tested.

This applies to:

- portal activation
- portal teleport
- custom dimension runtime
- mob spawning
- mob AI
- combat
- animation playback
- actual rendering in Minecraft
- actual sound playback
- particles
- structure traversal
- world generation
- multiplayer
- save/reload
- mobile FPS
- memory behavior

IMPORTANT:
MCT rendering output is visual inspection evidence.
It is NOT equivalent to Minecraft runtime evidence.

====================================================================
E. APPROVED EXTERNAL SOURCES
====================================================================

ONLY these already-approved sources exist for the project.

--------------------------------------------------
SOURCE 1 — HORROR MOBS
--------------------------------------------------

Local:

/tmp/three_realms_workspace/horror_mobs/scp-dystopia/

Repository:

https://github.com/lc-studios-mc/scp-dystopia

Previously verified:

License:
CC BY-SA 4.0

Creator:
LuckedCoronet

Repository contains:

- entities
- client entities
- geometry
- textures
- animations
- animation controllers
- render controllers
- particles
- sounds
- loot
- structures
- other Bedrock assets

Inventory found:

147 Behavior identifiers
138 Client identifiers
38 independent SCP creature candidates

Known SCP entities include:

SCP-096
SCP-106
SCP-173
SCP-280
SCP-3199
SCP-457
SCP-610
SCP-682
SCP-939
SCP-966

Known SCP identity is explicitly ACCEPTED.

Do NOT reject an asset because it is a recognizable SCP.

SCP-173 remains BLOCKED because its dependency chain requires:

lc:dt_broom

and no valid definition exists in the source.

Do NOT fabricate a replacement.

Final Task 3 usable creature count:
37 integrated

--------------------------------------------------
SOURCE 2 — BLOCKS + ITEMS
--------------------------------------------------

Local:

/tmp/three_realms_workspace/blocks_items/BOMD-Bedrock/

Repository:

https://github.com/vandaaniels/BOMD-Bedrock

Previously identified:

GPL-3.0-or-later

Target:

Bedrock 1.26.40+

Used for:

- blocks
- items
- models
- animations/controllers
- related assets/dependencies

Original visual assets were preserved.

--------------------------------------------------
SOURCE 3 — ARMOR + WEAPONS
--------------------------------------------------

Local:

/tmp/three_realms_workspace/armor_weapons/forg-cleannrooster-assets/

Repository:

https://github.com/cleannrooster/forg-cleannrooster-assets

Previously identified:

MIT

Inventory previously inspected:

543 files

Findings:

3 Spellblade armor color groups
6 armor visual layers
5 weapon-like visual assets
1 rifle icon

6 armor layers:
BLOCKED — VISUAL LAYERS ONLY

Rifle:
BLOCKED — VISUAL ICON ONLY

Integrated weapons:

three_realms:arcane_blade
three_realms:fire_blade
three_realms:frost_blade
three_realms:hexblade

==================================================
F. CANCELLED ASSET
==================================================

Skinny Monster 2 is CANCELLED.

DO NOT:

- download it
- search for it
- integrate it
- use Sketchfab for the Watcher
- replace SCP creatures with it

The project uses SCP-Dystopia as the official horror-mob source.

====================================================================
G. COMPLETE PROJECT HISTORY
TASK 1 → TASK 9
====================================================================

The following is the EXACT development history you inherit.

Do not discard it.

====================================================================
TASK 1 — PORTAL
====================================================================

Portal ID:

three_realms:haunted_portal

Portal surface:

three_realms:cursed_gate_core

Activation item:

three_realms:soul_igniter

Dimensions:

Outer frame:
5 wide
6 high

Inner opening:
3 wide
4 high

Activation:
player uses Soul Igniter near a valid complete frame.

Not dependent on:

- day/night
- sleeping
- timers
- coordinate-only unlocking
- random automatic activation

State sequence:

INACTIVE
→ ACTIVATING
→ CHARGING
→ OPENING
→ ACTIVE

ACTIVE portal opening:

3 x 4

Filled with:

three_realms:cursed_gate_core

Gate core:
non-colliding

Teleport:
requires actual physical player entry into the portal opening.

Cooldown:
per-player cooldown prevents duplicate teleport.

Static result:
PASS

Package:
PASS

Archive integrity:
PASS

Runtime:
NOT TESTED — ENVIRONMENT LIMITATION

IMPORTANT:
Portal is the baseline and must remain protected.

====================================================================
TASK 2 — PORTAL QUALITY / TOOLING BASELINE
====================================================================

Verified historically:

JavaScript syntax:
PASS

JSON:
PASS

MCT isolated/platform validation:
PASS where applicable

MCT packaging:
PASS

Archive extraction:
PASS

Historical issue:

mct exportaddon
+
main.ts
+
esbuild-wasm
+
Node.js 24

caused:

RangeError: Invalid array length

Do NOT assume this is fixed unless actually re-tested.

Historical mitigation:
controlled staging/package process was used without redesigning working
production code.

Custom Dimension research:
documented against official Bedrock documentation.

Custom Dimension runtime:
NOT TESTED

====================================================================
TASK 3 — SCP HORROR MOBS
====================================================================

Source:

/tmp/three_realms_workspace/horror_mobs/scp-dystopia/

Inventory:

147 BP identifiers
138 RP/client identifiers
38 independent SCP creature candidates

Integrated:

37 usable creatures

Blocked:

SCP-173

Blocker:

lc:dt_broom missing

Important:
Do NOT fabricate the dependency.

Shared audio file:

RP/sounds/sound_definitions.json

was modified additively where creature sound definitions were required.

Portal audio entries were preserved exactly.

Task 3:
PASS / validated static production state

Runtime:
NOT TESTED — ENVIRONMENT LIMITATION

====================================================================
TASK 4 — BLOCKS + ITEMS
====================================================================

Source:

BOMD-Bedrock

Task 4:
COMPLETED / VALIDATED

Integrated usable BOMD blocks and items.

Original visual content preserved.

No artistic redesign.

Only technical compatibility/integration.

Runtime:
NOT TESTED

====================================================================
TASK 5 — ARMOR + WEAPONS
====================================================================

Audited 543 source files.

Armor:

6 visual layers:
BLOCKED — VISUAL LAYERS ONLY

Rifle:

BLOCKED — VISUAL ICON ONLY

Four blade weapons converted and integrated:

three_realms:arcane_blade
three_realms:fire_blade
three_realms:frost_blade
three_realms:hexblade

Production additions:

4 BP item definitions
4 original PNG assets

Modified:

RP/textures/item_texture.json

Only namespace/reference changes.

MCT:

main PASS
currentplatform PASS
all PASS

Build:
PASS

Package:
PASS

Package entries:
494

SCP regression:
PASS

Portal regression:
PASS

Task 5:
PASS

Runtime:
NOT TESTED — ENVIRONMENT LIMITATION

====================================================================
TASK 6 — STRUCTURES
====================================================================

Total:

8 structures

1. Haunted House
2. Cemetery Complex
3. Ruined Church
4. Cursed Mansion
5. Abandoned Laboratory
6. Abandoned Hospital
7. Crypt
8. Nightmare Mansion

Abandoned Hospital was built first as the reference.

Implementation:

deterministic Bedrock functions

because no proven automatic .mcstructure/worldgen pipeline existed in
the environment.

DO NOT claim procedural world generation.

Task 6:
PASS

Task 6 Part 2 commit:
e1c8e9fca0e0605af856617b34a9b9e7b6138720

MCT:
main PASS
currentplatform PASS
all PASS

Build:
PASS

Package:
PASS

Runtime:
NOT TESTED

====================================================================
TASK 7 — REGION FOUNDATION
====================================================================

Eight regions:

1. Abandoned Outskirts
2. Dead Forest
3. Cemetery District
4. Abandoned Hospital
5. Cursed Village
6. Old Laboratory
7. Crypt Depths
8. Nightmare Zone

Function:

BP/functions/world/haunted_realm_foundation_build.mcfunction

Implemented:

- deterministic connected path
- transition markers
- region identities
- ruins
- roads
- restricted areas
- structure relationships

Task 7:
PASS — STATIC FOUNDATION

MCT:
main PASS
currentplatform PASS
all PASS

Build:
PASS

Package:
PASS

Package entries:
506

Runtime:
NOT TESTED

====================================================================
TASK 8 — MOB ENCOUNTERS
====================================================================

Actual entity inventory:

55 entity definitions

Encounter system:

8 functions

Mechanism:

- Bedrock .mcfunction
- execute unless entity
- 24-block radius
- one entity maximum per encounter
- no global tick loop
- no global scan

Distribution:

Abandoned Outskirts
→ haunted_watcher

Dead Forest
→ scp939

Cemetery District
→ scp106

Abandoned Hospital
→ scp939

Cursed Village
→ scp966

Old Laboratory
→ scp035_scientist

Crypt Depths
→ scp439

Nightmare Zone
→ scp096

Task 8:
PASS — STATIC ENCOUNTER FOUNDATION

MCT:
main PASS
currentplatform PASS
all PASS

Build:
PASS

Package:
PASS

Package entries:
515

Runtime spawning:
NOT TESTED

====================================================================
TASK 9 — AUDIO
====================================================================

Audio inventory:

8 OGG files
4 sound definitions
0 duplicate matching sounds
0 missing paths

New audio assets:
0

Encounter cues:
5 guarded cues

Existing sound:

three_realms.scpdt.door1.close

No loops.

No tick loops.

No global scans.

Intentionally sparse/silent:

Dead Forest
Crypt Depths
Nightmare Zone

Portal audio:
preserved

Task 9:
PASS — STATIC AUDIO FOUNDATION

MCT:
main PASS
currentplatform PASS
all PASS

Build:
PASS

Package:
PASS

Package entries:
515

Package size:
12,638,969 bytes

Audio size:
148,173 bytes

Runtime:
NOT TESTED

====================================================================
H. MANDATORY PRE-TASK MASSIVE REGRESSION
====================================================================

Before every new task, especially TASK 10 onward:

Perform a HUGE REGRESSION of every previous completed task.

For TASK 10:
verify TASK 1 → TASK 9.

For TASK 11:
verify TASK 1 → TASK 10.

For TASK 12:
verify TASK 1 → TASK 11.

And so on.

This must be an actual inspection of current files.

Do NOT merely cite old reports.

Examples:

Portal regression:
verify actual IDs, files, references, logic.

Mob regression:
verify actual entity/client/geometry/texture/animation/controller chains.

Weapon regression:
verify actual BP/RP item references.

Structure regression:
verify actual structure functions.

Audio regression:
verify actual sound definitions and references.

====================================================
I. MCT REQUIREMENT
====================================================

Before using MCT for any task:

1. Inspect the actual installed MCT binary/package/version.
2. Determine the real commands/subcommands/options available.
3. Do NOT assume a command exists.
4. Do NOT invent syntax.
5. Record the supported capability set.

Create/update:

~/three_realms_workspace/MCT_CAPABILITIES_CURRENT.md

Document:

- installed version
- executable path
- validation commands
- build/export capabilities
- model rendering capability
- vanilla rendering capability
- structure rendering capability
- structure build/preview capability
- batch rendering capability
- world/deployment capability
- test/deploy capability
- MCP capability if available
- supported flags
- limitations

If a capability is unavailable:
record it as unavailable.

====================================================
J. MCT VALIDATION POLICY
====================================================

Where supported by the installed version, validate using relevant
scopes such as:

main
currentplatform
addon
all
default

and any additional genuinely supported scope.

Do NOT run blindly against directories containing:

- backups
- archived .mcaddon
- archived packs
- temporary staging
- historical copies

Prefer isolated production scope.

If root/all validation recursively encounters known backups:

classify as:

SCOPE-LIMITED

Do NOT delete backups merely to force a green result.

====================================================
K. RENDER / BATCH RENDER REQUIREMENT
====================================================

Rendering is mandatory for visual assets whenever the installed MCT
supports it.

Use the real installed commands.

Examples, depending on actual installed syntax:

CUSTOM MODEL:
model/entity rendering

VANILLA REFERENCE:
vanilla rendering

STRUCTURE:
structure preview/build/render

Do NOT blindly use these labels as commands.
First inspect the installed CLI and use its actual syntax.

For batches:

Use batch rendering whenever supported by the installed version.

Possible patterns include:

identifier1,identifier2,identifier3

or:

@identifier-file.txt

ONLY if the installed MCT actually supports them.

Render outputs:

~/three_realms_workspace/render_reports/

Never put temporary render outputs inside production.

Examples of useful batch render groups:

batch 1:
all current horror mobs

batch 2:
all four weapons

batch 3:
new boss models

batch 4:
important blocks

batch 5:
structures

Render evidence must be recorded.

A render result means:

STATIC VISUAL INSPECTION PASS

not:

IN-GAME RUNTIME PASS

====================================================
L. GIT POLICY
====================================================

Before every task:

git status
git branch --show-current
git log -1 --oneline
git remote -v

Before every commit:

git status
git diff --stat
git diff --name-only

Check for:

- secrets
- credentials
- tokens
- passwords
- downloaded archives
- staging files
- workspace files
- unrelated modifications

NEVER commit secrets.

Do not push automatically unless explicitly authorized.

====================================================
M. TASK 10 — MORGUE WARDEN
====================================================

Create:

three_realms:morgue_warden

Name:

The Morgue Warden

Location:

Abandoned Hospital Morgue

This is the first production boss benchmark.

--------------------------------------------------
VISUAL
--------------------------------------------------

Required:

- extremely tall humanoid
- oversized shoulders
- very long arms
- pale gray body
- damaged medical clothing
- rib-like anatomical details
- tilted head
- asymmetrical damage
- hollow eye sockets
- subtle cold glow
- long claws
- intimidating silhouette

Avoid:

- generic zombie
- cute horror
- cartoon styling
- excessive neon
- excessive red
- random blood spam

--------------------------------------------------
ASSET PROCESS
--------------------------------------------------

First:

search existing approved sources.

Only if no suitable asset exists:
search for a ready-made high-quality medical/horror humanoid asset.

External source:

download only into:

~/three_realms_workspace/

Before integration:

record:

source URL
creator
license
attribution
filename
format
texture
resolution
UV
bones
animations
provenance

Use:

~/three_realms_workspace/staging/morgue_warden/

for conversion.

--------------------------------------------------
MODEL
--------------------------------------------------

Convert technically to Bedrock.

Create/verify:

geometry
texture references
client entity
render controller
animations
animation controller

Preserve silhouette and original asset quality.

--------------------------------------------------
ANIMATIONS
--------------------------------------------------

Required:

idle
breathing/sway
head movement
slow walk
attack
hurt
death

Optional:

stalking
enraged
phase transition

--------------------------------------------------
ENTITY
--------------------------------------------------

Implement:

three_realms:morgue_warden

Verify:

health
collision
scale
movement
navigation
attack
targeting
damage
knockback
animation controllers
render controller
sound
loot
death behavior

--------------------------------------------------
SCALE
--------------------------------------------------

Boss must be larger than ordinary mobs.

But not so large that:

- corridors fail
- doors become unusable
- collision breaks
- pathfinding fails

Document scale.

--------------------------------------------------
PHASES
--------------------------------------------------

PHASE 1:
slow melee

PHASE 2:
escalation

PHASE 3:
enraged

Use real Bedrock-supported components/events/script mechanisms.

Do not invent unsupported AI.

--------------------------------------------------
ARENA
--------------------------------------------------

Use existing Abandoned Hospital Morgue.

Do NOT rebuild hospital.

Modify only what is necessary.

--------------------------------------------------
SPAWN
--------------------------------------------------

Controlled deterministic encounter.

Preferred:

player reaches/activates morgue encounter
→ boss spawns once
→ encounter active
→ duplicate spawn prevented

No:

- global boss spawn
- global tick scan
- unlimited loop

--------------------------------------------------
DEATH
--------------------------------------------------

Implement where technically supported:

death animation
death sound
controlled loot
completion state

No automatic infinite respawn.

--------------------------------------------------
AUDIO
--------------------------------------------------

Prefer existing sounds.

Concept:

idle:
subtle presence

combat:
heavy impact

hurt:
short reaction

phase transition:
brief escalation

death:
long breath/silence

Protect portal sounds.

Sound definition changes must be additive.

--------------------------------------------------
PARTICLES
--------------------------------------------------

Use existing validated particles where useful.

Avoid particle spam.

--------------------------------------------------
TASK 10 TESTS
--------------------------------------------------

Mandatory:

1. massive Task 1→9 regression
2. MCT capability verification
3. asset audit
4. model render
5. animation/static render where possible
6. dependency validation
7. BP/RP validation
8. build
9. package
10. package extraction
11. package inspection
12. Task 1→10 huge regression
13. mobile performance review
14. Git diff review
15. report

Reports:

~/three_realms_workspace/TASK10_PRE_AUDIT.md
~/three_realms_workspace/TASK10_ASSET_AUDIT.md
~/three_realms_workspace/TASK10_BOSS_DEPENDENCY_MANIFEST.md
~/three_realms_workspace/TASK10_REGRESSION.md
~/three_realms_workspace/TASK10_MORGUE_WARDEN_REPORT.md

STOP if blocked.

Do NOT start Task 11 in the same execution.

====================================================
N. TASK 11 — LADY OF THE CRYPT
====================================================

Only after Task 10 PASS.

ID:

three_realms:lady_of_the_crypt

Location:

Crypt Depths / Crypt

Visual:

- tall spectral humanoid
- floating lower body
- extremely long arms
- pale fingers
- featureless pale face
- black eyes
- dark hair-like mass
- spectral cloth/ribbons

Implement:

- model
- texture
- geometry
- client entity
- render controller
- animations
- AI
- encounter
- audio
- particles
- loot

Use exact same:

asset audit
→ render
→ staging
→ validation
→ build
→ package
→ inspection
→ Task 1→11 regression

Do not rebuild Crypt.

Do not implement other bosses.

====================================================
O. TASK 12 — THE NIGHTMARE
====================================================

Only after Task 11 PASS.

ID:

three_realms:the_nightmare

Location:

Nightmare Zone / Nightmare Mansion

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

This must be the strongest boss visually.

Implement:

- model
- geometry
- texture
- client entity
- render controller
- animations
- AI
- multiple phases
- audio
- particles
- loot
- controlled encounter

Use full render/validation workflow.

Run huge regression Task 1→12.

====================================================
P. TASK 13 — LORE + ENVIRONMENTAL STORYTELLING
====================================================

Only after Task 12 PASS.

Implement lightweight lore:

- diaries
- notes
- patient records
- laboratory notes
- ritual documents
- gravestones
- hidden rooms
- environmental clues

Core narrative:

Something happened.

Someone opened something that should never have been opened.

The ghosts are symptoms of a deeper supernatural problem.

Haunted should contain clues connecting the future THREE REALMS worlds.

Do not over-engineer a lore engine.

Use lightweight Bedrock-compatible content.

Test:

- references
- placement
- text content
- package inclusion
- regression

Render structures/important visual scenes where supported.

Huge regression Task 1→13.

====================================================
Q. TASK 14 — PROGRESSION + LOOT
====================================================

Only after Task 13 PASS.

Implement:

- progression
- common loot
- uncommon loot
- rare loot
- relics
- legendary items
- boss rewards

Avoid power creep.

Use existing validated content first.

Any new item must be a real Bedrock implementation.

Test:

- loot definitions
- references
- progression paths
- item IDs
- package inclusion
- regression

Render item assets where relevant.

Huge regression Task 1→14.

====================================================
R. TASK 15 — WORLD / REGION INTEGRATION
====================================================

Only after Task 14 PASS.

Improve:

- region connectivity
- structure relationships
- encounter placement
- boss location relationships
- progression flow
- lore flow

Use real supported Bedrock/MCT structure/world capabilities.

Do NOT claim automatic procedural worldgen unless runtime proves it.

Use:

- structure build/preview
- renderstructure
- other actual MCT world tools

where available.

Render each region/structure where possible.

Use batch render where supported.

Huge regression Task 1→15.

====================================================
S. TASK 16 — SPECIAL OBJECTS + FUNCTIONAL HORROR SYSTEMS
====================================================

Only after Task 15 PASS.

Implement remaining functional Haunted Realm objects/systems.

Examples:

- cursed interactive objects
- ritual mechanisms
- special environmental devices
- functional horror interactions
- progression-gated objects

Do not invent unsupported APIs.

Prefer simple, reliable Bedrock mechanics.

Test:

- behavior
- references
- functions
- entities
- blocks/items
- scripts
- performance

Huge regression Task 1→16.

====================================================
T. TASK 17 — GLOBAL INTEGRATION + MOBILE PERFORMANCE
====================================================

Only after Task 16 PASS.

Full-project review.

Analyze:

ENTITIES
- count
- complexity
- tick behavior
- spawn pressure
- AI

MODELS
- geometry complexity
- material count
- texture count

TEXTURES
- resolution
- package size
- duplicates

SCRIPTS/FUNCTIONS
- loops
- scans
- command frequency
- unnecessary repetition

AUDIO
- frequency
- package size
- duplicate assets

PARTICLES
- frequency
- spam risks

WORLD
- structure size
- density
- command cost

BOSSES
- AI
- pathfinding
- phase transitions

Do NOT reduce visual quality as the default optimization.

Huge regression Task 1→17.

====================================================
U. TASK 18 — FINAL MCT VALIDATION + MASS RENDER
====================================================

Only after Task 17 PASS.

Run every actually supported MCT validation capability.

Possible scopes:

main
currentplatform
addon
all
default

Use only what the installed MCT really provides.

Run the broadest meaningful static validation.

Then mass-render:

- horror mobs
- all bosses
- weapons
- blocks
- important items
- structures
- region references

Use batch rendering wherever supported.

Examples:

mob identifier list
weapon identifier list
structure list

Create:

~/three_realms_workspace/render_reports/final/

Record:

- render command
- input list
- output list
- failures
- skipped assets
- visual findings

Do not call this runtime testing.

Huge regression Task 1→18.

====================================================
V. TASK 19 — FINAL PACKAGE QA
====================================================

Only after Task 18 PASS.

Build final production package.

Extract it.

Audit every package entry.

Verify:

- BP manifest
- RP manifest
- scripts
- entities
- client entities
- geometry
- textures
- animations
- animation controllers
- render controllers
- sounds
- sound definitions
- particles
- loot
- spawn
- functions
- blocks
- items
- weapons
- bosses
- structures
- lore
- special systems

Verify absence of:

- staging
- temporary workspace
- downloaded archives
- credentials
- secrets
- duplicate manifests
- broken references

Produce:

~/three_realms_workspace/TASK19_FINAL_PACKAGE_AUDIT.md

Huge regression Task 1→19.

====================================================
W. TASK 20 — REAL RUNTIME + MOBILE QA
====================================================

Only when an ACTUAL Minecraft Bedrock runtime is available.

First verify the runtime.

If runtime is still unavailable:

mark:

TASK 20:
NOT TESTED — ENVIRONMENT LIMITATION

and do not fake runtime evidence.

When available:

PORTAL TEST:

- activation
- charging
- opening
- active state
- physical entry
- teleport
- cooldown
- reload/rejoin

MOBS:

- spawn
- render
- AI
- targeting
- combat
- death
- loot

STRUCTURES:

- actual placement
- traversal
- collision
- encounters

AUDIO:

- playback
- encounter cues
- silence/ambience

BOSSES:

- spawn
- combat
- phase 1
- phase 2
- phase 3
- navigation
- death
- loot

MOBILE:

- FPS
- memory
- stability
- rendering
- audio
- command behavior

Only runtime evidence may upgrade:

NOT TESTED

to:

PASS

====================================================
X. MASSIVE END-TO-END TEST MODEL
====================================================

The following testing model is mandatory.

At the start of each Task:

RUN:
HISTORICAL REGRESSION

Example for Task 10:

TASK 1
Portal

TASK 3
SCP mobs

TASK 4
Blocks/items

TASK 5
Weapons

TASK 6
Structures

TASK 7
Regions

TASK 8
Encounters

TASK 9
Audio

Then:
TASK 10 implementation.

After implementation:

RUN:
CURRENT-TASK VALIDATION

Then:

RUN:
FULL REGRESSION TASK 1→10

Repeat for every later task.

This means Task 17 does NOT only test Task 17.
It tests:

Task 1
Task 3
Task 4
Task 5
Task 6
Task 7
Task 8
Task 9
Task 10
Task 11
Task 12
Task 13
Task 14
Task 15
Task 16
Task 17

====================================================
Y. EXAMPLE REGRESSION TESTS
====================================================

These are examples of the kind of evidence expected.

--------------------------------------------------
PORTAL
--------------------------------------------------

Verify:

three_realms:haunted_portal
three_realms:cursed_gate_core
three_realms:soul_igniter

Confirm:

- files exist
- references resolve
- portal sounds remain
- scripts remain
- namespace remains
- no unrelated overwrites

--------------------------------------------------
MOB
--------------------------------------------------

For example SCP-939:

verify:

BP entity
+
client entity
+
geometry
+
texture
+
animation
+
controller
+
render controller
+
sound
+
loot
+
spawn/dependencies

--------------------------------------------------
WEAPON
--------------------------------------------------

For example:

three_realms:fire_blade

verify:

BP item definition
+
texture
+
mapping
+
namespace
+
package inclusion

--------------------------------------------------
STRUCTURE
--------------------------------------------------

For example:

Abandoned Hospital

verify:

function
+
block IDs
+
entity IDs
+
loot
+
required dependencies

--------------------------------------------------
ENCOUNTER
--------------------------------------------------

For example Dead Forest:

verify:

- correct function
- correct mob
- unless-entity
- 24 block radius
- one entity maximum
- no global scan
- no global tick loop

--------------------------------------------------
AUDIO
--------------------------------------------------

Verify:

- sound_definitions.json
- portal entries
- encounter entries
- actual OGG paths

--------------------------------------------------
BOSS
--------------------------------------------------

For Morgue Warden:

verify:

BP
+
client
+
geometry
+
texture
+
animations
+
controllers
+
AI
+
loot
+
sounds
+
spawn encounter

====================================================
Z. PERFORMANCE EXAMPLES
====================================================

Preferred:

event-driven logic

guarded encounter functions

limited scans

existing assets

controlled encounters

Avoid:

global tick scans

unlimited loops

repeated command spam

constant particles

constant sounds

large-scale unnecessary entity spawning

====================================================
AA. FAILURE HANDLING
====================================================

When something fails:

DO NOT immediately rewrite the project.

First classify:

1. Real production bug
2. Missing dependency
3. Validator scope problem
4. Environment limitation
5. Tooling problem
6. Test fixture issue
7. Packaging problem
8. Unsupported Bedrock feature

Then fix only the relevant layer.

Example:

If:

mct validate all

fails because backup archives are recursively scanned:

Do NOT delete backups.

Classify:

SCOPE-LIMITED

Then use isolated production validation if supported.

Example:

If render command does not exist in installed MCT:

Do NOT invent a replacement command.

Record:

RENDER CAPABILITY UNAVAILABLE

and use another supported inspection method.

====================================================
AB. DOCUMENTATION FILES
====================================================

Maintain:

~/three_realms_workspace/

with:

MCT_CAPABILITIES_CURRENT.md

TASK10_PRE_AUDIT.md
TASK10_BASELINE_REGRESSION.md
TASK10_ASSET_AUDIT.md
TASK10_BOSS_DEPENDENCY_MANIFEST.md
TASK10_REGRESSION.md
TASK10_MORGUE_WARDEN_REPORT.md

and analogous reports for future tasks.

At final:

FINAL_THREE_REALMS_QA_REPORT.md

====================================================
AC. GIT CHECKPOINT POLICY
====================================================

Each successful task:

- verify diff
- commit only intended production changes
- verify commit
- verify working tree
- do not include temporary files
- do not include secrets

Push ONLY if explicitly authorized.

====================================================
AD. FINAL PRODUCT PRINCIPLES
====================================================

The final Haunted Realm should feel:

- oppressive
- lonely
- decayed
- supernatural
- mysterious
- dangerous
- unpredictable

Fear should rely on:

- silence
- anticipation
- sound
- silhouette
- movement
- uncertainty
- environment
- rare encounters

Avoid:

- cute Halloween
- cartoon horror
- excessive red
- excessive neon
- constant jumpscares
- random blood spam
- constant loud audio

====================================================
AE. FINAL STOP RULE
====================================================

Never skip a failed gate.

Never silently downgrade:

BLOCKED
to
PASS

Never silently convert:

NOT TESTED
to
PASS

Never claim:

BUILD PASS
=
RUNTIME PASS

Never claim:

PACKAGE PASS
=
GAMEPLAY PASS

Never claim:

RENDER PASS
=
RUNTIME PASS

Only evidence can upgrade a status.

====================================================
AF. START NOW
====================================================

START WITH TASK 10.

FIRST:

1. Audit ~/three_realms_task10/
2. Verify Git state.
3. Read all existing task reports.
4. Run MASSIVE REGRESSION TASK 1→9.
5. Discover the ACTUAL installed Minecraft Creator Tools version.
6. Discover all ACTUAL supported MCT commands/options.
7. Discover actual render capabilities.
8. Verify whether batch rendering is supported.
9. Write MCT_CAPABILITIES_CURRENT.md.
10. Write TASK10_BASELINE_REGRESSION.md.
11. Only then begin Morgue Warden asset search/audit.

DO NOT begin Task 11.

DO NOT push.

DO NOT modify the protected ~/three_realms/ reference copy.

STOP at the TASK 10 final gate.

Final Task 10 output must clearly state:

TASK 10:
PASS / PARTIAL / BLOCKED

MCT:
PASS / PARTIAL / SCOPE-LIMITED / UNAVAILABLE

Render:
PASS / PARTIAL / UNAVAILABLE

Build:
PASS / FAIL

Package:
PASS / FAIL

Regression:
PASS / FAIL

Runtime:
NOT TESTED — ENVIRONMENT LIMITATION

Git:
commit SHA if authorized

List every blocker and every unverified claim.

====================================================
END OF MASTER EXECUTION INSTRUCTIONS
====================================================
