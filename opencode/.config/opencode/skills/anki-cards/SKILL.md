---
name: anki-cards
description: Use when creating, editing, or importing Anki flashcards — including creating new decks, writing cards of any type (Basic, Cloze, etc.), adding images, and running the import script via python3 $ANKI_PATH/import.py.
---

# Anki Cards Skill

## Prerequisites

- **Anki must be running** before the import script is executed
- **AnkiConnect add-on** must be installed in Anki: Tools > Add-ons > Get Add-ons > code `2055492159`
- **`$ANKI_PATH`** env var points to the project root (defined in `~/.zshrc`)

## Project layout

```
$ANKI_PATH/
├── import.py
└── decks/
    └── <deck-name>/
        ├── cards.csv
        └── images/
```

- One directory per deck under `decks/`
- Deck name in Anki = directory name, 1:1, no reformatting (e.g. `system-design` → `system-design`)
- To create a new deck: create `$ANKI_PATH/decks/<name>/` and add a `cards.csv`

## Card design principles

Good cards are harder to write than they look. Apply these rules before writing any CSV row.

**No duplicate or overlapping concepts (Deduplication)**
Never create cards that test the same underlying concept, fact, or mechanism that is already covered in the deck under different wording.
- Check existing cards in the deck before drafting new ones.
- If new material provides a better explanation or diagram for an existing card, propose updating or replacing the existing card rather than creating a duplicate.

**One concept per card (atomic)**
Split anything that contains "and" or covers multiple ideas. If the answer has more than two sentences of distinct facts, it should be multiple cards.

**One unambiguous answer**
The correct answer must be immediately obvious from the question — no room for a different-but-correct response. Avoid:
- "What is an example of X?" — inverts correctly; ask "X is an example of \_\_\_" instead
- "Describe X" or "Explain X" — too open-ended; ask about one specific property
- Enumerations ("list all the...") — ask about individual members instead

**No yes/no questions**
Reframe as "why", "what", or "when". The reasoning is more valuable than the boolean, and it's easier to remember.

**Context-free fronts**
The front must be fully comprehensible without any surrounding context. Prefix with the topic so the card makes sense when encountered in a mixed review session — e.g. `Rate Limiter:`, `System Design:`, `Redis:`.

**Prefer causal questions**
"Why does X cause Y?" tests understanding. "What is X?" tests recall of a definition. Favour the former.

---

## CSV format

Header row is required. Column names are case-insensitive.

```csv
type,Front,Back,tags
```

| Column | Required | Notes |
|--------|----------|-------|
| `type` | No | Defaults to `Basic` if omitted |
| `Front` | Depends on type | See card types below |
| `Back` | Depends on type | See card types below |
| `tags` | No | Space or comma-separated. Do not include `script-managed` — it is added automatically |

- Wrap any value containing a comma in double quotes (standard CSV)
- HTML is supported in all field values
- Lines starting with `#` are treated as comments and ignored

## Card types

### Basic

Front and back. Most common type.

```csv
type,Front,Back,tags
Basic,What is rate limiting?,"Controls request rate per client using algorithms like token bucket or sliding window",system-design
```

### Basic (and reversed card)

Generates two cards: front→back and back→front.

```csv
type,Front,Back,tags
Basic (and reversed card),What does CDN stand for?,Content Delivery Network,networking
```

### Basic (type in the answer)

Same as Basic but the user types the answer rather than flipping the card.

```csv
type,Front,Back,tags
Basic (type in the answer),Capital of France?,Paris,geography
```

### Cloze

`Back` contains the cloze text with `{{c1::...}}` syntax. `Front` is optional and maps to Anki's "Back Extra" field.

```csv
type,Front,Back,tags
Cloze,,The {{c1::CAP theorem}} states you can only guarantee {{c2::2 of 3}} properties,fundamentals
Cloze,Additional context here,A {{c1::load balancer}} distributes traffic across {{c2::multiple servers}},networking
```

Each `{{cN::...}}` deletion generates a separate card. A note with `c1` and `c2` produces 2 cards.

## Images

1. Place image files in `$ANKI_PATH/decks/<deck-name>/images/`
2. Reference in any field using an HTML `<img>` tag:

```csv
type,Front,Back,tags
Basic,What does this architecture look like?,"<img src=""diagram.png"">",system-design
Cloze,,A {{c1::reverse proxy}} sits in front of servers<br><img src="architecture.png">,networking
```

- The import script copies all files from `images/` to Anki's media folder automatically
- Files already up-to-date (by modification time) are skipped

## Running the import

```bash
python3 $ANKI_PATH/import.py
```

- Scans **all** `decks/*/cards.csv` files automatically — no arguments needed
- Always read the existing `cards.csv` before editing to avoid unintentional deletions

## Git synchronization

`$ANKI_PATH` is a Git repository. After running a successful import, always stage all changes (new/edited CSV files and images), create a concise commit describing the changes (e.g. `feat(system-design): add postgres internals flashcards`), and push to `origin`.

## Sync behaviour — CSV is source of truth

| Scenario | Result |
|----------|--------|
| Row in CSV, not in Anki | Card added |
| Row in both CSV and Anki | Untouched (`synced`) |
| Row removed from CSV | Card deleted from Anki |
| Card added manually in Anki (no `script-managed` tag) | Never touched by the script |

**Important:** editing a card's primary identity field (`Front` for Basic types, `Back` for Cloze) is treated as delete + add. The old card is removed and a new one is created.

## Reading the output

```
Connected to AnkiConnect v6

[system-design]
  tagged  : 4 existing note(s) brought under sync
  cards   — added: 1, deleted: 0, synced: 3, error: 0
  images  — copied: 1, up-to-date: 0

────────────────────────────────────────
Total — added: 1, deleted: 0, synced: 4, error: 0
```

| Field | Meaning |
|-------|---------|
| `tagged` | First-run only — existing notes matched to CSV rows and brought under sync management |
| `added` | New cards imported this run |
| `deleted` | Cards removed because their row was deleted from the CSV |
| `synced` | Cards present in both CSV and Anki — no action taken |
| `error` | Rows that failed; check for malformed fields, unknown `type` values, or missing required columns |

## Working from external resources

When creating cards from a URL, article, or document:

1. **Fetch and identify** the most important concepts — prioritise ideas that recur across system design, not one-off details
2. **Check for existing coverage** — cross-reference candidate concepts against existing cards in `cards.csv` (and related decks) to eliminate redundant or overlapping topics before drafting
3. **Draft cards** applying the card design principles above — atomic, causal, context-free, and non-duplicate
4. **Always present the proposed cards to the user for approval before writing the CSV** — show the front and back of each card and wait for explicit sign-off; do not skip this step even if the user has not asked for it
5. **If images are available** in the source, proactively offer to download and embed them:
   - Download with clean descriptive filenames (e.g. `rate-limiter-token-bucket.svg`, not a CDN hash)
   - Place in `$ANKI_PATH/decks/<deck-name>/images/`
   - Embed in the `Back` field, not the `Front`, using `<img src="filename">`
   - If multiple diagrams apply to a single card, ask the user whether to stack them or split into separate cards
6. **After approval**, write the CSV, run the import, verify the output, and commit & push the changes to git

---

## Agent workflow checklist

1. Identify or create the deck directory under `$ANKI_PATH/decks/`
2. **Read** the existing `cards.csv` to inspect existing cards and avoid duplicate coverage or unintentional deletions
3. **Draft proposed cards** applying the card design principles (ensuring zero semantic overlap with existing cards)
4. **Present cards to the user and wait for explicit approval** — always, without exception
5. After approval, add, edit, or remove rows in `cards.csv`
6. If adding images, download with descriptive filenames, place in `images/`, and embed in `Back` with `<img src="filename">`
7. Run `python3 $ANKI_PATH/import.py`
8. Confirm output shows expected `added`/`deleted` counts with `error: 0`
9. Inspect `git status` in `$ANKI_PATH` and stage modified/added files (`decks/<deck-name>/cards.csv`, `decks/<deck-name>/images/`)
10. Commit with a clear message (e.g. `feat(<deck>): add <topic> cards`) and push to `origin`
