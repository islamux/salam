# AGENTS.md — AI & Developer Guide

> **Project**: `khatira` (Flutter/Dart, Islamic education). Directory name `salam`. Tracked via `command-center/project-tracker.json`.

---

## 1. Project at a Glance

| | |
|---|---|
| **Stack** | Flutter / Dart, Bloc, SharePlus, ScreenUtil |
| **Package** | `com.khatir` (Android) |
| **Domain** | Islamic khatira (sermons/lessons) — 32 ders + pre + final = 34 chapters |
| **Data flow** | Static text files → generator → `KhatiraModelOrder` lists → `StaticKhatiraRepository` → `BasePageCubit` → `KhatiraContentPage` |
| **Current focus** | **MS-8** remaining bug fixes (11/14 done) |
| **Overall progress** | 45% — MS-3 ✅ · MS-AR ✅ · MS-GEN-4 ✅ · MS-DA 4/5 · MS-8 11/14 |
| **Health** | On Track · Drift: 0 days |

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
flutter test                  # 58 tests
flutter analyze               # 0 app-level errors
dart format .                 # check formatting
```

### Generator (`tool/generate_elm_lists.dart`)
```bash
# Regenerate all 34 list files from text sources
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
All content pages use **`BasePageCubit`** (`lib/core/cubit/base_cubit/`):
- `fontSize` (21.0–37.0, step 2.0)
- `currentPageIndex` / pagination
- `searchContent(query)` — searches titles, subtitles, texts, ayahs, footer
- `customShareContent()` — returns shareable text

### Data Model
```dart
// lib/core/data/model/khatira_model_order.dart
KhatiraModelOrder(
  titles: [...], subtitles: [...], texts: [...], ayahs: [...], footer: '...',
  order: [EnOrder.titles, EnOrder.subtitles, EnOrder.texts, EnOrder.ayahs, EnOrder.footer],
)
```
Equality uses `_listEquals` (deep comparison) — not identity-based list `==`.

### Repository Pattern
```dart
// lib/core/data/repository/khatira_repository.dart
abstract class KhatiraRepository {
  Future<List<KhatiraModelOrder>> getAll();
  Future<List<KhatiraModelOrder>> getById(int id);
  Future<List<KhatiraModelOrder>> getChapter(int chapterId);
  Future<List<KhatiraModelOrder>> search(String query);
}

// lib/core/data/repository/static_khatira_repository.dart
class StaticKhatiraRepository extends KhatiraRepository {
  // Wraps all 34 static list files in a single _chapters list
  // Provided via RepositoryProvider in main.dart
}
```

`BasePageCubit` takes `KhatiraRepository` + `int chapterId` via constructor, loads eagerly in `_loadChapter()`, emits `PageDataLoading` → `PageDataLoaded`.

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
  main.dart                                   - Entry: RepositoryProvider + MaterialApp
  app.dart                                    - App shell
  core/
    cubit/base_cubit/
      base_page_cubit.dart                    - Sole content cubit
      base_page_state.dart                    - PageDataLoading / PageDataLoaded
    data/
      model/
        khatira_model_order.dart              - Data model (KhatiraModelOrder)
        enum_order.dart                       - EnOrder enum
        khatira_lists/                        - 34 generated list files (_order.dart)
      repository/
        khatira_repository.dart               - Abstract interface
        static_khatira_repository.dart        - Concrete impl
      static/
        strings/app_strings.dart              - Centralized Arabic UI strings
        text/khatira_text_ders_*.dart         - 34 text sources (1-32 + pre + final)
    routing/
      routes_constant.dart                    - 35 route constants
      app_routes.dart                         - Route generator
    services/
      navigation_helper.dart                  - context.pushNamed extension
      handle_pop.dart                         - PopScope handler
      get_page_text_for_sharing.dart          - Sharing text builder
    theme/
      app_color_constant.dart
    widgets/
      custom_botton.dart                      - Reusable button widget
  features/
    khatira/presentation/
      khatira_content_page.dart               - Generic content page widget
      khatira1.dart ... khatira32.dart        - Chapter pages (each ~8 lines)
      khatira_pre_page.dart
      khatira_final_page.dart
    home/presentation/
      home.dart                               - Home page (197 lines)
      custom_drawer_listview.dart
    search/presentation/
      cubit/search_cubit.dart                 - SearchCubit + SearchState
      data_search.dart                        - DataSearch (SearchDelegate)
tool/
  generate_elm_lists.dart                     - Codegen (parses text → lists)
test/
  tool/generate_elm_lists_test.dart           - 23 generator tests
  unit/
    base_page_cubit_test.dart                 - 7 cubit tests
    khatira_model_order_test.dart             - 14 model tests
    get_page_text_for_sharing_test.dart       - 7 sharing tests
    search_cubit_test.dart                    - 6 search tests
command-center/                               - MCP + TUI project tracker
  project-tracker.json                        - SINGLE SOURCE OF TRUTH
  AGENTS.md                                   - Tracker runbook
```

### Naming Conventions (enforced)
- **Files**: `khatira_*` (text, lists, pages) — `home_*` is the only exception
- **Classes**: `Khatira*` (e.g. `KhatiraModelOrder`, `KhatiraTextDersOne`)
- **Variables**: `khatiraText*`, `khatiraList*Order` (no `NewOrder` suffix)
- **Static text fields**: must use `static const String` annotations

---

## 6. Milestones & Priorities

### ✅ Completed
| Milestone | Summary |
|-----------|---------|
| **MS-3** | Architecture refactoring: `KhatiraContentPage`, `AppStrings`, `SearchCubit`, cubit consolidation |
| **MS-AR** | Feature-first migration: `features/khatira/`, `features/home/`, `features/search/` |
| **MS-GEN-4** | Stripped `NewOrder` suffix from model + lists + generator |
| **MS-DA.1** | `KhatiraRepository` abstract interface + `StaticKhatiraRepository` |
| **MS-DA.4** | Wired `BasePageCubit` to repository (constructor injection, eager loading) |

### 🟡 P2 — MS-8 Remaining (3 tasks)
| ID | Task | Status |
|----|------|--------|
| MS-8.6 | Move UI logic out of `BasePageCubit` | todo (P3) |
| MS-8.7 | Split large static text files (19 >300 lines) | todo |
| MS-8.8 | Split large list model files (17 >300 lines) | todo |
| MS-8.10 | Verify build after all splits (blocked by 8.7+8.8) | blocked |
| MS-8.12 | Remove unused deps from `pubspec.yaml` | todo |

### ⏳ Backlog
- **MS-DA.5** — Deprecate static list files (depends on MS-DA.4)
- **MS-4** — Performance (precache, lazy load, PageView)
- **MS-5** — Core features (bookmarks, reading history, dark mode, last position)
- **MS-6** — Release
- **MS-7** — Extra features

---

## 7. Build & Test Gates

| Gate | Command | Required |
|---|---|---|
| Format | `dart format .` | clean (0 changed) |
| Analyze | `flutter analyze` | 0 app-level errors |
| Unit tests | `flutter test` | 58 pass (model 14 + sharing 7 + cubit 7 + search 6 + base 24) |
| Generator | `dart run tool/generate_elm_lists.dart` | runs without error |
| Release build | `flutter build apk --release --android-skip-build-dependency-validation` | success |

---

## 8. DO / DO NOT

### DO
- Run `flutter analyze` and `flutter test` before claiming any task done
- Update `project-tracker.json` after completing any subtask
- Use `SharePlus.instance.share(ShareParams(...))` for sharing
- Use `KhatiraModelOrder` (not `KhatiraModelNewOrder` or `ElmModelNewOrder`)
- Re-run the generator after editing text files
- Reference plans in `docs/` and `command-center/docs/plans/`

### DO NOT
- Edit generated files in `lib/core/data/model/khatira_lists/` by hand — regenerate instead
- Use `Share.share(...)` — deprecated
- Use `NewOrder` suffix anywhere — stripped in MS-GEN-4
- Skip `--android-skip-build-dependency-validation` on builds
- Add comments to code files unless asked
- Commit without running gates (analyze + test)
- Trust the tracker's `overall_progress` field — it is stale; recompute from `subtasks[].status`

---

## 9. Build Notes

- Gradle/SDK version warnings are normal — the `--android-skip-build-dependency-validation` flag is required
- First build after Gradle upgrade takes longer (downloading)
- 14 pre-existing tool-only analyze issues in `tool/` + `test/` are known and acceptable

---

## 10. Reference Docs

- `docs/IMPROVEMENT_PLAN.md` — Master roadmap
- `docs/MS-8_BUG_FIXES_CODE_QUALITY_PLAN.md` — MS-8 audit
- `docs/MS-9_DATA_FILES_STANDARDIZATION_PLAN.md` — MS-9 plan
- `docs/PROJECT_BLUEPRINT.md` — Architecture overview
- `docs/architecture-refactoring-status.md` — Architecture refactoring summary
- `docs/SEARCH_FUNCTIONALITY.md` — Search implementation
- `command-center/docs/plans/2026-05-30-khatira-generator.md` — Generator plan
- `command-center/AGENTS.md` — Tracker runbook (CLI, agent personas)
- `command-center/docs/ai-rules.md` — 5-phase AI protocol

---

## 11. Commit Message Style

```
<type>(<scope>): <imperative summary>

<optional body — context, why, trade-offs>
```

**Types**: `feat`, `fix`, `refactor`, `chore`, `docs`, `test`, `tool`  
**Examples**:
- `feat(tool): add --fix-text normalizer mode`
- `refactor(pages): extract KhatiraContentPage widget`
- `fix(model): use _listEquals for deep list comparison`
- `docs: update AGENTS.md and README for current state`

Good commit messages get auto-added to the personal wiki — be specific.
