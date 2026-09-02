# PERFORMANCE + LOGIC FORENSIC REPORT

## Scope

Target: Bedrock Mobile 1.26.0 / `@minecraft/server` 2.5.0. SCP-096, SCP-610, portal geometry, approved assets, boss visuals, and custom-dimension fallback were not modified.

## Watchdog analysis

The reported 200ms spike was not reproducible in this static environment. No random optimization was applied. The main synchronous script work is bounded portal bookkeeping and a 10-tick interval. Encounter/structure functions are manual command functions and are not globally scheduled by the script.

## Timer audit

| File | Call | Type | Lifecycle | Risk |
|---|---|---|---|---|
| `BP/scripts/main.js` | three `system.runTimeout` calls in `activatePortal` | one-shot | each activation creates three; no explicit cancellation, but callbacks verify state/frame | BOUNDED; repeated activation blocked while state is active |
| `BP/scripts/main.js` | `system.runInterval(..., 10)` | repeating | module-global; one intended subscription | BOUNDED workload; runs for module lifetime |
| `BP/scripts/main.js` | no `system.run` calls | none | n/a | none |

The timeout callbacks capture a player reference for notification. They do not access player state except through `notify`, which catches failures. Portal/dimension operations are inside the interval try/catch. No per-player or per-entity interval creation was found.

## Entity scans

Only `dimension.getPlayers({ location: center, maxDistance: 2.3 })` is used. It occurs in the portal interval every 10 ticks and is spatially bounded. No `getEntities` or global entity scans occur in JavaScript. Encounter functions use bounded radius selectors (`r=24`, `r=32`) and are manually invoked.

## Command audit

No JavaScript `runCommand` calls exist. Functions contain deterministic structure commands, summons, scoreboard operations, audio, and guarded encounter calls. Function graph analysis found 22 functions, no missing function edges, and no call cycles after stripping comments. Structure builders are not recursive.

## Encounter idempotency

Regular encounter functions guard by local radius before summoning. Boss encounter functions guard by local radius and kill scoreboard. This prevents duplicate summons when repeatedly invoked at the same anchor while the entity exists or is marked killed. A player leaving/re-entering can invoke a regular encounter after the mob leaves the radius; this is intended bounded re-encounter behavior, not a proven unbounded loop. Multi-player and reload behavior require runtime testing.

## Boss duplication

Bosses have radius and scoreboard guards in dedicated functions. No global boss scheduler or recursive summon path was found. Exact cross-player scoreboard semantics require runtime testing because the functions use the executing/nearest player selector.

## Portal load

One global interval runs every 10 ticks. Work scales with tracked portal records and nearby players, not all world entities. Portal records are inserted on activation and removed only when an interval exception occurs; ordinary inactive records remain in the map. This is a theoretical retention risk if many distinct portals are activated over a long-lived world, but no practical unbounded creation path was proven by the current activation search/radius logic.

## Scoreboards

Three objectives are created by `BP/functions/load_scoreboards.mcfunction`, invoked via `BP/functions/load.json`. No scoreboard writes occur every tick in the script. Boss functions read kill objectives and do not themselves initialize them. Fresh-world and missing-objective recovery require runtime testing.

## Particle and sound audit

Portal particles are emitted every 10 ticks for tracked non-inactive portals. Portal activation/teleport sounds are event-driven. Encounter sounds are one command before guarded summons and not looped. No genuine sound flood was proven.

## Entity lifecycle and memory

Encounter summons have normal entity death/removal paths. Bosses have no automatic respawn loop. `portals` and `cooldowns` are module maps. Cooldowns are removed on teleport failure but have no periodic expiry cleanup; this is bounded by players who have used a portal during the current script lifetime and is a low theoretical retention risk. World reload resets module memory.

## Event subscriptions

Exactly two global event subscriptions exist: `worldLoad` and `itemStartUseOn`. They are module-top-level and are not inside initialization functions, so duplicate registration was not found in the production entrypoint.

## Component/event reachability

A static scan found several unreferenced component groups in upstream-integrated entities. These are not automatically bugs because variant/event systems and inherited upstream behavior may activate them through paths not represented by a simple add/remove scan. No change was made without runtime proof. SCP-096 angry groups were not altered.

## Portal state machine

Normal path: `INACTIVE → ACTIVATING → CHARGING → OPENING → ACTIVE`. Invalid frame checks return to `INACTIVE`; active timeout returns ordinary portals to inactive. A second activation while active/charging is rejected. Intermediate states do not teleport. Runtime validation for two-player races, reloads, and death during teleport remains pending.

## Teleport safety

Destinations check feet/head air and a non-air block below. The target dimension lookup and teleport call are caught. Actual custom-dimension availability is intentionally unavailable on 1.26.0, so gameplay remains runtime-dependent and no runtime success is claimed.

## Static stress model

| Players | Relative workload | Basis |
|---:|---|---|
| 1 | LOW | one bounded nearby-player query per interval |
| 5 | LOW | same bounded query, more nearby candidates only |
| 10 | LOW/MEDIUM | bounded portal query and manual commands |
| 20 | MEDIUM | player iteration remains local to tracked portal centers |

No CRITICAL static workload path was identified. This is not an FPS or memory benchmark.

## Findings

### Proven bugs

None newly proven in this pass. Existing source changes from the prior repair remain uncommitted.

### Likely risks

- P2 likely risk: cooldown map has no expiry cleanup; bounded by portal users and reset on reload.
- P2 likely risk: portal map retains inactive records; no unbounded automatic creation path was proven.
- P2 likely risk: timeout callbacks are not cancellable, though state/frame checks make stale transitions no-ops.
- P2 likely risk: scalar `attack_interval` values in six upstream-integrated entities require targeted schema/runtime confirmation; outside this task's protected blocker scope.

### Theoretical risks / not bugs

- P3: repeated manual structure-function execution can rebuild/overwrite structures by design.
- P3: regular encounter can re-summon after a mob leaves its radius by design.
- INFO: 200ms watchdog spike not reproduced.
- INFO: unreferenced component groups require runtime/event coverage before classification.

## Validation

- Existing tests: **68 PASS / 0 FAIL**.
- Production JSON: **PASS**.
- No production asset changes.
- No SCP-096/SCP-610 changes.
- No commit.
- Mobile runtime: **NOT TESTED — ENVIRONMENT LIMITATION**.

PROVEN BUGS: none
LIKELY RISKS: cooldown/map retention, uncancellable but guarded portal timeouts, unverified upstream scalar attack intervals
THEORETICAL RISKS: watchdog cause, repeated manual structure invocation, event reachability findings without runtime evidence
SAFE FIXES: none applied; no proven performance/logic defect met the requested threshold
DEFERRED: SCP-096, SCP-610, runtime watchdog reproduction, mobile stress, fresh-world/reload/multiplayer behavior
68 TESTS: 68 PASS / 0 FAIL
COMMIT: NOT COMMITTED
MOBILE STATUS: NOT TESTED — ENVIRONMENT LIMITATION
