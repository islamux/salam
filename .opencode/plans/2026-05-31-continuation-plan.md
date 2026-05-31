# Continuation Plan — Pending Tasks vs. Current State

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Reconcile pending-tasks.md with the current post-rename project state and sequence all remaining work.

**Architecture:** The `elm → khatira` rename (MS-GEN-2) was done at file/class/import level only — ~2865 field-level `elmText` variable references remain in 68 data files. The generator `--fix-text` normalizer must be built first to automate this, which then unlocks all downstream work.

**Tech Stack:** Flutter/Dart, generator at `tool/generate_elm_lists.dart`

---

## State Assessment: pending-tasks.md vs Reality

| Claimed in pending-tasks.md | Actual State |
|---|---|
| MS-GEN-2: rename complete | ❌ **Incomplete** — files/classes/imports renamed, but 34 text files still have `elmText*` field names (~1865 refs), and 34 list files still reference them (~1000 refs). |
| MS-9: all todo | ❌ **MS-9.1 is done** (class naming) — handled by MS-GEN-2. Remaining 8 tasks need re-evaluation. |
| MS-8: all todo | ✅ Still accurate, but MS-8.14 (links.dart bug) is moot if file gets deleted (MS-8.11). |
| MS-3: all todo | ✅ Still accurate. |
| MS-GEN-3: all todo | ✅ Still accurate, but now highest priority (enables field-level rename). |
| MS-QF: 5/6 done | ✅ **Now 6/6** — MS-QF.6 verified (A-5) |
| No mention of Android native code | ✅ **Fixed** — already `com.khatir` (verified A-1) |
| No mention of dead route constants | ✅ **Fixed** — 13 dead constants removed (A-3) |
| No mention of pubspec description | ✅ **Fixed** — now `description: khatir` (A-2) |
| No mention of stale tashkeel scripts | ✅ **Fixed** — 27 path references updated across 16 scripts (A-4) |

---

## Phase A: Quick Cleanup (can be done in any order)

Small, safe, no-code-impact changes.

### Task A-1: Fix Android native package name

**Files:**
- Modify: `android/app/src/main/AndroidManifest.xml`
- Modify: `android/app/src/main/kotlin/com/elm/MainActivity.kt`

- [x] **Step 1: Update AndroidManifest.xml** — already `com.khatir.MainActivity`
- [x] **Step 2: Move/rename MainActivity.kt** — already at `com/khatir/MainActivity.kt`
- [x] **Step 3: Verify** — `flutter analyze` passes

### Task A-2: Fix pubspec.yaml description

**File:** Modify: `pubspec.yaml`

- [x] **Step 1:** Change `description: elm` to `description: khatir`
- [x] **Step 2:** Verify `flutter pub get` succeeds

### Task A-3: Remove dead route constants

**Files:**
- Modify: `lib/core/data/static/routes_constant.dart`
- Verify: `lib/app_routes.dart` (ensure no switch cases reference removed constants)

- [x] **Step 1:** Remove `elm23`–`elm32`, `aboutUs`, `resultPage`, `searchPage` from `RoutesConstant`
- [x] **Step 2:** Verify `app_routes.dart` has no references to removed constants (it doesn't — they were already dead)
- [x] **Step 3:** Verify `flutter analyze` passes

### Task A-4: Update stale tashkeel script paths

**File:** Modify: `scripts/fix-tashkeel/` (16 Python scripts)

- [x] **Step 1: Quick path replacement** — 27 `elm_text_ders_` → `khatira_text_ders_` across 16 scripts
- [x] **Step 2: Verify** — zero remaining `elm_text_ders` references

### Task A-5: MS-QF.6 — Verify build after tashkeel

- [x] **Step 1:** `flutter analyze` — 11 issues (all in tool/, 0 in lib/)
- [x] **Step 2:** `flutter test` — 12/12 pass
- [x] **Step 3:** Mark MS-QF.6 as done in tracker

---

## Phase B: Generator Polish — The Critical Path (MS-GEN-3)

This phase is the **highest priority** because the `--fix-text` normalizer automates the field-level rename (~2865 references) that would otherwise be weeks of manual work.

### Task B-1: MS-GEN-3.1 — Build `--fix-text` mode in generator

**File:** Modify: `tool/generate_elm_lists.dart`

Add `--fix-text` flag that:
1. Renames field variable `elmText*` → `khatiraText*` in all 34 text files
2. Fixes class name typos (`FInal` → `Final`, missing `Ders` suffix)
3. Adds `static const String` annotations to 84 fields missing them (MS-9.6)
4. Standardizes `// page N` markers (MS-9.7)
5. Fixes field name typos from `typoMap` (MS-9.3)
6. Removes dead/commented-out code artifacts (MS-9.5)

- [ ] **Step 1: Design the fix-text subcommand interface**
  When `--fix-text` is set, the main loop writes text files back instead of generating list files.

- [ ] **Step 2: Implement field rename logic** — `elmText` → `khatiraText` in all 34 text files
  - Read `khatira_text_ders_*.dart`
  - Globally replace `elmText` with `khatiraText` in each file
  - Skip `elmText` in commented-out lines (though removing dead code is better)
  - Write updated content back (unless `--dry-run`)

- [ ] **Step 3: Add class name normalization** — detect `ElmTextDersSixteen` etc. → rename to `KhatiraTextDersSixteen` (should already be done, but add as safeguard)

- [ ] **Step 4: Add field type annotation fixer** — add `static const String` to fields that lack it
  ```dart
  // Before: const titleOneOne = """...""";
  // After:  static const String titleOneOne = """...""";
  ```
  Regex: find `const (\w+) = """` that lacks `static const String` prefix.

- [ ] **Step 5: Standardize page markers** — unify all `// page N` variants
  ```dart
  // Before: // ---- Page 1, // // page 1, // 1, // page one, // // 5
  // After:  // page 1, // page 2, etc.
  ```
  Use the existing `pageDelimiter` regex and label extraction.

- [ ] **Step 6: Apply typoMap fixes** to the text file source itself (not just during parsing)

- [ ] **Step 7: Remove dev artifacts** — strip:
  - `copilot gpt4.1` comments
  - `...existing code...` placeholder comments
  - Commented-out field definitions (lines starting with `//` containing field regex matches)

- [ ] **Step 8: Test `--fix-text --dry-run`** on all 34 files — run, verify output, ensure no corruption
  ```bash
  dart run tool/generate_elm_lists.dart --fix-text --dry-run --verbose
  ```

### Task B-2: Regenerate list files after field rename

After `--fix-text` rewrites text files with `khatiraText*` field names, regenerate list files.

- [ ] **Step 1: Run fix-text for real**
  ```bash
  dart run tool/generate_elm_lists.dart --fix-text
  ```

- [ ] **Step 2: Regenerate list files with new field names**
  ```bash
  dart run tool/generate_elm_lists.dart --rename-prefix khatira
  ```
  The generator will read the updated text files and output `khatira_list_*_new_order.dart` files referencing the new `khatiraText*` field names.

- [ ] **Step 3: Verify no field name references are broken**
  ```bash
  grep -r 'elmText' lib/core/data/ | head -20
  ```
  Expected: 0 remaining references.

### Task B-3: MS-GEN-3.2 — Unit tests for generator

**File:** Create: `test/tool/generate_elm_lists_test.dart`

- [ ] **Step 1: Write tests for `inferFieldType()`** — all 5 types + typos
  ```dart
  test('inferFieldType identifies titles', () {
    expect(inferFieldType('titleOneOne'), FieldType.titles);
  });
  test('inferFieldType identifies elmText fields', () {
    expect(inferFieldType('elmTextOneOne_1'), FieldType.texts);
  });
  test('inferFieldType identifies khatiraText fields', () {
    expect(inferFieldType('khatiraTextOneOne_1'), FieldType.texts);
  });
  test('inferFieldType identifies ayahHadith', () {
    expect(inferFieldType('ayahHadithOneTwo_1'), FieldType.ayahs);
  });
  test('inferFieldType identifies footer', () {
    expect(inferFieldType('footerOneOne'), FieldType.footer);
  });
  test('inferFieldType handles known typos', () {
    expect(inferFieldType('ayaHadithOneOne_1'), FieldType.ayahs);
    expect(inferFieldType('ayahaHadithOneOne_1'), FieldType.ayahs);
    expect(inferFieldType('ayahHdithOneOne_1'), FieldType.ayahs);
  });
  ```

- [ ] **Step 2: Write tests for `extractFields()`** — standard, missing types, typos, commented-out

- [ ] **Step 3: Write tests for `groupByPage()`** — each delimiter variant

- [ ] **Step 4: Write tests for `generateElmList()`** — output format matches expected

- [ ] **Step 5: Write tests for `wordToNum`** — all 34 mappings resolve correctly

- [ ] **Step 6: Run tests**
  ```bash
  flutter test test/tool/generate_elm_lists_test.dart -v
  ```

### Task B-4: MS-GEN-3.3 — README & Documentation

**Files:**
- Create: `tool/README.md`
- Modify: `AGENTS.md`

- [ ] **Step 1: Create `tool/README.md`** — purpose, usage, architecture, how to add a ders
- [ ] **Step 2: Update AGENTS.md** — add generator command reference

### Task B-5: MS-GEN-3.4 — Final Verification

- [ ] **Step 1:** `dart format .`
- [ ] **Step 2:** `flutter analyze` — 0 errors expected
- [ ] **Step 3:** `flutter test` — all pass expected
- [ ] **Step 4:** `dart run tool/generate_elm_lists.dart --dry-run --rename-prefix khatira`

### Task B-6: MS-GEN-3.5 — Commit

- [ ] `git add -A && git commit -m "feat(tool): add --fix-text normalizer, generator tests, docs"`
- [ ] Update `project-tracker.json` — mark MS-GEN-3 done

---

## Phase C: Remaining Data Standardization (MS-9 Remnants)

### Task C-1: MS-9.4 — Fix wrong header comments

**Files:** 5 list files (16, 17, 19, 20, 23) + 4 more (9, 11, 14, 15)

- [ ] **Step 1: Check current state** — after generator regeneration, verify all 34 list files have correct `// TextDersN` header
- [ ] **Step 2: Fix any mislabeled headers**

### Task C-2: MS-9.8 — Fix formatting edge cases

- [ ] **Step 1:** `dart format lib/core/data/model/khatira_lists/`

### Task C-3: MS-9.9 — Verify build and analyze

- [ ] **Step 1:** `flutter analyze` — 0 errors
- [ ] **Step 2:** `flutter test` — all pass
- [ ] **Step 3:** `flutter build apk --release --android-skip-build-dependency-validation`

---

## Phase D: Triage MS-9 (update tracker)

| Task | Status after Phase B | Action |
|------|---------------------|--------|
| MS-9.1 | ✅ Done — class naming by MS-GEN-2 | Mark done |
| MS-9.2 | ✅ Done — list naming by MS-GEN-2 + regeneration | Mark done |
| MS-9.3 | ✅ Done — field typos by `--fix-text` | Mark done |
| MS-9.5 | ✅ Done — dev artifacts by `--fix-text` | Mark done |
| MS-9.6 | ✅ Done — type annotations by `--fix-text` | Mark done |
| MS-9.7 | ✅ Done — page markers by `--fix-text` | Mark done |
| MS-9.4 | ⏳ Move to Phase C | Keep |
| MS-9.8 | ⏳ Move to Phase C | Keep |
| MS-9.9 | ⏳ Move to Phase C | Keep |

---

## Phase E: Architecture Refactoring (MS-3)

### Task E-1: MS-3.1 — Create `KhatiraContentPage` generic widget

**File:** Create: `lib/view/pages/khatira_content_page.dart`

Accept cubit, dataList, backgroundImagePath. Handle PageView, font size, share, search. StatelessWidget.

- [ ] **Step 1: Study one existing page** — distill shared pattern from `khatira1.dart`
- [ ] **Step 2: Create `KhatiraContentPage`**

### Task E-2: MS-3.2 — Refactor 34 page files

- [ ] **Step 1: Refactor one page** → delegate to `KhatiraContentPage`, verify
- [ ] **Step 2: Batch refactor remaining 33** → ~10 lines each
- [ ] **Step 3: Total reduction** ~3,700 → ~300 lines

### Task E-3: MS-3.3 — Extract Arabic strings to `AppStrings`

**File:** Create: `lib/core/data/static/strings/app_strings.dart`

- [ ] **Step 1: Scan and collect** all hardcoded Arabic UI strings
- [ ] **Step 2: Create `AppStrings`**, update all imports

### Task E-4: MS-3.4 — Separate search into `SearchCubit`

**Files:** Create `lib/cubit/search_cubit.dart`, modify `base_page_cubit.dart`, `search_page.dart`

- [ ] **Step 1: Create `SearchCubit`** — extract from `BasePageCubit`
- [ ] **Step 2: Remove search from `BasePageCubit`**
- [ ] **Step 3: Update search page**
- [ ] **Step 4: Verify** — `flutter analyze + test`

---

## Phase F: Bug Fixes & Code Quality (MS-8)

### Task F-1: MS-8.1 — Resolve 13 TODO/FIXME comments

- [ ] **Step 1:** `grep -rn 'TODO\|FIXME\|HACK' lib/ --include='*.dart'`
- [ ] **Step 2: Resolve each**

### Task F-2: MS-8.2 — Remove/consolidate dead helper files

- [ ] Delete `string_helper.dart`, `spacing.dart`, `media_query_helper.dart`

### Task F-3: MS-8.3 — Fix navigation helper redundancy

- [ ] Consolidate `navigation_helper.dart` + fix `home_cubit.dart` TODO

### Task F-4: MS-8.4 — Re-enable temp-disabled search feature

- [ ] Fix `search_page.dart:25`

### Task F-5: MS-8.5 — Implement `getShareText` in `HomeCubit`

- [ ] Replace TODO stub with real implementation

### Task F-6: MS-8.6 — Move UI logic out of `BasePageCubit`

- [ ] Audit and extract UI-related code

### Task F-7: MS-8.11 — Remove 5 dead files

- [ ] Delete: `links.dart`, `target_page.dart`, `result_page.dart`, `search_page.dart`, `share_app.dart`

### Task F-8: MS-8.12 — Remove unused dependencies

- [ ] Check `hex`, `intl`, `cupertino_icons`, `change_app_package_name` usage → remove if unused

### Task F-9: MS-8.13 — Unit tests for critical untested code

- [ ] `HomeCubit` tests (now MS-8.5 is done)
- [ ] `DataSearch` tests
- [ ] `KhatiraModelNewOrder` tests
- [ ] `getPageTextsForSharing` tests

### Task F-10: MS-8.14–MS-8.16

- [ ] Mark done (moot after Phase A + MS-8.11)

---

## Phase G: Backlog (MS-4, MS-5, MS-6, MS-7)

Not detailed — plan separately when Phases A–F complete.

| MS | Scope | Priority |
|----|-------|----------|
| MS-4 | Performance (precache, lazy load, PageView) | P2 |
| MS-5 | Features (bookmarks, history, dark mode, position) | P2 |
| MS-6 | Release (a11y, errors, docs, Play Store) | P1 |
| MS-7 | Extra (TOC, random, copy, notes, fonts, etc.) | P1–P3 |

---

## Execution Order

```
Phase A (Quick Cleanup)             ← 5 small tasks, any order
     ↓
Phase B (Generator Polish)          ← CRITICAL PATH — unlocks field rename
     ↓
Phase C (Data Standardization)      ← Easy MS-9 remnant work
     ↓
Phase D (Tracker Cleanup)           ← Administrative
     ↓
Phase E (Architecture Refactoring)  ← MS-3: biggest code reduction
     ↓
Phase F (Bug Fixes)                 ← MS-8: many small tasks
     ↓
Phase G (Backlog)                   ← Plan separately
```

**7 phases, ~35 tasks, 100+ files modified, ~10 new files.**

Key estimate: Phase B is the highest-impact — automates ~2865 renames. Phase E cuts ~3400 lines.
