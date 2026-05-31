# Continuation Plan — Post-Phase-D State

> Session: 2026-05-31. 2 commits: `5befb46` (Phase A+B), `0061491` (Phase C+D).

**Current branch:** `refactor/rename-elm-to-khatira` | **Tracker:** MS-3 active, MS-9 done, MS-GEN-2 supplemented

---

## Completed (Phases A–D)

| Phase | What | Result |
|-------|------|--------|
| **A** | Quick Cleanup (5 tasks) | Android package, pubspec, dead routes, tashkeel scripts, MS-QF.6 verify |
| **B** | Generator Polish (6 tasks) | `--fix-text` mode, 34 list files regenerated, 23 unit tests, AGENTS.md updated |
| **C** | Data Standardization (3 tasks) | Headers/formats/verify — auto-resolved by Phase B |
| **D** | Tracker cleanup | MS-9 (9 subtasks) marked done, MS-3 set active |

**Current state:** 35/35 tests pass, 13 pre-existing tool-only analyze issues, 0 app errors.

---

## Remaining Phases

### Phase E: Architecture Refactoring (MS-3)

**Goal:** Reduce 34 near-identical page files → single reusable widget (~3,400 line reduction).

| Task | Scope |
|------|-------|
| **E-1: MS-3.1** | Create `KhatiraContentPage` generic `StatelessWidget` accepting cubit, dataList, backgroundImagePath |
| **E-2: MS-3.2** | Refactor 34 page files to use `KhatiraContentPage` (~3,700→~300 lines) |
| **E-3: MS-3.3** | Extract hardcoded Arabic UI strings to `AppStrings` constants |
| **E-4: MS-3.4** | Separate `searchContent` from `BasePageCubit` → `SearchCubit` |

### Phase F: Bug Fixes & Code Quality (MS-8)

| Task | Scope |
|------|-------|
| **F-1: MS-8.1** | Resolve 13 TODO/FIXME comments |
| **F-2: MS-8.2** | Remove/consolidate 3 dead helper files |
| **F-3: MS-8.3** | Fix navigation helper redundancy |
| **F-4: MS-8.4** | Re-enable temp-disabled search |
| **F-5: MS-8.5** | Implement `getShareText` in `HomeCubit` |
| **F-6: MS-8.6** | Move UI logic out of `BasePageCubit` |
| **F-7: MS-8.11** | Remove 5 dead files |
| **F-8: MS-8.12** | Remove unused dependencies |
| **F-9: MS-8.13** | Unit tests for `HomeCubit`, `DataSearch`, `KhatiraModelNewOrder`, share |
| **F-10: MS-8.14–16** | Mark done (moot after A + MS-8.11) |

### Phase G: Backlog (MS-4, MS-5, MS-6, MS-7)

Not detailed — plan separately when Phases E–F complete.

| MS | Scope | Priority |
|----|-------|----------|
| MS-4 | Performance (precache, lazy load, PageView) | P2 |
| MS-5 | Features (bookmarks, history, dark mode, position) | P2 |
| MS-6 | Release (a11y, errors, docs, Play Store) | P1 |
| MS-7 | Extra (TOC, random, copy, notes, fonts, etc.) | P1–P3 |

---

## State Assessment

| Area | Status |
|------|--------|
| `elmText` refs in `lib/core/data/` | **0** ✅ |
| `flutter analyze` app errors | **0** ✅ |
| `flutter test` | **35/35** ✅ |
| Data files (34 text + 34 list) | **Regenerated clean** ✅ |
| Generator `--fix-text` mode | **Built and run** ✅ |
| Generator unit tests | **23 tests** ✅ |
| MS-9 (Data Standardization) | **Done** ✅ |
| MS-QF (Quranic Font) | **Done (6/6)** ✅ |
| MS-GEN-1 (Generator build) | **Done** ✅ |
| MS-GEN-2 (Rename files/classes) | **Done (supplemented with field rename)** ✅ |
| MS-3 (Architecture) | **Not started** ⏳ |
| MS-8 (Bug Fixes) | **Not started** ⏳ |
