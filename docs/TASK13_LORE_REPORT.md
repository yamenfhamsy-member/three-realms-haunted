# TASK 13 — LORE + ENVIRONMENTAL STORYTELLING REPORT

**Date:** 2026-09-01
**Method:** Written books placed via `loot insert` into existing structure chests (no new items, no scripts, no dialogue engine).

## 1. Core story thread

"Something happened. Someone opened something that should never have been
opened. The ghosts are symptoms of a deeper supernatural problem."

The four lore books form one continuous narrative across four regions:

1. **Abandoned Hospital** — *Patient Record 07* (Ward C): patients disappearing,
   a recurring "door" drawn by an admitted patient. First symptoms.
2. **Abandoned Laboratory** — *Lab Notes — Project ANIMA* (Dr. E. Hale):
   researchers communicated with something outside normal reality; "we opened
   a window... it was a seam." Introduces the number **three** (three bands,
   three signals — seeding future THREE REALMS worlds).
3. **Crypt Depths** — *Ritual — The Seam*: the crypt was a seal, not a tomb;
   the barrier was intentionally opened. Explains the ghosts as symptoms.
4. **Nightmare Zone** — *The Last Page*: final revelation — this haunted realm
   is only the first of **three realms** that will hear the knock. Direct
   connection clue to future THREE REALMS worlds.

## 2. Deliverables

| File | Purpose |
|---|---|
| `BP/loot_tables/lore/hospital_patient_record.json` | Written book: Patient Record 07 |
| `BP/loot_tables/lore/lab_project_anima.json` | Written book: Project ANIMA lab notes |
| `BP/loot_tables/lore/crypt_ritual_note.json` | Written book: The Seam ritual |
| `BP/loot_tables/lore/nightmare_final_note.json` | Written book: The Last Page |
| `BP/functions/structures/abandoned_hospital_build.mcfunction` | +2 `loot insert` lines (slot 1, both chests) |
| `BP/functions/structures/abandoned_laboratory_build.mcfunction` | +1 `loot insert` line |
| `BP/functions/structures/crypt_build.mcfunction` | +1 chest +1 `loot insert` line |
| `BP/functions/structures/nightmare_mansion_build.mcfunction` | +1 `loot insert` line |
| `BP/functions/load_scoreboards.mcfunction` | Creates the 3 boss kill-flag objectives on world load |
| `BP/functions/load.json` | Bedrock auto-run entry point for the scoreboard init |

## 3. Design rules respected

- Lore placed **intentionally** in exactly one structure per region — no random text spam.
- Existing loot in slot 0 preserved — all `loot insert` lines are additive.
- No contradictions: timeline is Hospital → Laboratory → Crypt → Nightmare.
- No duplicate books except the intentional hospital pair (same record in
  reception and morgue chests).
- No new items, blocks, entities, or scripts — books use vanilla
  `minecraft:written_book` with `set_book_contents`.
- Atmosphere preserved: oppressive, mysterious; no cartoon horror.

## 4. Validation evidence

| Check | Result |
|---|---|
| All 4 lore loot tables JSON-parse | PASS |
| All `loot insert` references resolve to loot table files (68/68 static tests) | PASS |
| `loot_tables/lore` present in package (4 entries) | PASS |
| Extracted package: 4/4 lore books + all 8 structure functions present | PASS |
| Existing slot-0 loot lines untouched (diff = additive lines only) | PASS |
| No loops / no scans added | PASS |
| Scoreboard init function wired via `load.json` (fixes pre-existing gap) | PASS |

## 5. Package

`three_realms_haunted.mcaddon` rebuilt: **558 entries**, including
`BP_bp/loot_tables/lore/*` and the updated structure functions.
Extraction inspection confirms all lore content included.

Package: **PASS**

## 6. Full regression (Task 1→13)

- Portal, SCP mobs, weapons, structures, regions, encounters, audio: intact — PASS
- Morgue Warden / Lady of the Crypt / The Nightmare: intact — PASS
- Static test suite: 68/68 PASS
- Regression: **PASS**

## 7. Known limitations

- Book text is set via `set_book_contents` loot function (Bedrock 1.21+).
  Runtime rendering of written books: NOT TESTED — ENVIRONMENT LIMITATION.
- MCT render of structures: UNAVAILABLE IN INSTALLED ENVIRONMENT (CLI not in PATH).

## 8. Gate summary

- TASK 13: **PASS** (static)
- Build: PASS
- Package: PASS
- Extraction inspection: PASS
- Regression (Task 1→13): PASS
- Runtime: NOT TESTED — ENVIRONMENT LIMITATION
