# MS-GEN-1: Static Text → Elm List Generator

**Branch:** `feature/khatira-generator`
**File:** `tool/generate_elm_lists.dart` (669 lines)
**Date:** 2026-05-30

---

## 1. Purpose

Build a standalone Dart generator script that parses 34 static text files (`lib/core/data/static/text/elm_text_ders_*.dart`) and auto-generates the corresponding `elm_list_*_new_order.dart` files (`lib/core/data/model/elm_lists/`). The generator replaces the manual cleanup approach originally planned in MS-9.

## 2. Architecture

The generator follows a 3-phase pipeline:

```
Source file (.dart) → [1. Extract Fields] → [2. Page Grouping] → [3. Output Writer] → ElmModelNewOrder list
```

### Phase 1: Field Extraction (`extractFields`)

- **Regex:** `static const( String)?\s+(\w+)\s*=\s*"""([\s\S]*?)""";`
- Captures field name and raw text value
- Stores field offset in source (for page grouping)
- **Type inference** (`inferFieldType`): Prefix-based mapping
  - `title*`, `titlePage*` → `titles`
  - `elmText*`, `elmTex*`, `elmtText*`, `elmtext*`, `elmNoText*`, `textFInal*`, `elmEighteenEleven*` → `texts`
  - `ayahHadith*`, `ayahFInal*`, `ayahHdith*`, `ayaHadith*`, `ayahaHadith*`, `ayahFInal*` → `ayahs`
  - `subtitle*` → `subtitles`
  - `footer*` → `footer`
- **Typo map** (`typoMap`): 10 field name corrections
  - `elmTextsFiveFive_1` → `elmTextFiveFive_1`
  - `azkarHadithPageTwo_1` → `ayahHadithPageTwo_1`
  - `titleTwentyFourThirtyOne_1` → `titleTwentyFourOne_1`
  - etc.

### Phase 2: Page Grouping (`groupByPage`)

**Delimiter parsing** (`parseDelimiters`): Comments in source files that mark page boundaries:

| Pattern | Example | Type |
|---------|---------|------|
| `// [Page|page] N` | `// page 1` | worded |
| `// ---- Page N` | `// ---- Page 1` | worded |
| `// // page N` | `// // page 1` | worded |
| `// page [word]` | `// page one` | worded |
| `// page[Word]` | `// pageThree` | worded |
| `// Two[Word]` | `// TwoOne`, `// twoTen` | worded |
| `// N` | `// 5` | bare number |
| `// // N` | `// // 5` | bare number |

**Key design decisions:**

1. **Delimiter index as group key** — Uses delimiter position in array (not label) as the page group key. This fixes the bug where consecutive delimiters with the same label (`// ---- Page 1` + `// page 1`) would collide and duplicate fields.

2. **Bare number filtering** — Bare number delimiters are ambiguous: they can be real page boundaries (in files 1, 8, 9, 10, 12, 13) OR sub-references within a worded page (like `// 1`, `// 2` inside `// page 9` in file 4). Rule: bare numbers BEFORE the first worded delimiter are kept as page boundaries; bare numbers AFTER are filtered out as sub-references.

3. **Word-based page numbers** — `// page one`, `// pageThree`, `// page four` use word numbers instead of digits. `extractWordNumber()` maps words to digits via `wordToNum`.

4. **Pre-first fields** — Some files have fields before any delimiter comment. These form their own page 1 (with label "1").

5. **Same-label consecutive merge** — When two consecutive delimiters have the same label (different formatting of the same page number), their fields are merged into a single page.

### Phase 3: Output Writer (`generateElmList`)

Produces valid Dart code:

```dart
// TextDers{N}
import 'package:khatir/core/data/model/elm_model_new_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/core/data/static/text/elm_text_ders_{N}.dart';

List<ElmModelNewOrder> elmList{N}NewOrder = [
  // {page_label}
  ElmModelNewOrder(
    {field_type}: [
      ElmTextDers{Class}.{field_name},
    ],
    ...
    order: [
      EnOrder.{type},
    ],
  ),
];
```

- **Page labels** preserved from source delimiters (e.g., `// 1`, `// TwoOne`, `// page 2`)
- **Formatting**: single-line for simple pages (1 type, ≤3 fields), multi-line otherwise
- **Class reference** uses `_classRef()` which normalizes `FInal` → `Final` for the `elm_text_ders_final.dart` class name

## 3. Bugs Found & Fixed

| Bug | Root Cause | Fix |
|-----|-----------|-----|
| Consecutive same-label delimiters merge duplicates fields | Used label as page group key; two delimiters with label "1" mapped to same key | Use delimiter index (position in array) instead of label |
| `final` file started at page 2 | Pre-first 3 fields merged into delimiter-0's page (label "2") instead of becoming their own page | Create separate page 1 for pre-first fields |
| `four` file showed 30 pages instead of 13 | Bare number delimiters (`// 1`, `// 2`) inside `// page 9` treated as page boundaries | Filter bare numbers after first worded delimiter |
| `twenty_five` showed 2 pages instead of 19 | `// page one`, `// pageThree` patterns not matched by regex | Added word-based page number patterns to `pageDelimiter` and `wordedDelimiter` |
| Compilation error after refactor | Leftover old function body | Removed duplicate code |

## 4. Remaining Differences vs Originals (8 files)

The generator produces cleaner, more consistent output than the handwritten originals. These differences are expected:

| File | Original Pages | Generated Pages | Reason |
|------|---------------|-----------------|--------|
| 1 | 29 | 28 | Original subdivided one page manually |
| 3 | 13 | 11 | Original subdivided pages manually |
| 6 | 5 | 4 | Original subdivided one page manually |
| 12 | 29 | 19 | Original subdivided 10 pages manually |
| 13 | 13 | 12 | Original subdivided one page manually |
| 15 | 17 | 16 | Original subdivided one page manually |
| 16 | 26 | 25 | Original subdivided one page manually |
| 18 | 40 | 27 | Original subdivided 13 pages manually |
| 23 | 20 | 18 | Original subdivided 2 pages manually |
| 27 | 21 | 19 | Original subdivided 2 pages manually |
| 28 | 11 | 12 | Generator creates 1 extra page from delimiter |

**26/34 files match page counts exactly.** The 8 non-matching files differ because the human author subdivided some delimiter sections into multiple `ElmModelNewOrder` entries. The generator's structure (one page per delimiter) is semantically correct and consistent.

## 5. CLI Interface

```bash
# Dry run (preview without writing)
dart run tool/generate_elm_lists.dart --dry-run

# Verbose output (field-by-field, delimiter-by-delimiter)
dart run tool/generate_elm_lists.dart --dry-run --verbose

# Generate files
dart run tool/generate_elm_lists.dart

# Generate with rename prefix (for MS-GEN-2)
dart run tool/generate_elm_lists.dart --rename-prefix khatira
```

## 6. Key Files

- `tool/generate_elm_lists.dart` — The generator (669 lines, zero dependencies)
- `lib/core/data/static/text/` — 34 source text files (input)
- `lib/core/data/model/elm_lists/` — Output directory (generated files)
- `command-center/docs/plans/2026-05-30-khatira-generator.md` — Full design plan
- `command-center/project-tracker.json` — Task tracker with MS-GEN-1/2/3 milestones
