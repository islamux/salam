# Release Audit Integration Plan

**Date:** 2026-06-02
**Source Audit:** `ReleasAudit.md`
**Source Tracker (old):** `command-center/project-tracker.json` (2140 lines, 13 milestones, no phases)
**New Tracker:** `command-center/project-tracker.json` (5 phases, 18 milestones, audit scores)
**Backup:** `command-center/project-tracker.backup-2026-06-02.json`

---

## 1. Why the Rebuild

The old tracker had grown organically into an inconsistent shape:

| Problem | Evidence |
|---|---|
| **No overarching structure** | 13 flat milestones (MS-3, MS-4, MS-5, MS-6, MS-7, MS-8, MS-9, MS-QF, MS-GEN-1, MS-GEN-2, MS-GEN-3, MS-GEN-4, MS-1) with no phase grouping |
| **Duplicated subtask IDs** | MS-9.4 and MS-9.5 appeared in BOTH MS-9 and MS-8 subtask arrays |
| **Stale progress field** | `overall_progress: 6` was wrong (real value: 39/90 = 43%) |
| **No audit coverage tracking** | 6 of 15 audit sections had no tasks at all |
| **Cryptic IDs** | MS-QF (Quranic Font), MS-GEN-1/2/3/4 (Generator) — meaning unclear from ID alone |
| **Mixed scope in MS-8** | 17 subtasks covering dead-code, splits, tests, and bug fixes — should be split |

The audit revealed 6 areas with **zero coverage** (Repository, Feature-First folders, Accessibility beyond Semantics, AppTheme, Android Release, Pubspec audit) and 5 with **partial coverage**.

---

## 2. New Structure — 5 Phases

| Phase | Title | Milestones | Audit Sections |
|---|---|---|---|
| **P1** | Architecture Refactor | MS-3, MS-8, MS-GEN-3, MS-GEN-4, **MS-AR**, **MS-DA** | §1, §2, §3, §4, §10, §14 |
| **P2** | Reader Experience | MS-5, **MS-RX**, **MS-TH** | §5, §7, §10 |
| **P3** | Search & Productivity | **MS-SX**, MS-7 | §6, §7 |
| **P4** | Quality & Testing | **MS-QT**, **MS-A11y**, **MS-PUB** | §9, §11, §14 |
| **P5** | Release Preparation | MS-6, **MS-REL**, **MS-PP**, MS-4 | §8, §12, §13 |

---

## 3. 12 NEW Milestones Added

### P1 — Architecture
| ID | Title | Audit § | Subtasks |
|---|---|---|---|
| **MS-AR** | Feature-First Folder Migration | §2 | AR.1 plan · AR.2 skeleton · AR.3 home · AR.4 khatira (34 pages) · AR.5 routes+verify |
| **MS-DA** | Data Layer / Repository | §4 | DA.1 interface · DA.2 JSON conversion · DA.3 StaticKhatiraRepository · DA.4 wire to cubit · DA.5 deprecate static |
| **MS-3.5** | ContentCubit Consolidation (subtask of MS-3) | §3, §4 | Replaces 35 chapter cubits with 1 ContentCubit + Repository |

### P2 — Reader Experience
| ID | Title | Audit § | Subtasks |
|---|---|---|---|
| **MS-RX** | Reader Experience Enhancements | §5 | RX.1 named font sizes · RX.2 sepia · RX.3 line height · RX.4 font picker · RX.5 distraction-free · RX.6 progress % |
| **MS-TH** | AppTheme Centralization | §10 | TH.1 AppTheme class · TH.2 dark+sepia palettes · TH.3 text styles · TH.4 MaterialApp integration |

### P3 — Search
| ID | Title | Audit § | Subtasks |
|---|---|---|---|
| **MS-SX** | Search UX Overhaul | §6 | SX.1 categories · SX.2 recent · SX.3 history · SX.4 bottom sheet · SX.5 wire cubit |

### P4 — Quality
| ID | Title | Audit § | Subtasks |
|---|---|---|---|
| **MS-QT** | Widget/Golden/Integration Tests | §11 | QT.1 widget · QT.2 golden · QT.3 integration · QT.4 repository tests |
| **MS-A11y** | Accessibility Audit | §9 | A11y.1 Semantics · A11y.2 Arabic screen reader · A11y.3 font scaling · A11y.4 WCAG contrast · A11y.5 TalkBack test |
| **MS-PUB** | Pubspec & SDK Audit | §14 | PUB.1 dep classification · PUB.2 remove unused · PUB.3 SDK upgrade plan · PUB.4 verify build |

### P5 — Release
| ID | Title | Audit § | Subtasks |
|---|---|---|---|
| **MS-REL** | Android Release Hardening | §13 | REL.1 signing · REL.2 R8/ProGuard · REL.3 AAB · REL.4 size opt · REL.5 Play assets |
| **MS-PP** | Privacy, About, Splash, Icon, Crashlytics | §12 | PP.1 privacy policy · PP.2 about · PP.3 icon · PP.4 splash · PP.5 Crashlytics · PP.6 offline guarantee · PP.7 analytics (skip) |

---

## 4. Audit Scores Dashboard

8-dimension scoring with current vs target (8.75/10 overall target):

```
architecture      6.5 → 9.0  ░░░░░▓▓▓▓▓  +2.5
maintainability   6.0 → 9.0  ░░░░░░▓▓▓▓  +3.0
scalability       5.0 → 9.0  ░░░░░░░░▓▓  +4.0
ui_ux             5.5 → 9.0  ░░░░░░▓▓▓▓  +3.5
performance       7.0 → 9.0  ░░░▓▓▓▓▓▓  +2.0
testing           4.0 → 9.0  ░░░░░░░░░▓  +5.0
accessibility     3.0 → 8.5  ░░░░░░░░░▓  +5.5
play_readiness    4.0 → 9.0  ░░░░░░░░░▓  +5.0
```

**Biggest gaps:** accessibility (5.5), play_readiness (5.0), testing (5.0) — addressed by P4 + P5.

---

## 5. Cleanup Actions on Existing Data

| Action | Reason |
|---|---|
| Moved MS-9, MS-QF, MS-GEN-1, MS-GEN-2 to `completed[]` | All subtasks done; reduces active list noise |
| Removed duplicate MS-9.4, MS-9.5 from inside MS-8 | Were in both MS-9 and MS-8 — now only in completed MS-9 |
| Marked MS-GEN-3.1 (`--fix-text`) and MS-GEN-3.2 (unit tests) as **done** | Both auto-completed during MS-GEN-2 field-rename (B-1, B-3) per tracker notes |
| Updated MS-3 → MS-3.5 added (ContentCubit consolidation) | Per audit §3 — collapse 35 cubits to 1 |
| Renamed files in context_files: `elm_*` → `khatira_*` | Post-rename consistency (MS-GEN-2) |
| Fixed `overall_progress: 6` → `43` | Recomputed from actual subtask statuses |
| Bumped `_schema_version: 1` → `2` | Document new fields (audit_scores, phases, is_new) |
| Merged MS-7.4 (Search History) into MS-SX.3 | Avoid duplication |
| Merged MS-7.9 (Font Picker) into MS-RX.4 | Avoid duplication |

---

## 6. Preserved Data (no loss)

- ✅ All 9 original `agent_log` entries
- ✅ All 14 original `history_log` entries (added 1 new for this rebuild = 15 total)
- ✅ All 1 original `milestones.completed` entry (MS-1) — added 4 more (MS-9, MS-QF, MS-GEN-1, MS-GEN-2)
- ✅ Backup at `project-tracker.backup-2026-06-02.json` if any rollback needed

---

## 7. Recommended Execution Order (post-rebuild)

```
P1 (NOW):
  ├─ MS-3.1, MS-3.2, MS-3.3, MS-3.4  (current plan, ContentPage extraction)
  ├─ MS-8.5, MS-8.13, MS-8.14, MS-8.15  (P1 quick wins)
  ├─ MS-DA.1                            (Repository interface — small, unblocks MS-3.5)
  ├─ MS-3.5                             (ContentCubit consolidation — biggest win)
  ├─ MS-AR.1, MS-AR.2, MS-AR.4          (Feature-first migration of khatira)
  ├─ MS-DA.2, MS-DA.3                   (JSON conversion + StaticKhatiraRepository)
  ├─ MS-DA.4, MS-DA.5                   (Wire cubit + deprecate lists)
  ├─ MS-GEN-3.3, MS-3.4, MS-3.5         (Docs + final verify)
  └─ MS-GEN-4.1–4.5                     (Strip NewOrder)

P2 (after P1):
  ├─ MS-TH.1–4                          (Theme system)
  ├─ MS-RX.1, MS-RX.5, MS-RX.6          (Quick UX wins)
  └─ MS-RX.2, MS-RX.3, MS-RX.4          (Theme-dependent)
  └─ MS-5.1, MS-5.2                     (Bookmarks + history)

P3:
  ├─ MS-SX.1–5
  └─ MS-7.x (selected high-value)

P4 (parallel to P3):
  ├─ MS-QT.1, MS-QT.4
  ├─ MS-A11y.1, A11y.2, A11y.3, A11y.4
  └─ MS-PUB.1, PUB.2, PUB.3

P5 (last):
  ├─ MS-PP.1, PP.2, PP.3, PP.4, PP.5
  ├─ MS-REL.1 (human: signing), REL.2, REL.3, REL.4, REL.5
  ├─ MS-4.1, MS-4.2, MS-4.3
  └─ MS-6.2, MS-6.3, MS-6.4, MS-6.5, MS-6.6
```

---

## 8. Risk Register

| Risk | Impact | Mitigation |
|---|---|---|
| Feature-first folder migration breaks build | High | MS-AR done in order, verify build after each step (AR.3 → AR.4 → AR.5) |
| ContentCubit consolidation loses per-chapter state | Medium | Repository pattern (MS-DA) preserves all data; BasePageCubit logic moved intact |
| Repository JSON conversion script bugs | Medium | 23 existing generator tests as template; add MS-QT.4 repository tests |
| Android signing credentials leaked | High | MS-REL.1 is `execution_mode: human`; key.properties gitignored |
| Firebase Crashlytics requires Google account | Low | Note in MS-PP.5 — may need human action to create project |
| Dart SDK upgrade breaks Flutter version | High | MS-PUB.3 is `execution_mode: human`; explicit compatibility audit step |
| MS-3.5 cubit explosion cleanup affects 35 files | Medium | Do MS-AR.4 (khatira folder migration) FIRST so the cubits are in feature folders before consolidating |

---

## 9. Acceptance Criteria — This Rebuild

- [x] JSON validates (`python3 -m json.tool`)
- [x] Backup file exists
- [x] All old milestones preserved (in active/backlog/completed)
- [x] All agent_log entries preserved
- [x] All history_log entries preserved
- [x] `dashboard.audit_scores` field added (8 dimensions)
- [x] 5 Phase containers created
- [x] 12 NEW milestones added with full subtask specs
- [x] `overall_progress` recomputed (6 → 43)
- [x] Schema version bumped to 2
- [x] Cubit consolidation (MS-3.5) added per audit
- [x] Single ContentCubit (not per-chapter) per audit §3

---

## 10. Files Changed

| File | Action |
|---|---|
| `command-center/project-tracker.json` | **REWRITTEN** with new structure |
| `command-center/project-tracker.backup-2026-06-02.json` | **CREATED** (backup of old) |
| `RELEASE_AUDIT_INTEGRATION_PLAN.md` | **CREATED** (this file) |

## 11. Files NOT Changed (yet — next steps)

- `AGENTS.md` — Should be updated next to reference new phase model + audit_scores field
- `PROJECT_STATUS_REVIEW.md` — Should be refreshed with new structure
- `docs/IMPROVEMENT_PLAN.md` — Could be cross-referenced with the 5 phases

---

**For your review.** If approved, next steps:
1. Update `AGENTS.md` to reference phases + audit_scores
2. Refresh `PROJECT_STATUS_REVIEW.md`
3. Begin executing P1 in the recommended order above
