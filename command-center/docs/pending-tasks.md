# Pending Tasks — Not Yet Applied

**Current Branch:** `refactor/rename-elm-to-khatira`
**Generated:** 2026-05-31
**Overall Progress:** 6%

---

## Active Milestones — Still Work to Do

### MS-9: Data Files Standardization & Cleanup (Phase 3.5)
*Priority: P2-P3 | Planned: May 15-17 | **All todo***

| ID | Task | Priority | Depends On |
|----|------|----------|------------|
| MS-9.1 | Standardize class naming in 12 text files | P2 | — |
| MS-9.2 | Fix elm_lists naming/imports | P2 | MS-9.1 |
| MS-9.3 | Fix all field name typos (10 total) | P2 | MS-9.1 |
| MS-9.4 | Fix wrong header comments (5 list files + 4 more) | P3 | — |
| MS-9.5 | Clean dead code & dev artifacts | P2 | — |
| MS-9.6 | Add missing String type annotations (84 fields) | P3 | — |
| MS-9.7 | Standardize page comment markers (all text files) | P3 | — |
| MS-9.8 | Fix formatting edge cases (lists) | P3 | — |
| MS-9.9 | Verify build and analyze | P2 | MS-9.1 through MS-9.8 |

### MS-QF: Quranic Font Unification & Tashkeel Correction (Phase 3.5)
*Priority: P1 | Planned: May 11-14 | **5/6 done***

| ID | Task | Priority | Status |
|----|------|----------|--------|
| MS-QF.1 | Fix font infrastructure — AmiriQ mismatch | P1 | ✅ Done |
| MS-QF.2 | Tashkeel Batch 1 — ders 1-10 | P1 | ✅ Done |
| MS-QF.3 | Tashkeel Batch 2 — ders 11-20 | P1 | ✅ Done |
| MS-QF.4 | Tashkeel Batch 3 — ders 21-32 | P1 | ✅ Done |
| MS-QF.5 | Tashkeel Batch 4 — pre + final | P1 | ✅ Done |
| **MS-QF.6** | **Verify build and analyze** | **P1** | **⏳ Todo** |

### MS-3: Architecture Refactoring (Phase 3)
*Priority: P1-P2 | Planned: May 11-15 | **All todo***

| ID | Task | Priority | Depends On |
|----|------|----------|------------|
| MS-3.1 | Create ElmContentPage generic widget | P1 | — |
| MS-3.2 | Refactor 34 page files to use ElmContentPage | P1 | MS-3.1 |
| MS-3.3 | Extract Arabic strings to AppStrings constants | P2 | — |
| MS-3.4 | Separate search logic into SearchCubit | P2 | MS-3.1 |

### MS-8: Bug Fixes & Code Quality (Phase 3.5)
*Priority: P1-P3 | Planned: May 15-17 | **All todo***

| ID | Task | Priority | Depends On |
|----|------|----------|------------|
| MS-8.1 | Resolve 13 TODO/FIXME comments | P2 | — |
| MS-8.2 | Remove/consolidate dead helper files | P2 | — |
| MS-8.3 | Fix navigation helper redundancy | P2 | — |
| MS-8.4 | Re-enable temp-disabled search feature | P2 | — |
| MS-8.5 | Implement getShareText in HomeCubit | P2 | — |
| MS-8.6 | Move UI logic out of BasePageCubit | P3 | — |
| MS-8.7 | Split large static text files (19 >300 lines) | P2 | — |
| MS-8.8 | Split large elm list model files (17 >300 lines) | P2 | — |
| MS-8.9 | Split home.dart into reusable widget components | P2 | — |
| MS-8.10 | Verify build and analyze after all splits | P2 | — |
| MS-8.11 | Remove 5 dead/unreferenced files | P2 | MS-8.2 |
| MS-8.12 | Remove unused dependencies from pubspec.yaml | P2 | — |
| MS-8.13 | Add unit tests for critical untested code | P1 | MS-8.5 |
| MS-8.14 | Fix links.dart circular self-reference bug | P2 | MS-8.11 |
| MS-8.15 | Clean up dead route constants | P2 | MS-8.11 |
| MS-8.16 | Fix typo + document unreachable SearchPage widget | P3 | MS-8.11 |

### MS-GEN-3: Normalizer, Tests & Polish (Phase 3.5)
*Priority: P1-P3 | Planned: Jun 2-3 | **All todo***

| ID | Task | Priority | Depends On |
|----|------|----------|------------|
| MS-GEN-3.1 | `--fix-text` mode (static text normalizer) | P2 | — |
| MS-GEN-3.2 | Unit tests for Generator | P2 | — |
| MS-GEN-3.3 | README & Documentation | P3 | — |
| MS-GEN-3.4 | Final verification (format, analyze, test, dry-run) | P1 | MS-GEN-3.1, 3.2, 3.3 |
| MS-GEN-3.5 | Commit polish | P1 | MS-GEN-3.4 |

---

## Backlog — Not Yet Started

### MS-4: Performance & Caching (Phase 4, Week 20)
| ID | Task | Priority |
|----|------|----------|
| MS-4.1 | Precache background images on app start | P2 |
| MS-4.2 | Implement lazy loading for Elm lists | P2 |
| MS-4.3 | Optimize PageView configuration | P2 |

### MS-5: New Features (Phase 5, Week 20)
| ID | Task | Priority |
|----|------|----------|
| MS-5.1 | Create Bookmarking System | P2 |
| MS-5.2 | Implement Reading History | P2 |
| MS-5.3 | Implement Dark Mode | P3 |
| MS-5.4 | Add Last Position Restore | P3 |

### MS-6: Polish & Release (Phase 6, Week 21)
| ID | Task | Priority | Depends On |
|----|------|----------|------------|
| MS-6.1 | Add Accessibility (Semantics + tooltips) | P2 | — |
| MS-6.2 | Add Global Error Handling | P2 | — |
| MS-6.3 | Update Documentation | P2 | — |
| MS-6.4 | Version Preparation | P1 | — |
| MS-6.5 | Upload to Google Play | P1 | — |
| MS-6.6 | Distribute to Alternative App Stores | P2 | — |
| | | | *(depends on MS-3, MS-4, MS-5)* |

### MS-7: Extra Features (Phase 5, Week 21)
| ID | Task | Priority | Depends On |
|----|------|----------|------------|
| MS-7.7 | Table of Contents — visual grid with progress dots | P1 | — |
| MS-7.1 | Random Khatirah — daily dose button | P2 | — |
| MS-7.3 | Copy Text — SelectableText for copying | P2 | — |
| MS-7.2 | Personal Notes — long-press to add notes | P2 | — |
| MS-7.4 | Search History — save last 10 searches | P2 | — |
| MS-7.9 | Font Style Picker — multiple Arabic fonts | P2 | — |
| MS-7.5 | Daily Notification — push at user-set time | P2 | — |
| MS-7.10 | Export Bookmarks — save as .txt | P2 | MS-5.1 |
| MS-7.6 | Reading Goals — daily goal + streak | P3 | — |
| MS-7.8 | Multi-language UI — English/Arabic toggle | P3 | — |
| | | | *(depends on MS-5)* |

---

## Completed Milestones

| Milestone | Domain | Completed |
|-----------|--------|-----------|
| MS-1 | Code Cleanup | ✅ 2026-04-30 |
| MS-GEN-1 | Generator Core | ✅ 2026-05-30 |
| MS-GEN-2 | Rename elm → khatira | ✅ 2026-05-30 |
| MS-QF (5/6) | Quran Font & Tashkeel | ✅ (except MS-QF.6 verify) |

---

## Summary

| Status | Count |
|--------|-------|
| Active milestones with todo tasks | 5 (MS-9, MS-QF, MS-3, MS-8, MS-GEN-3) |
| Backlog milestones | 4 (MS-4, MS-5, MS-6, MS-7) |
| Completed milestones | 4 (MS-1, MS-GEN-1, MS-GEN-2, MS-QF partial) |
| **Total pending tasks** | **~55** |

### Recommended Next Steps
1. **MS-QF.6** — Quick win: verify build passes after tashkeel corrections
2. **MS-GEN-3** — Polish the generator (normalizer + tests + docs)
3. **MS-9** — Data file standardization (partially superseded by generator, but manual cleanup still needed)
4. **MS-3** — Architecture refactoring (biggest impact, but depends on rename being merged first)
5. **MS-8** — Bug fixes & code quality (deep audit findings ready to act on)
