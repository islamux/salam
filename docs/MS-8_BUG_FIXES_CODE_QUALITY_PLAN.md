# MS-8: Bug Fixes & Code Quality Plan

**Branch:** `fix/bug-fixes-code-quality`
**Created:** 2026-05-15
**Last Updated:** 2026-06-20
**Domain:** code-quality
**Progress:** 11/14 subtasks complete

---

## Overview

Systematic cleanup of all technical debt, dead code, unused dependencies, TODO/FIXME comments, and test gaps discovered during a comprehensive codebase audit.

---

## Tasks

### Existing (from initial plan)

| ID | Task | Priority | Status | Completed |
|----|------|----------|--------|-----------|
| MS-8.1 | Resolve 13 TODO/FIXME comments across codebase | P2 | ✅ done | 2026-06-20 |
| MS-8.2 | Remove/consolidate 3 dead helper files | P2 | ✅ done | 2026-06-20 |
| MS-8.3 | Fix navigation helper redundancy | P2 | ✅ done | earlier |
| MS-8.4 | Re-enable temp-disabled search feature | P2 | ✅ done | earlier |
| MS-8.5 | Implement `getShareText` (was `UnimplementedError`) | P2 | ✅ done | 2026-06-20 |
| MS-8.6 | Move UI logic out of `BasePageCubit` | P3 | **⏳ todo** | — |
| MS-8.7 | Split large static text files (19 files >300 lines) | P2 | **⏳ todo** | — |
| MS-8.8 | Split large elm list model files (17 files >300 lines) | P2 | **⏳ todo** | — |
| MS-8.9 | Split `home.dart` into reusable widget components | P2 | ✅ done | 2026-06-20 |
| MS-8.10 | Verify build and analyze after all splits | P2 | ⏳ blocked (8.7+8.8) | — |

### New (from deep-dive audit)

| ID | Task | Priority | Status | Completed |
|----|------|----------|--------|-----------|
| MS-8.11 | Remove 5 dead/unreferenced files | P2 | ✅ done | 2026-05-31 |
| MS-8.12 | Remove unused dependencies from `pubspec.yaml` | P2 | ⏳ todo | — |
| MS-8.13 | Add unit tests for critical untested code | P1 | ✅ done | 2026-06-20 |
| MS-8.14 | Fix `links.dart` circular self-reference bug | P2 | ✅ done | 2026-06-20 |
| MS-8.15 | Clean up dead route constants | P2 | ✅ done | 2026-06-20 |
| MS-8.16 | Fix typo + document unreachable `SearchPage` | P3 | ✅ done | earlier |

---

## What Was Done

### MS-8.1 — TODOs resolved (7 of 13)
- Home share button wired to `SharePlus` (was using `share_plus` package)
- `search_page.dart` marked as dead code (unreachable — `DataSearch` delegate is the entry point)
- `navigation_helper.dart` comment removed (extension already minimal)
- `khatira_text_ders_twenty_one.dart` TODO → English comment
- 4 dead helper files deleted (see 8.2)

### MS-8.2 — 4 dead helpers deleted
- `string_helper.dart`, `spacing.dart`, `media_query_helper.dart`, `share_app.dart`

### MS-8.5 — Share button fix
- Home page share button now calls `SharePlus.instance.share(ShareParams(text: …))`
- No longer throws `UnimplementedError`

### MS-8.9 — home.dart split
- 385 → 197 lines (-49%)
- 34 near-identical `CustomButton` blocks → 1-line `btn()` helper calls
- All dead `context.read<HomeCubit>()` references removed

### MS-8.11 — Dead files removed
- `links.dart`, `target_page.dart`, `result_page.dart`, `search_page.dart`, `share_app.dart`

### MS-8.13 — 21 new unit tests
- `KhatiraModelOrder`: 14 tests (constructor, copyWith, equality, hashCode, toString)
- `getPageTextsForSharing`: 7 tests (order, field types, nulls, multi-page)
- Model `operator==` fixed: `_listEquals` deep comparison replaces identity-based `==`

### MS-8.14 — links.dart circular ref fixed
- `mailGoogle` no longer self-references (`fathi$mailGoogle` → correct URL)

### MS-8.15 — Dead route constants removed
- `aboutUs`, `resultPage`, `searchPage` removed from `RoutesConstant`
- Associated switch cases removed from route generator

---

## Remaining Work

### MS-8.6 — Move UI logic out of BasePageCubit (P3)
Audit `BasePageCubit` for UI-facing logic that belongs in the widget layer:
- Font size stepping logic (21.0–37.0, step 2.0) — debatable
- `customShareContent()` formatting — already in service layer
- `searchContent()` — already delegates to `SearchCubit`

### MS-8.7 — Split large static text files (P2)
19 files in `lib/core/data/static/text/` exceed 300 lines.
- Could split by logical sections within each ders
- Requires regenerating list files after text changes

### MS-8.8 — Split large list model files (P2)
17 files in `lib/core/data/model/khatira_lists/` exceed 300 lines.
- Depends on MS-8.7 (list files mirror text file structure)
- Update generator to support partial output

### MS-8.10 — Final verification (P2)
Blocked on MS-8.7 + MS-8.8 completion.

### MS-8.12 — Remove unused deps (P2)
Audit `pubspec.yaml`: `hex`, `intl`, `cupertino_icons`, `change_app_package_name`, `shared_preferences` may be declared but unused.

---

## Deep-Dive Audit Summary (archived)

### Codebase Stats (as of 2026-05-15)
- **Total lib/ files:** 168 (28,030 lines)
- **Test files:** 2 (114 lines) → now **5 files, 58 tests**
- **Test coverage:** ~1.2% → significantly improved
- **Analyzer issues:** 0 app-level
- **Dead files:** 8 (453 lines) — all removed
- **Duplicated code:** ~3,600 lines → ~300 lines (Phase 3 complete)

### Issues by Severity

🚨 **Critical (resolved):**
- `HomeCubit.getShareText()` — no longer throws `UnimplementedError` (cubit deleted, share via `BasePageCubit.customShareContent()`)
- `links.dart:3` — circular self-reference fixed

📁 **High (resolved):**
- 8 dead files → all removed

🧪 **Critical (resolved):**
- 21 new tests added; model equality bug fixed

🔁 **High (resolved via MS-3):**
- ~3,200 duplicated lines across 34 pages → single `KhatiraContentPage` widget
- ~400 lines in identical cubits → single `BasePageCubit`
