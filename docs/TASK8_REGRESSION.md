# TASK 8 REGRESSION

**Status:** PASS for static validation, build, package inspection, and source regression.  
**Runtime spawning:** NOT TESTED — ENVIRONMENT LIMITATION.

| Check | Result |
|---|---|
| `protected:BP/blocks/haunted_portal.json` | PASS |
| `protected:BP/blocks/cursed_gate_core.json` | PASS |
| `protected:BP/items/soul_igniter.json` | PASS |
| `protected:BP/items/arcane_blade.json` | PASS |
| `protected:BP/items/fire_blade.json` | PASS |
| `protected:BP/items/frost_blade.json` | PASS |
| `protected:BP/items/hexblade.json` | PASS |
| `protected:BP/scripts/main.js` | PASS |
| `protected:RP/blocks.json` | PASS |
| `protected:RP/textures/item_texture.json` | PASS |
| `protected:BP/functions/structures/abandoned_hospital_build.mcfunction` | PASS |
| `protected:BP/functions/world/haunted_realm_foundation_build.mcfunction` | PASS |
| `no_unrelated_files_removed` | PASS |
| `no_unrelated_files_changed` | PASS |
| `all_eight_encounter_functions` | PASS |
| `summon_ids_in_actual_inventory` | PASS |
| `one_summon_per_function` | PASS |
| `radius_caps_present` | PASS |
| `no_new_spawn_rules` | PASS |
| `no_mob_definition_changes` | PASS |
| `package_integrity` | PASS |
| `package_encounters` | PASS |
| `package_foundation` | PASS |
| `package_eight_structures` | PASS |
| `package_legacy_systems` | PASS |
| `package_no_workspace_content` | PASS |
| `mctools_pass` | PASS |
| `build_pass` | PASS |
| `all_static_checks_pass` | PASS |

The production tree was compared with checkpoint `/home/ubuntu/three_realms/backups/task8_premerge_2026-09-01_01-33-29`. No existing mob definition was changed, no new spawn-rule JSON was introduced, and protected portal/weapon/block/item/structure/foundation files remained unchanged. Package entries: 515; SHA-256: `08ccead70da1de84edfa89662dbe5a70d806fd3097113dee00a61df21d3c47d9`.

