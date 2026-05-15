# MS-9: Data Files Standardization & Cleanup

**Branch:** `fix/data-files-standardization`
**Created:** 2026-05-15
**Domain:** data-quality
**Phase:** 3.5 | **Week:** 19-20
**Planned:** 2026-05-15 → 2026-05-17
**Order:** MS-9 first, then MS-8 (data cleanup before code quality)

---

## Scope

Standardize naming, fix typos, clean dead code, and unify formatting across all 68 data files:
- **34 elm list files** (`lib/core/data/model/elm_lists/`) — 11,216 lines, 565 entries
- **34 elm text files** (`lib/core/data/static/text/`) — 11,012 lines, ~2,600 fields

All issues are cosmetic/style — zero functional bugs or analyzer errors exist.

---

## Tasks

### 9.1 — Standardize class naming (12 text files)

**Priority:** P2 | **Files:** 12

Text files deviating from `ElmTextDers{X}` pattern:

| File | Current Class | Target Class |
|------|---------------|--------------|
| `elm_text_ders_sixteen.dart` | `ElmTextDebsSixteen` | `ElmTextDersSixteen` |
| `elm_text_ders_nineteen.dart` | `ElmTextNineteen` | `ElmTextDersNineteen` |
| `elm_text_ders_twenty.dart` | `ElmTextTwenty` | `ElmTextDersTwenty` |
| `elm_text_ders_twenty_one.dart` | `ElmTextTwentyOne` | `ElmTextDersTwentyOne` |
| `elm_text_ders_twenty_two.dart` | `ElmTextTwentyTwo` | `ElmTextDersTwentyTwo` |
| `elm_text_ders_twenty_three.dart` | `ElmTextTwentyThree` | `ElmTextDersTwentyThree` |
| `elm_text_ders_twenty_four.dart` | `ElmTextTwentyFour` | `ElmTextDersTwentyFour` |
| `elm_text_ders_twenty_five.dart` | `ElmTextTwentyFive` | `ElmTextDersTwentyFive` |
| `elm_text_ders_twenty_six.dart` | `ElmTextTwentySix` | `ElmTextDersTwentySix` |
| `elm_text_ders_twenty_seven.dart` | `ElmTextTwentySeven` | `ElmTextDersTwentySeven` |
| `elm_text_ders_pre.dart` | `ElmTextPre` | `ElmTextDersPre` |
| `elm_text_ders_final.dart` | `ElmTextFInal` | `ElmTextDersFinal` |

**AC:** All 12 class names unified to `ElmTextDers{X}` pattern, all imports updated in elm_list files, flutter analyze passes.

### 9.2 — Fix elm_lists naming/imports

**Priority:** P2 | **Files:** 8

- `elm_list_final_new_order.dart` — rename `finalListNewOrder` → `elmListFinalNewOrder`
- `elm_list_20_new_order.dart` — change relative import `'../enum_order.dart'` → `package:khatir/.../enum_order.dart`
- Lists 25-31 — unify `=<ElmModelNewOrder>[` to plain `=[` (7 files)
- Lists 19, 25 — remove `<String>` / `<EnOrder>` typed generics (use plain `[...]`)

**AC:** All variable names follow `elmList{X}NewOrder`, imports use `package:`, no typed generics on literals, flutter analyze passes.

### 9.3 — Fix all field name typos

**Priority:** P2 | **Files:** 6

**Text files (6 typos):**

| File | Line | Incorrect | Correct |
|------|------|-----------|---------|
| `elm_text_ders_eight.dart` | 84 | `ayahaHadithFive_1` | `ayahHadithFive_1` |
| `elm_text_ders_five.dart` | 58 | `elmTextsFiveFive_1` | `elmTextFiveFive_1` |
| `elm_text_ders_five.dart` | 67 | `elmTextsFiveFive_2` | `elmTextFiveFive_2` |
| `elm_text_ders_twenty.dart` | 185 | `elmtTextTwentyEight_1` | `elmTextTwentyEight_1` |
| `elm_text_ders_sixteen.dart` | 380 | `titlesSixteenTwentySix` | `titleSixteenTwentySix` |
| `elm_text_ders_final.dart` | 295 | `ayahHdithFInalPageTen_3` | `ayahHadithFinalPageTen_3` |

**List files (4 references to fix):**

| File | Typo Reference | Correct |
|------|---------------|---------|
| `elm_list_final_new_order.dart` | `ayahHdithFInalPageTen_3` | `ayahHadithFinalPageTen_3` |
| `elm_list_20_new_order.dart` | `elmtTextTwentyEight_1` | `elmTextTwentyEight_1` |
| `elm_list_20_new_order.dart` | `elmTextTwenteThirteen_3` | `elmTextTwentyThirteen_3` |
| `elm_list_13_new_order.dart` | `elm_text_ders_therteen.dart` import | matches filename (intentional) |

**AC:** All 10 typos fixed, flutter analyze passes.

### 9.4 — Fix wrong header comments (5 list files)

**Priority:** P3 | **Files:** 5

| File | Says | Should Say |
|------|------|------------|
| `elm_list_16_new_order.dart` | `Fifteen` | `Sixteen` |
| `elm_list_17_new_order.dart` | `SixTeen` | `Seventeen` |
| `elm_list_19_new_order.dart` | `SixTeen` | `Nineteen` |
| `elm_list_20_new_order.dart` | `SixTeen` + `Seventeen` | `Twenty` |
| `elm_list_23_new_order.dart` | `SixTeen` | `TwentyThree` |

Also fix additional header comment issues:
- `elm_list_9_new_order.dart` — `Nin3` → `Nine`
- `elm_list_11_new_order.dart` — `Derse` → `Ders`
- `elm_list_14_new_order.dart` — `TexDerseFourteen` → `TextDersFourteen`
- `elm_list_15_new_order.dart` — double space → single space

**AC:** All header comments reference correct file numbers, flutter analyze passes.

### 9.5 — Clean dead code & dev artifacts

**Priority:** P2 | **Files:** 4

| File | Lines | What |
|------|-------|------|
| `elm_list_12_new_order.dart` | 488 | `// ...existing code...` |
| `elm_list_17_new_order.dart` | 205-206 | `// copilot gpt4.1` / `// ...existing code...` |
| `elm_list_pre_new_order.dart` | 20, 38, 64-68 | Commented-out string-order format remnants |
| `elm_list_20_new_order.dart` | 209, 224, 245 | Commented-out string-order format remnants |
| `elm_text_ders_pre.dart` | 20 | Commented-out dead field declaration |

**AC:** All scaffolding artifacts removed, flutter analyze passes.

### 9.6 — Add missing `String` type annotations

**Priority:** P3 | **Files:** 5

Files using `static const fieldName = ...` instead of `static const String fieldName = ...`:

| File | Fields Missing `String` |
|------|-----------------------|
| `elm_text_ders_final.dart` | 52 (pages 1-8) |
| `elm_text_ders_twenty_one.dart` | 1 |
| `elm_text_ders_twenty_two.dart` | 20 |
| `elm_text_ders_twenty_five.dart` | 9 |
| `elm_text_ders_twenty_seven.dart` | 2 |

**AC:** All 84 fields annotated with explicit `String` type, flutter analyze passes.

### 9.7 — Standardize page comment markers

**Priority:** P3 | **Files:** 34

Unify all page comment variants to a single format: `// page N`

Current variants found:
- `// page 1` (most common ✓)
- `// Page 1` (capital P)
- `//page 1` (no space)
- `//---- page 1` (with dashes)
- `//   Page 1` (leading spaces)
- `// pageOne` (camelCase)
- `// PageThree` (camelCase)
- `// Page Eleven (from kibr.ini // TwentySixEleven_..)` (weird)
- `// page 1` in text files only

**AC:** All ~565 page markers use `// page N` format, flutter analyze passes.

### 9.8 — Formatting consistency (lists)

**Priority:** P3 | **Files:** 4

Fix edge cases:
- `elm_list_1_new_order.dart:281` — add trailing comma after last `EnOrder` item
- `elm_list_4_new_order.dart:55` — expand inline `ElmModelNewOrder(...)` to multiline
- `elm_list_1_new_order.dart:289` — expand inline `order: [EnOrder.texts]` to multiline

**AC:** All 3 formatting fixes applied, flutter analyze passes.

### 9.9 — Verify build and analyze

**Priority:** P2

**AC:**
- `flutter analyze` passes with 0 issues
- `flutter test` passes (all existing tests)
- `flutter build apk --release --android-skip-build-dependency-validation` succeeds

---

## Execution Order

MS-9 runs **before** MS-8 because fixing data file naming affects imports that MS-8 tasks may touch.

After MS-9 completes, switch to `fix/bug-fixes-code-quality` branch and resume MS-8.

---

## Risk Assessment

- **Analyzer risk:** Low — all changes are mechanical renames/additions
- **Runtime risk:** None — no logic changes, only naming/formatting
- **Merge conflict risk:** Low — data files are leaf nodes (no other branches touch them)
