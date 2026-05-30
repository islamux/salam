# MS-8: Bug Fixes & Code Quality Plan

**Branch:** `fix/bug-fixes-code-quality`
**Created:** 2026-05-15
**Domain:** code-quality
**Week:** 19 | **Phase:** 3.5
**Planned:** 2026-05-15 → 2026-05-17

---

## Overview

Systematic cleanup of all technical debt, dead code, unused dependencies, TODO/FIXME comments, and test gaps discovered during a comprehensive codebase audit.

---

## Tasks

### Existing (from initial plan)

| ID | Task | Priority | Status |
|----|------|----------|--------|
| MS-8.1 | Resolve 13 TODO/FIXME comments across codebase | P2 | todo |
| MS-8.2 | Remove/consolidate 3 dead helper files (`string_helper.dart`, `spacing.dart`, `media_query_helper.dart`) | P2 | todo |
| MS-8.3 | Fix navigation helper redundancy | P2 | todo |
| MS-8.4 | Re-enable temp-disabled search feature | P2 | todo |
| MS-8.5 | Implement `getShareText` in HomeCubit (currently throws `UnimplementedError` — **crash risk**) | P2 | todo |
| MS-8.6 | Move UI logic out of `BasePageCubit` | P3 | todo |
| MS-8.7 | Split large static text files (19 files >300 lines) | P2 | todo |
| MS-8.8 | Split large elm list model files (17 files >300 lines) | P2 | todo |
| MS-8.9 | Split `home.dart` into reusable widget components | P2 | todo |
| MS-8.10 | Verify build and analyze after all splits | P2 | todo |

### New (from deep-dive audit)

| ID | Task | Priority | Status | Detail |
|----|------|----------|--------|--------|
| MS-8.11 | Remove 5 remaining dead/unreferenced files | P2 | todo | `links.dart`, `target_page.dart`, `result_page.dart`, `search_page.dart`, `share_app.dart` |
| MS-8.12 | Remove 3-5 unused dependencies from `pubspec.yaml` | P2 | todo | `hex`, `intl`, `cupertino_icons`, `change_app_package_name`, `shared_preferences` (declared but unused) |
| MS-8.13 | Add unit tests for critical untested code | P1 | todo | `HomeCubit`, `DataSearch`, `ElmModelNewOrder` data model, `getPageTextsForSharing` |
| MS-8.14 | Fix `links.dart` circular self-reference bug | P2 | todo | `mailGoogle` initializes to `'fathi$mailGoogle'` — would crash at runtime |
| MS-8.15 | Clean up dead route constants | P2 | todo | `aboutUs`, `resultPage`, `searchPage` in `RoutesConstant` defined but never used |
| MS-8.16 | Fix typo + document unreachable `SearchPage` | P3 | todo | "temprorly" → "temporarily"; standalone `SearchPage` widget is unreachable (search uses `DataSearch` delegate) |

---

## Deep-Dive Audit Summary

### Codebase Stats
- **Total lib/ files:** 168 (28,030 lines)
- **Test files:** 2 (114 lines)
- **Test coverage:** ~1.2% (166/168 files untested)
- **Analyzer issues:** 0
- **Dead files:** 8 (453 lines)
- **Unused dependencies:** 3-5 packages
- **Duplicated code:** ~3,600 lines (pages + cubits + routes)

### Issues by Severity

🚨 **Critical (crash risk):**
- `HomeCubit.getShareText()` throws `UnimplementedError` — uncovered share action = crash
- `links.dart:3` — `mailGoogle` circular self-reference

📁 **High (dead code, 453 lines to remove):**
- 8 files never imported: `share_app.dart`, `spacing.dart`, `string_helper.dart`, `media_query_helper.dart`, `links.dart`, `target_page.dart`, `result_page.dart`, `search_page.dart`

📦 **High (build/maintenance):**
- 3-5 unnecessary dependencies slowing `pub get`

🧪 **Critical (quality):**
- Near-zero test coverage — every refactor is blind

🔁 **High (maintenance burden):**
- ~3,200 lines duplicated across 34 elm pages (MS-3 covers this)
- ~400 lines in 34 identical cubits (MS-3 covers this)
- ~340 lines in route boilerplate

### Audit Methodology
- Static analysis: `dart analyze lib/` (0 issues)
- Import graph tracing for dead file detection
- Cross-reference: `pubspec.yaml` deps vs. actual imports
- Manual review of all 168 `.dart` files
- File size analysis with >300 line threshold
