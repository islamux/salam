# MS-GEN-2: Rename `elm` → `khatira` Across Codebase

**Date:** 2026-05-30  
**Branch:** `refactor/rename-elm-to-khatira`  
**Status:** Complete (pending commit)

## Summary

Renamed all `elm`-prefixed identifiers to `khatira` across the full Flutter codebase: 34 static text files, 34 generated list files, the data model, 35 cubit files, 34 view pages, routes, main.dart, helpers, widgets, and tests.

## Scope of Changes

### Static Text Files (34 files)
- `lib/core/data/static/text/elm_text_ders_*.dart` → `khatira_text_ders_*.dart`
- All class names: `ElmTextDers*` → `KhatiraTextDers*`, `ElmTextFInal` → `KhatiraTextFinal`, `ElmTextPre` → `KhatiraTextPre`
- Field name prefixes (e.g. `elmTextTwentyOne_1`) kept as-is (internal identifiers)

### List Files (34 files)
- Generated via `dart run tool/generate_elm_lists.dart --rename-prefix khatira`
- Written to `lib/core/data/model/khatira_lists/`
- All imports and class references updated automatically

### Data Model
- `lib/core/data/model/elm_model_new_order.dart` → `khatira_model_new_order.dart`
- `ElmModelNewOrder` → `KhatiraModelNewOrder`
- `EnOrder` enum **not renamed** (not elm-specific)

### Cubit Files (35 files)
- Directory: `lib/cubit/elm_cubits/` → `lib/cubit/khatira_cubits/`
- All 35 cubit filenames and class names renamed

### View Pages (34 files)
- `lib/view/pages/elm1.dart` → `khatira1.dart`, `elm10.dart` → `khatira10.dart`, etc.
- `elmpre_page.dart` → `khatira_pre_page.dart`, `elm_final.dart` → `khatira_final.dart`
- All imports updated

### Routes & App
- `lib/core/data/static/routes_constant.dart`: route constants `elm*` → `khatira*`, paths `/elm*` → `/khatira*`
- `lib/app_routes.dart`: all imports and route references updated
- `lib/main.dart`: `ElmApp` → `KhatiraApp`, title `'Elm'` → `'Khatira'`

### Helpers & Widgets
- `lib/helpers/search/data_search.dart`: list variable names, imports, route constants
- `lib/cubit/share/get_page_text_for_sharing.dart`: local variable `elm` → `khatiraModel`
- `lib/view/widget/custom_text_slider/get_page_texts_order.dart`: same
- `lib/cubit/base_cubit/base_page_cubit.dart` / `base_page_state.dart`: field references

### Tests
- `test/unit/base_page_cubit_test.dart`: imports, class names, `cubit.elmList` → `cubit.khatiraList`

## Generator Bugs Fixed

Three pre-existing generator bugs were discovered and fixed during the rename:

### 1. Footer single-value output
- **Bug:** Generator wrapped `footer` fields in `[]` (list syntax), but the model defines `footer: String?`
- **Fix:** `FieldType.footer` with a single element now emits `footer: value,` instead of `footer: [value],`

### 2. Commented-out field extraction
- **Bug:** `extractFields()` matched `static const String` even inside `//` comments (e.g. `titlePreOne_2`)
- **Fix:** Skip matches where the line prefix is `//`

### 3. Import path mismatch (`rawName`)
- **Bug:** Generator used digit-based names (e.g. `khatira_text_ders_10.dart`) for imports, but actual filenames are word-based (e.g. `khatira_text_ders_ten.dart`)
- **Fix:** Added `rawName` field to `ParsedSource` preserving the original filename without digit conversion

## Verification

| Check | Result |
|-------|--------|
| `flutter analyze` | 0 errors |
| `flutter test` | 12/12 pass |
| Generator `--dry-run` | runs clean |
| `dart format .` | clean |

## Remaining Steps

- Commit the `refactor/rename-elm-to-khatira` branch
- Remaining TODO comments with `goToElm*` in `home_cubit.dart` (cosmetic only)
