# Asset Sources — Watcher and Haunted Realm

Audit date: 2026-08-31
All downloads are retained under `/tmp/three_realms_workspace/`.
No external asset has been promoted into `~/three_realms/` during this audit.

## 1. SCP: Dystopia

- Repository: https://github.com/lc-studios-mc/scp-dystopia
- Local path: `/tmp/three_realms_workspace/horror_mobs/scp-dystopia`
- Commit inspected: `39d0d12ab4209975cc2e81f34e987a0e5eb23214`
- Creator: LuckedCoronet / lc-studios-mc
- License: CC BY-SA 4.0, repository `LICENSE`
- Status: TECHNICAL/ASSET CANDIDATE, not promoted.
- Inventory: Bedrock source contains entity JSON, client entities, geometry, animations, animation controllers, render controllers, particles, sounds, textures, loot, spawn-related content, structures, and scripts.
- Relevant candidates discovered: SCP-966 geometry/client entity/animation/controller/texture/sounds; SCP-173 and SCP-096 families. These are SCP-branded and are not The Watcher design.
- Reuse decision: no files copied. Any future reuse requires checking per-file notices/third-party provenance, attribution, ShareAlike obligations, and avoiding SCP character identity in Watcher.

## 2. BOMD Bedrock

- Repository: https://github.com/vandaaniels/BOMD-Bedrock
- Local path: `/tmp/three_realms_workspace/blocks_items/BOMD-Bedrock`
- Commit inspected: `dcf8647a563c5c8396ffb18232aa4304ec56586aee537c45064c6fb425e44ad` (repository HEAD shown by local clone)
- Creator/port: Rossetti / contributors as described in README
- License: GPL-3.0-or-later, repository `LICENSE`; `NOTICE.md` also exists.
- Version stated by README: Bedrock 1.26.40+, Script API 2.9.0.
- Inventory: modern Bedrock BP/RP with blocks/items, entity models, animations/controllers, render controllers, sounds, particles, loot, and structures.
- Reuse decision: no files copied. Any future selected file must preserve GPL source/license obligations and the repository's notices/attribution. Bosses and recognizable original designs are not candidates for The Watcher.

## 3. cleannrooster assets

- Repository: https://github.com/cleannrooster/forg-cleannrooster-assets
- Local path: `/tmp/three_realms_workspace/armor_weapons/forg-cleannrooster-assets`
- Commit inspected: `a1ca6f85e56ae4fbcca31aca3c1981b190dc31a8`
- Creator: cleannrooster
- License: repository MIT plus README asset terms: assets in this repository are stated to be created by the author, usable including commercially, attribution appreciated but not required; scope excludes assets outside this repository.
- Inventory: Blockbench files, humanoid animations, armor, item/weapon-like assets, spell icons, previews, Blender sources.
- Reuse decision: no files copied. This repository is reserved for a later armor/weapons task, not Watcher visual identity.

## 4. Skinny Monster 2

- Source: https://sketchfab.com/3d-models/skinny-monster-2-66d50a73651b44ee8a0a21b09c7cc77d
- Creator: ItsGamertor
- License shown on the accessible Sketchfab page: CC Attribution / Creative Commons Attribution.
- Description: Blender model, described by page as fully textured and low poly; page metadata also displayed a much higher current triangle count than the description.
- Download status: NOT DOWNLOADED. The page was inspected, but no downloadable archive was obtained in this step.
- Reuse status: CANDIDATE ONLY. Before integration, the actual downloaded archive and included textures/materials must be inspected and attribution requirements retained. No production copy exists.

## Rejected/not-yet-approved assets

- Verity JE/BE assets: not used; license was not verified and character design must not be copied.
- CurseForge Watcher assets: not used; automated access returned 403 and license/archive contents were not verified.
- SCP-096/173/966 and other SCP character assets: not selected for Watcher because they carry recognizable third-party character identities, despite the repository's CC BY-SA license.
- Any asset with unclear per-file provenance or incompatible terms: rejected until separately verified.
