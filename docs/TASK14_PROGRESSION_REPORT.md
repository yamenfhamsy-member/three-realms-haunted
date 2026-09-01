# TASK 14 — PROGRESSION + LOOT REPORT

**Date:** 2026-09-01
**Principle:** coherent survival-horror progression using existing validated content only. No power creep. Blocked assets (armor layers, rifle) remain blocked — not fabricated.

## 1. Audit findings (before Task 14)

- 4 weapons exist, identical stats (damage 6, durability 200) — no tiering.
- Boss loot already escalated by design (Warden: bones/iron → Lady: membrane/echo shard → Nightmare: diamond).
- Region chests all used the same generic `scpdt/scp131` table (redstone/iron nugget) — no tiering.
- `haunted_watcher` dropped only string.

## 2. Implementation (all additive)

### Chest loot tiers (new: `BP/loot_tables/chests/`)
| Tier | Table | Regions/Structures | Contents |
|---|---|---|---|
| Common (early) | `common_rewards.json` | Haunted House, Ruined Church, Cemetery Complex | torches, bread, coal, iron nuggets, emeralds |
| Uncommon (mid) | `uncommon_rewards.json` | Cursed Mansion, Abandoned Hospital (×2), Abandoned Laboratory | iron ingots, golden carrots, redstone, emeralds, amethyst |
| Rare (late) | `rare_rewards.json` | Crypt Depths, Nightmare Mansion | diamonds, echo shards, obsidian, gold, emerald block + **rare 15% hexblade drop** |

All tier inserts go to a fresh container slot (1 or 2) — slot 0 loot and Task 13 lore books untouched.

### Entity loot
- `haunted_watcher.json`: original string drop preserved (weight 50); added emerald (30), iron ingot (15), amethyst shard (5).
- `three_realms_morgue_warden.json`: +bonus pool — emeralds 1–3 (85%) / diamond (15%).
- `three_realms_lady_of_the_crypt.json`: +bonus pool — emeralds 2–4 (80%) / emerald block (20%).
- `three_realms_the_nightmare.json`: unchanged — already the strongest table (diamonds/echo shards/amethyst/obsidian).

### Progression path
Outskirts/Forest/Cemetery (common) → Village/Hospital/Laboratory (uncommon) → Crypt/Nightmare (rare + hexblade) → bosses (bonus pools). No progression dead ends; hexblade is the only weapon gated behind late-game loot — fire/frost/arcane blades remain craft/inventory items.

## 3. Validation evidence

| Check | Result |
|---|---|
| All 6 new/modified loot tables JSON-parse | PASS |
| All `loot insert` references resolve (incl. 3 new tier tables) | PASS — 68/68 static tests |
| Existing slot-0 loot + lore books untouched | PASS (additive slots only) |
| Package rebuilt: 564 entries, 4 `chests/` entries included | PASS |
| No unsupported items referenced (hexblade exists in BP/items) | PASS |

## 4. Full regression (Task 1→14)

- Portal, SCP mobs, weapons, structures, regions, encounters, audio: intact — PASS
- Bosses (Warden/Lady/Nightmare): intact — PASS
- Lore books: intact — PASS
- Static test suite: 68/68 PASS
- Regression: **PASS**

## 5. Known limitations

- Weapon stat tiering (e.g., hexblade stronger damage) deliberately NOT changed — gameplay balance change requires runtime testing: NOT TESTED — ENVIRONMENT LIMITATION.
- Runtime loot drop behavior: NOT TESTED — ENVIRONMENT LIMITATION.

## 6. Gate summary

- TASK 14: **PASS** (static)
- Build: PASS
- Package: PASS
- Regression (Task 1→14): PASS
- Runtime: NOT TESTED — ENVIRONMENT LIMITATION
