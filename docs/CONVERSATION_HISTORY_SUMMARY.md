# Project History Summary

## 2026-08-31

- Audited the original local `three_realms_haunted.mcaddon` without replacing the baseline.
- Extracted editable Behavior Pack and Resource Pack sources under `BP/` and `RP/`.
- Documented the baseline, Bedrock 1.26.x compatibility, tools, progress, portal implementation, and limitations.
- Hardened the existing physical Haunted Portal implementation, including frame/orientation checks, activation handling, cooldown logic, and static reference validation.
- Preserved the original artifact and created timestamped backups.
- Installed and used Minecraft Creator Tools CLI `0.17.8` in the temporary workspace.
- Built and inspected a portal staging package; runtime Minecraft testing remains unavailable.
- Researched official Microsoft Bedrock Samples and external asset repositories under `/tmp/three_realms_workspace/`; no unverified external visual assets were promoted into production.
- Audited SCP-Dystopia and created temporary entity/dependency reports. Production mob integration remains blocked pending complete resource closure and compatibility review.
- Created isolated SCP-Dystopia staging attempts and documented source issues, including missing manifests, legacy formats, malformed/unrelated files, and unresolved dependencies.
- No Watcher, Crawler, Wailer, or other production mob has been successfully integrated from SCP-Dystopia.
- The existing portal identifiers remain protected: `three_realms:haunted_portal`, `three_realms:cursed_gate_core`, and `three_realms:soul_igniter`.
- Minecraft runtime, multiplayer, save/reload, AI, rendering, animation playback, sounds, particles, and mobile performance remain **NOT TESTED — ENVIRONMENT LIMITATION**.

## Security note

Credentials and access tokens are intentionally excluded from this repository and this summary. Do not commit secrets, private conversation exports, temporary downloads, backups, or unverified third-party assets.
