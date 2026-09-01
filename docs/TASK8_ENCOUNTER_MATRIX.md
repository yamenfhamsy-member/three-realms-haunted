# TASK 8 — REGION ENCOUNTER MATRIX

The matrix uses existing SCP-Dystopia entities only. The implementation is deterministic/manual because automatic biome spawning and Minecraft runtime are unavailable. Each function performs one local radius check and summons at an offset from the execution anchor; it does not run every tick.

| Region | Threat identity | Existing mob | Relative point | Limit |
|---|---|---|---:|---|
| Abandoned Outskirts | low/medium threat; distant approach | `three_realms:haunted_watcher` | `(10, 1, 0)` | max 1 within radius 24 |
| Dead Forest | stalker/crawler uncertainty; sparse | `three_realms:scp939` | `(11, 1, 4)` | max 1 within radius 24 |
| Cemetery District | spectral/horror near graves | `three_realms:scp106` | `(10, 1, -4)` | max 1 within radius 24 |
| Abandoned Hospital | corridor-compatible sparse encounter | `three_realms:scp939` | `(12, 2, -8)` | max 1 within radius 24 |
| Cursed Village | roaming/ambush potential; empty space preserved | `three_realms:scp966` | `(10, 1, 6)` | max 1 within radius 24 |
| Old Laboratory | experimental/unnatural higher threat | `three_realms:scp035_scientist` | `(12, 2, 4)` | max 1 within radius 24 |
| Crypt Depths | deeper horror; one rare controlled encounter | `three_realms:scp439` | `(12, 1, 7)` | max 1 within radius 24 |
| Nightmare Zone | highest-threat existing pool; rare and distant | `three_realms:scp096` | `(14, 2, 8)` | max 1 within radius 24 |

## Mechanism decision

No new spawn-rule JSON, biome rule, component group, AI change, or script tick loop is introduced. The verified mechanism is an explicit Bedrock function that can be invoked by a structure trigger or a controlled server command when runtime integration is available. It is not represented as automatic in-world spawning.


## Performance

The functions execute one `execute unless entity` query and at most one `summon` per invocation. There is no repeating command, particle, sound, or global scan. Repeated invocation is locally guarded by the radius check.


## Runtime honesty

> Runtime spawning: **NOT TESTED — ENVIRONMENT LIMITATION**.

