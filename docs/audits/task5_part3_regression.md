# TASK 5 PART 3 REGRESSION

**Status:** PASS — static validation, build, package inspection, portal protection, and SCP regression passed.  
**Runtime:** NOT TESTED — ENVIRONMENT LIMITATION.

| Check | Result |
|---|---|
| `portal:BP/blocks/haunted_portal.json` | PASS |
| `portal:BP/blocks/cursed_gate_core.json` | PASS |
| `portal:BP/items/soul_igniter.json` | PASS |
| `portal:BP/scripts/main.js` | PASS |
| `portal:RP/blocks.json` | PASS |
| `portal:RP/models/blocks/haunted_gate.geo.json` | PASS |
| `production_guard_checkpoint_verified` | PASS |
| `blocked_armor_absent` | PASS |
| `blocked_rifle_absent` | PASS |
| `scp173_absent` | PASS |
| `no_unrelated_production_files_removed` | PASS |
| `no_unrelated_production_files_changed` | PASS |
| `scp_mob_pool_and_supporting_content_unchanged` | PASS |
| `scp_files_compared` | PASS |
| `id:arcane_blade` | PASS |
| `id:fire_blade` | PASS |
| `id:frost_blade` | PASS |
| `id:hexblade` | PASS |
| `no_item_identifier_collision` | PASS |
| `no_bomd_namespace_left_in_packs` | PASS |
| `package_archive_integrity` | PASS |
| `package_four_weapons` | PASS |
| `package_portal` | PASS |
| `package_scp_entities` | PASS |
| `package_blocked_assets_excluded` | PASS |
| `package_workspace_content_excluded` | PASS |
| `all_static_checks_pass` | PASS |

Compared {len(scp_files)} pre-existing SCP-supporting files against the pre-merge checkpoint. No unrelated files were removed or changed. The four new identifiers have no collision with the existing 24 item identifiers. The blocked armor layers and rifle are absent from production and package.

Package: `/home/ubuntu/three_realms/build/task5/task5_part3_export_view.mcaddon`; SHA-256: `4e42400cf917c93b0621992755864e08943d0147ce58d87413a5016be791b193`; entries: 494.

Runtime remains **NOT TESTED — ENVIRONMENT LIMITATION**.

