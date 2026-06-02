# AGENTS.md — AI & Developer Guide

> **Project**: `khatira` (Flutter/Dart, Islamic education). Directory name `salam`. Tracked via `command-center/project-tracker.json`.

---

## 1. Project at a Glance

| | |
|---|---|
| **Stack** | Flutter / Dart, Bloc, SharePlus, ScreenUtil |
| **Package** | `com.khatir` (Android) |
| **Domain** | Islamic khatira (sermons/lessons) — 32 ders + pre + final = 34 chapters |
| **Data flow** | Static text files → generator → list models → pages |
| **Current focus (P1)** | **MS-3** Architecture Refactoring |
| **Overall progress** | 5 milestones done (MS-1, MS-9, MS-QF, MS-GEN-1, MS-GEN-2) |
| **Health** | On Track · Drift: 0 days · Target: 2026-06-15 |

---

## 2. AI Operating Rules (read first)

1. **Use skills** — Brainstorm before features, TDD for code, systematic-debugging for bugs. Check `~/.claude/skills/` and `.opencode/skills/`.
2. **Follow 5-phase protocol** — Think & Plan → Analyze Impact → Execute → Verify → Sync. See `command-center/docs/ai-rules.md`.
3. **Tracker is manual** — After completing a task, edit `command-center/project-tracker.json` (set `"status": "done"`). Git commits do NOT update the tracker.
4. **Verify before claiming done** — Run `flutter analyze` and `flutter test` before any completion assertion.
5. **Commit messages matter** — Imperative mood, clear context, future-wiki-friendly. See §11.

---

## 3. Critical Commands

### Build
```bash
# MUST use this flag — bypasses Gradle version warnings
flutter build apk --release --android-skip-build-dependency-validation
flutter build appbundle --release --android-skip-build-dependency-validation
```

### Test / Analyze / Format
```bash
flutter test                  # all tests
flutter analyze               # must be 0 app-level errors
dart format .                 # check formatting
```

### Generator (`tool/generate_elm_lists.dart`)
```bash
# Regenerate all 34 list files from text sources
dart run tool/generate_elm_lists.dart

# With khatira field prefix (post-rename, current default)
dart run tool/generate_elm_lists.dart --rename-prefix khatira

# Normalize text files in-place (class names, typos, types, page markers, dead code)
dart run tool/generate_elm_lists.dart --fix-text

# Generator unit tests (23 tests)
flutter test test/tool/generate_elm_lists_test.dart
```

### Command Center
```bash
export CC_ROOT=/media/islamux/Variety/Flutter_Projects/salam/command-center
alias cc="PROJECT_ROOT=$CC_ROOT node $CC_ROOT/packages/mcp/dist/cli.js"

cc get-project-status
cc list-tasks --status todo
cc start-task <id> --agent_id opencode
cc complete-task <id> "summary"
cc approve-task <id>          # operator only
```

> **Note**: The script is still named `generate_elm_lists.dart` for historical reasons — it generates `khatira_*` output files.

---

## 4. Architecture & Conventions

### State Management
All content pages extend **`BasePageCubit`** (`lib/cubit/base_cubit/`):
- `fontSize` (21.0–37.0, step 2.0)
- `currentPageIndex` / pagination
- `searchContent(query)` — searches titles, subtitles, texts, ayahs, footer
- `customShareContent()` — returns shareable text

### Data Model
```dart
// lib/core/data/model/khatira_model_new_order.dart
KhatiraModelNewOrder(
  titles: [...], subtitles: [...], texts: [...], ayahs: [...], footer: '...',
  order: [EnOrder.titles, EnOrder.subtitles, EnOrder.texts, EnOrder.ayahs, EnOrder.footer],
)
```

### Sharing
```dart
// ✅ Correct
SharePlus.instance.share(ShareParams(text: ...));
// ❌ Deprecated — do not use
Share.share(...);
```

### Key Dependencies
`flutter_bloc: ^9.0.0` · `share_plus: ^11.0.0` · `flutter_screenutil: ^5.9.0`

---

## 5. Project Structure (current)

```
lib/
  main.dart                                       - Entry: runApp(ElmApp())
  app_routes.dart                                 - Route generator
  core/
    data/
      static/text/khatira_text_ders_*.dart        - 34 text sources (1-32 + pre + final)
      model/
        khatira_model_new_order.dart              - Data model: KhatiraModelNewOrder
        enum_order.dart                           - EnOrder enum
        khatira_lists/                            - 34 generated list files
          khatira_list_1_new_order.dart
          ... (34 total)
  cubit/
    base_cubit/                                   - BasePageCubit (all pages extend this)
    khatira_cubits/                               - 35 page cubits (32 + pre + final + home)
      home_cubit.dart
      khatira_1_cubit.dart ... khatira_32_cubit.dart
      khatira_pre_cubit.dart
      khatira_final_cubit.dart
    share/get_page_text_for_sharing.dart
  helpers/share_app.dart
  view/pages/
    home.dart
    khatira1.dart ... khatira32.dart              - 34 content pages
    khatira_pre_page.dart
    khatira_final_page.dart

tool/
  generate_elm_lists.dart                         - Codegen (parses text → lists)
test/
  tool/generate_elm_lists_test.dart               - 23 generator tests
  unit/base_page_cubit_test.dart                  - BasePageCubit tests

command-center/                                   - MCP + TUI project tracker
  project-tracker.json                            - SINGLE SOURCE OF TRUTH
  AGENTS.md                                       - Tracker runbook
```

### Naming Conventions (enforced)
- **Files**: `khatira_*` (text, lists, cubits, pages) — `home_*` is the only exception
- **Classes**: `Khatira*` (e.g. `KhatiraModelNewOrder`, `KhatiraTextDersOne`)
- **Variables**: `khatiraText*`, `khatiraList*NewOrder`
- **Static text fields**: must use `static const String` annotations

---

## 6. Active Milestones & Priorities

### 🔴 P1 — MS-3 Architecture Refactoring (NEXT FOCUS)
- `MS-3.1` Create `ElmContentPage` generic widget
- `MS-3.2` Refactor 34 pages to use it (3,700 → ~300 lines)
- `MS-3.4` Extract `SearchCubit` (depends on 3.1)
- `MS-3.3` Extract Arabic strings to `AppStrings`

### 🟡 P2 — MS-8 Bug Fixes & Code Quality
Resolve: 13 TODO/FIXME, dead helpers, navigation redundancy, disabled search, `getShareText` stub, `links.dart` circular ref, dead route constants, `SearchPage` typo, file splits.

### 🟢 Tooling
- `MS-GEN-3` — Generator normalizer, tests, README polish (some already done in MS-GEN-2)
- `MS-GEN-4` — Strip `NewOrder` suffix from model + lists + generator

### ⏳ Backlog
- `MS-4` Performance (precache, lazy load, PageView)
- `MS-5` Core features (bookmarks, reading history, dark mode, last position)
- `MS-6` Release (depends on 3, 4, 5)
- `MS-7` Extra features (depends on 5)

---

## 7. Build & Test Gates

| Gate | Command | Required |
|---|---|---|
| Format | `dart format .` | clean (0 changed) |
| Analyze | `flutter analyze` | 0 app-level errors |
| Unit tests | `flutter test` | all pass |
| Generator | `dart run tool/generate_elm_lists.dart` | runs without error |
| Release build | `flutter build apk --release --android-skip-build-dependency-validation` | success |

---

## 8. DO / DO NOT

### DO
- Run `flutter analyze` and `flutter test` before claiming any task done
- Update `project-tracker.json` after completing any subtask
- Use `SharePlus.instance.share(ShareParams(...))` for sharing
- Use `KhatiraModelNewOrder` (not `ElmModelNewOrder`)
- Re-run the generator after editing text files
- Reference plans in `docs/` and `command-center/docs/plans/`

### DO NOT
- Edit generated files in `lib/core/data/model/khatira_lists/` by hand — regenerate instead
- Use `Share.share(...)` — deprecated
- Use `khatira_cubits/` content models with `ElmModelNewOrder` — renamed
- Commit without running gates (analyze + test)
- Skip `--android-skip-build-dependency-validation` on builds
- Add comments to code files unless asked
- Trust the tracker's `overall_progress` field — it is stale; recompute from `subtasks[].status`

---

## 9. Build Notes

- Gradle/SDK version warnings are normal — the `--android-skip-build-dependency-validation` flag is required
- First build after Gradle upgrade takes longer (downloading)
- 13 pre-existing tool-only analyze issues in `tool/` are known and acceptable

---

## 10. Reference Docs

- `docs/IMPROVEMENT_PLAN.md` — Master roadmap
- `docs/MS-8_BUG_FIXES_CODE_QUALITY_PLAN.md` — MS-8 audit
- `docs/MS-9_DATA_FILES_STANDARDIZATION_PLAN.md` — MS-9 plan
- `command-center/docs/plans/2026-05-30-khatira-generator.md` — Generator plan
- `command-center/AGENTS.md` — Tracker runbook (CLI, agent personas)
- `command-center/docs/ai-rules.md` — 5-phase AI protocol
- `PROJECT_STATUS_REVIEW.md` — Latest milestone analysis

---

## 11. Commit Message Style

```
<type>(<scope>): <imperative summary>

<optional body — context, why, trade-offs>
```

**Types**: `feat`, `fix`, `refactor`, `chore`, `docs`, `test`, `tool`  
**Examples**:
- `feat(tool): add --fix-text normalizer mode`
- `refactor(pages): extract ElmContentPage widget`
- `fix(links): resolve mailGoogle circular reference`

Good commit messages get auto-added to the personal wiki — be specific.
