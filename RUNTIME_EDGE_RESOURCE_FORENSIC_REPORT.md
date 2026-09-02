# RUNTIME EDGE RESOURCE FORENSIC REPORT

## Scope

Target: Bedrock Mobile 1.26.0 / `@minecraft/server` 2.5.0. SCP-096, SCP-610, portal mechanics/geometry, approved assets, and custom dimensions were not modified.

## Client entity complete graph

Production indexes contain 56 client entities, 57 geometry identifiers, 174 animation identifiers, 46 animation-controller identifiers, and 12 render-controller identifiers. After resolving controller IDs by their actual controller index (rather than treating controller references as ordinary animations), all client animation references resolve: **0 missing animation/controller edges**.

The three previously failing bosses have matching aliases:

- client entity `materials.default` → supported material ID
- client entity `textures.default` → original PNG path
- client entity `geometry.default` → geometry ID
- render controller → `Geometry.default`, `Material.default`, `Texture.default`

## Render-controller semantic audit

All production render controllers were inspected. No raw filesystem texture path remains in a controller texture array. No raw material ID remains in controller material mappings. Controller alias references resolve against their client entity context for the audited boss and standard controller forms. No new render-controller defect was proven.

## Animation binding and controller states

All 45 animation JSON files parsed successfully and 174 animation IDs were indexed. All client entity animation references resolve against either animation or animation-controller IDs. Known forbidden `query.normalized_animation_progress` is absent. A complete mathematical proof of every dynamic transition truth table is not possible statically, but no missing default animation/controller edge was found.

## Geometry, bones, and locators

57 geometry identifiers were indexed and parsed. Only three locator definitions were found in production geometry (`humanbodylocator`, `monsterbodylocator`, `effect`). No `armor_offset.default_neck` exists in production geometry; SCP-610 remains evidence-only/deferred. Duplicate geometry IDs were not found.

## Particles

Three custom particle identifiers were indexed. Active client/entity particle bindings resolve to custom emitters or documented vanilla `minecraft:mobflame_emitter`. Internal vanilla event effects in `muzzleflash.json` (`minecraft:basic_smoke_particle` and `minecraft:basic_flame_particle`) are valid vanilla effects, not missing custom definitions. No dangling custom particle reference was proven.

## Sounds

Existing sound definitions and prior OGG path checks remain valid. Encounter/boss sound calls are event-driven and no new unreachable or flood-producing sound path was proven.

## Items, blocks, loot, attachables

Existing 68-test coverage and package checks remain passing. No new static mismatch was proven. Blocked armor/rifle assets remain inactive.

## Duplicates, case, dead resources

No duplicate IDs were found in scanned production resource classes. No new Linux case mismatch was proven. Dynamic variant/controller selection means a naive dead-resource scan is not authoritative; no resources were deleted.

## Validation

- Existing tests: **68 PASS / 0 FAIL**.
- Production JSON parse: **PASS**.
- No production content changes were made by this audit.
- SCP-096/SCP-610 were not modified.
- Mobile runtime: **NOT TESTED — ENVIRONMENT LIMITATION**.

## Findings

### Proven bugs

None newly proven.

### Likely/theoretical risks

- Dynamic controller/variant state reachability needs runtime testing.
- SCP-096 exact block token remains unresolved from incomplete mobile evidence.
- SCP-610 locator warning remains unproven source-side.
- Android/ADB unavailable.

CLIENT ENTITY GRAPHS: 56 indexed; 0 missing animation/controller edges after canonical resolution
ANIMATIONS: 174 indexed; forbidden query absent
ANIMATION CONTROLLERS: 46 indexed; no new proven defect
RENDER CONTROLLERS: 12 indexed; alias audit clean
GEOMETRIES: 57 indexed; no duplicate IDs; no armor locator found
PARTICLES: custom references resolve; vanilla internal effects valid
SOUNDS: existing checks pass; no new proven defect
ITEMS: existing atlas/package checks pass
BLOCKS: no new proven defect
LOOT: existing checks pass
ATTACHABLES: no new active-chain defect proven
DUPLICATES: 0 in scanned classes
CASE MISMATCHES: 0 newly proven
DEAD RESOURCES: not conclusively classifiable statically; none deleted

PROVEN BUGS: none
SAFE FIXES: none
DEFERRED: SCP-096, SCP-610, dynamic runtime reachability, mobile Content Log

Existing tests:
68 PASS / 0 FAIL

Commit:
NOT COMMITTED

Mobile:
NOT TESTED — ENVIRONMENT LIMITATION
