# Khatira Generator + Rename — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a standalone Dart script (`tool/generate_elm_lists.dart`) that reads static text files and generates elm_list files, then renames the `elm` prefix to `khatira` across the codebase.

**Architecture:** A single Dart script parses all 34 static text files (field extraction by regex + prefix type inference + page grouping by delimiter comments), outputs matching `ElmModelNewOrder` list files, and optionally renames all identifiers from `elm*` to `khatira*`.

**Tech Stack:** Dart 3.x standalone script, no dependencies beyond `dart:io`

**Branches:**
- `feature/khatira-generator` — MS-GEN-1
- `refactor/rename-elm-to-khatira` — MS-GEN-2 + MS-GEN-3

---

## MS-GEN-1: Generator Core

Branch: `feature/khatira-generator`

### Task 1.0: Create Branch

- [ ] Create branch:
  ```bash
  git checkout -b feature/khatira-generator
  ```

### Task 1.1: Parser — Field Extraction

**Create** `tool/generate_elm_lists.dart`

Core data structures:

```dart
enum FieldType { titles, subtitles, texts, ayahs, footer }

class ParsedField {
  final String name;
  final String value;
  final FieldType type;
  ParsedField(this.name, this.value, this.type);
}
```

Number mapping:

```dart
const wordToNum = {
  'pre': 'pre', 'final': 'final',
  'one': '1', 'two': '2', 'three': '3', 'four': '4', 'five': '5',
  'six': '6', 'seven': '7', 'eight': '8', 'nine': '9', 'ten': '10',
  'eleven': '11', 'twelve': '12', 'therteen': '13', 'fourteen': '14',
  'fifteen': '15', 'sixteen': '16', 'seventeen': '17', 'eighteen': '18',
  'nineteen': '19', 'twenty': '20', 'twenty_one': '21', 'twenty_two': '22',
  'twenty_three': '23', 'twenty_four': '24', 'twenty_five': '25',
  'twenty_six': '26', 'twenty_seven': '27', 'twenty_eight': '28',
  'twenty_nine': '29', 'thirty': '30', 'thirty_one': '31', 'thirty_two': '32',
};
```

Field type inference:

```dart
FieldType inferFieldType(String name) {
  if (name.startsWith('title')) return FieldType.titles;
  if (name.startsWith('subtitle')) return FieldType.subtitles;
  if (name.startsWith('elmText') || name.startsWith('text')) return FieldType.texts;
  if (name.startsWith('ayahHadith') || name.startsWith('ayah')) return FieldType.ayahs;
  if (name.startsWith('footer')) return FieldType.footer;
  throw ArgumentError('Unknown field type: $name');
}
```

Field extraction regex:

```dart
final fieldRegex = RegExp(
  r'''(?:static\s+)?const\s+(?:String\s+)?(\w+)\s*=\s*"""\s*([\s\S]*?)\s*"""''',
);
```

Known typo map (normalize on parsing):

```dart
const typoMap = {
  'elmTextsFiveFive_1': 'elmTextFiveFive_1',
  'elmTextsFiveFive_2': 'elmTextFiveFive_2',
  'elmtTextTwentyEight_1': 'elmTextTwentyEight_1',
  'elmTextTwenteThirteen_3': 'elmTextTwentyThirteen_3',
  'ayahHadithTwentyOne1': 'ayahHadithTwentyOne_1',
  'ayahHdithFInalPageTen_3': 'ayahHadithFinalPageTen_3',
  'elmTextSeven_1': 'elmTextTwoSeven_1',
  'elmTextSeven_2': 'elmTextTwoSeven_2',
};
```

Fix `ElmTextFInal` → `ElmTextFinal` on the fly.

- [ ] **Implement `extractFields(String source) → List<ParsedField>`**
- [ ] **Test:** Run against `elm_text_ders_pre.dart` — extract 15 fields with correct types

### Task 1.2: Parser — Page Grouping

Page delimiter regex (handle all variants):

```dart
final pageDelimiter = RegExp(
  r'//\s*-*\s*[Pp]age\s+\d+|'   // // page N, // ---- Page N
  r'//\s*//\s*[Pp]age\s+\d+|'    // // // page N
  r'//\s*(?:Two|One|Three)\w*|'   // // TwoOne, // TwoTwo (section-based)
  r'//\s*//\s*\d+|'              // // // 5
  r'//\s*----\s*\w+\s+\d+',      // // ---- page 1
);
```

- [ ] **Implement `groupByPage(List<ParsedField>, String source) → List<List<ParsedField>>`**
  - Fields before first delimiter → page 1
  - Fields between delimiters → next page
  - No delimiters → all fields = one page
- [ ] **Test:** Run against `elm_text_ders_one.dart` (29 pages, `// page N`)
- [ ] **Test:** Run against `elm_text_ders_two.dart` (section-based `// TwoOne`)

### Task 1.3: Output Writer

- [ ] **Implement `generateElmList(...)`** that builds the output file as a string:
  ```dart
  String generateElmList({
    required String className,
    required String fileName,
    required List<List<ParsedField>> pages,
    required int? lessonNum,
    required bool isPre,
    required bool isFinal,
    required bool renameToKhatira,
  }) {
    final prefix = renameToKhatira ? 'khatira' : 'elm';
    final listName = isPre ? 'pre' : (isFinal ? 'final' : '$lessonNum');
    final varName = '${prefix}List${_toPascal(listName)}NewOrder';
    final textFile = '${prefix}_text_ders_${fileName}.dart';
    final modelFile = '${prefix}_model_new_order.dart';
    // ... build List<ElmModelNewOrder> with pages
  }
  ```
- [ ] Output format: one `ElmModelNewOrder` per page, fields ordered by appearance, `order` array matching field type sequence, `// page N` comment per entry
- [ ] **Test:** Generate from `elm_text_ders_pre.dart`, compare with `elm_list_pre_new_order.dart`

### Task 1.4: Main Loop — All 34 Files

- [ ] **Implement `main()`** with CLI argument parsing:
  ```dart
  void main(List<String> args) {
    final parser = ArgParser()
      ..addOption('input', help: 'Generate a single file')
      ..addFlag('dry-run', defaultsTo: false)
      ..addFlag('verbose', defaultsTo: false)
      ..addOption('rename-prefix', help: 'Rename prefix (e.g., khatira)')
      ..addFlag('fix-text', defaultsTo: false, help: 'Normalize static text');

    final result = parser.parse(args);
    // Loop over all 34 files in lib/core/data/static/text/
    // For each: extract fields → group by page → generate output → write
  }
  ```
- [ ] `--input` flag: single file mode
- [ ] `--dry-run` flag: print what would change, no writes
- [ ] `--verbose` flag: print parsed fields
- [ ] **Run:** `dart run tool/generate_elm_lists.dart --dry-run` — prints 34 files

### Task 1.5: Verify Against Originals

- [ ] Backup originals, generate all 34, diff character-by-character:
  ```bash
  cp -r lib/core/data/model/elm_lists lib/core/data/model/elm_lists_backup
  dart run tool/generate_elm_lists.dart
  diff -r lib/core/data/model/elm_lists lib/core/data/model/elm_lists_backup
  ```
- [ ] **Success criteria:** Zero diff across all 34 files
- [ ] Restore originals after verification:
  ```bash
  rm -rf lib/core/data/model/elm_lists && mv lib/core/data/model/elm_lists_backup lib/core/data/model/elm_lists
  ```

### Task 1.6: Commit

- [ ] Commit:
  ```bash
  git add tool/generate_elm_lists.dart
  git commit -m "feat(tool): add static text to elm list generator"
  ```

---

## MS-GEN-2: Rename `elm` → `khatira`

Branch: `refactor/rename-elm-to-khatira`

### Task 2.0: Create Branch

- [ ] Create branch:
  ```bash
  git checkout main && git pull origin main
  git checkout -b refactor/rename-elm-to-khatira
  ```

### Task 2.1: `--rename-prefix khatira` in Generator

- [ ] Update `generateElmList()` — when `renameToKhatira` is true, output uses `khatira*` naming
- [ ] Update main loop — when `--rename-prefix` is set, change output file paths
- [ ] **Test:** Run `--dry-run --rename-prefix khatira` — review output

### Task 2.2: Rename Static Text Files

- [ ] Run generator with `--rename-prefix khatira --fix-text` to rename:
  - 34 files: `elm_text_ders_{name}.dart` → `khatira_text_ders_{name}.dart`
  - Classes: `ElmTextDersOne` → `KhatiraTextDersOne`
  - Field prefixes: `elmTextOneOne_1` → `khatiraTextOneOne_1`

### Task 2.3: Generate Renamed Elm List Files

- [ ] Run generator with `--rename-prefix khatira`:
  - Produces files in `lib/core/data/model/khatira_lists/`
  - `khatira_list_1_new_order.dart`, `khatira_list_pre_new_order.dart`, etc.
- [ ] Delete old `lib/core/data/model/elm_lists/` directory

### Task 2.4: Rename Cubit Files

- [ ] Rename directory: `lib/cubit/elm_cubits/` → `lib/cubit/khatira_cubits/`
- [ ] Rename all 35 files (e.g., `elm_pre_cubit.dart` → `khatira_pre_cubit.dart`)
- [ ] Rename classes inside each file (e.g., `ElmPreCubit` → `KhatiraPreCubit`)

### Task 2.5: Update View Page Imports

- [ ] Scan `lib/view/pages/` — update all:
  - `elm_cubits/` → `khatira_cubits/`
  - `elm_lists/` → `khatira_lists/`
  - `elm_text_ders_` → `khatira_text_ders_`
  - `elm_model_new_order.dart` → `khatira_model_new_order.dart`
  - `ElmPreCubit()` → `KhatiraPreCubit()`

### Task 2.6: Rename Model

- [ ] Rename `elm_model_new_order.dart` → `khatira_model_new_order.dart`
- [ ] Rename `ElmModelNewOrder` → `KhatiraModelNewOrder` inside file
- [ ] `EnOrder` — keep unchanged (it's generic)
- [ ] Update all imports across codebase

### Task 2.7: `flutter analyze`

- [ ] Run `flutter analyze`
- [ ] Fix any remaining unresolved references
- [ ] **Success criteria:** Zero errors

### Task 2.8: `flutter test`

- [ ] Run `flutter test`
- [ ] Fix test imports/names
- [ ] **All tests pass**

### Task 2.9: Commit

- [ ] Commit:
  ```bash
  git add .
  git commit -m "refactor: rename elm prefix to khatira across codebase"
  ```

---

## MS-GEN-3: Normalizer, Tests & Polish

Same branch: `refactor/rename-elm-to-khatira`

### Task 3.1: `--fix-text` Mode

- [ ] Add `--fix-text` flag handling in main():
  - Normalize class names (missing `Ders`, `FInal` typo)
  - Normalize field names from `typoMap`
  - Add missing `static const String` annotations
  - Standardize page markers to `// page N`
  - Remove dead code (commented-out fields, developer notes)
- [ ] **Test:** Run `--fix-text --dry-run` — review changes

### Task 3.2: Unit Tests for Generator

**Create** `test/tool/generate_elm_lists_test.dart`:

- [ ] Test `inferFieldType()` — all 5 types
- [ ] Test `extractFields()` — standard, missing type annotations, known typos
- [ ] Test `groupByPage()` — each delimiter variant
- [ ] Test `generateElmList()` — output format matches expected

### Task 3.3: README

**Create** `tool/README.md`:

```markdown
# Khatira Generator

Generates khatira_list_* files from khatira_text_ders_* files.

## Usage

    dart run tool/generate_elm_lists.dart              # Generate all files
    dart run tool/generate_elm_lists.dart --dry-run     # Preview changes
    dart run tool/generate_elm_lists.dart --fix-text    # Normalize text files
```

- [ ] Write README
- [ ] Update AGENTS.md with the command

### Task 3.4: Final Verification

- [ ] Run:
  ```bash
  dart format .
  flutter analyze
  flutter test
  dart run tool/generate_elm_lists.dart --dry-run
  ```
- [ ] All pass

### Task 3.5: Commit

- [ ] Commit:
  ```bash
  git add .
  git commit -m "chore: add generator tests, normalizer, and docs"
  ```
