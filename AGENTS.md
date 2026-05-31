# AGENTS.md - Developer Guide

**Project**: `khatir` Flutter/Dart app (Islamic education) — directory name `salam`. Tracked via command-center.

## Critical Commands

### Flutter
```bash
# Build — MUST use flag to bypass Gradle version warnings
flutter build apk --release --android-skip-build-dependency-validation
flutter build appbundle --release --android-skip-build-dependency-validation

# Test, analyze, format
flutter test
flutter analyze
dart format .
```

### Infrastructure
```bash
# MCP server tests (150 tests)
cd command-center-mcp && pnpm test && pnpm build

# TUI dashboard
cd command-center-tui && PROJECT_ROOT=$PROJECT_ROOT pnpm dev
```

## Shared Patterns

**State Management**: All pages use `BasePageCubit` for:
- `fontSize` (21.0-37.0 range, step 2.0)
- `currentPageIndex` / pagination
- `searchContent(query)` — searches titles, subtitles, texts, ayahs, footer
- `customShareContent()` — shares page content

**Data Model**: `ElmModelNewOrder` (6 fields)
```dart
ElmModelNewOrder(
  titles: [...], subtitles: [...], texts: [...], ayahs: [...], footer: '...',
  order: [EnOrder.titles, EnOrder.subtitles, EnOrder.texts, EnOrder.ayahs, EnOrder.footer]
)
```

**Share**: Use `SharePlus.instance.share(ShareParams(text: ...))` — NOT `Share.share()`

**Key Dependencies**: `flutter_bloc: ^9.0.0`, `share_plus: ^11.0.0`, `flutter_screenutil: ^5.9.0`

## Project Structure

```
lib/
  main.dart                            - App entry (runApp ElmApp)
  app_routes.dart                      - Route generator
  core/data/model/elm_lists/           - 34 ElmList data files (1-32 + pre + final)
  core/data/model/elm_model_new_order.dart - Data model
  core/data/model/enum_order.dart      - EnOrder enum
  cubit/base_cubit/                    - BasePageCubit (all 32+ pages extend this)
  cubit/elm_cubits/                    - 35 page cubits (32 + pre + final + home)
  cubit/share/                         - get_page_text_for_sharing.dart
  helpers/                             - share_app.dart
  view/pages/elm*.dart                 - 34 content pages (elm1-32 + elmpre_page + elm_final)
```

## Git Flow

- **Commit messages**: Write clear, descriptive commit messages that other agents can easily understand. Use the imperative mood and include context about what changed and why. Good commit messages get automatically added to the personal wiki, so be specific enough for future reference without the diff.

## Build Notes

- Gradle/SDK version warnings are normal — use `--android-skip-build-dependency-validation`
- First build after Gradle upgrade takes longer (downloading)

## Command Center

Source of truth: `project-tracker.json` | Agents: **opencode**, **gemini-cli**

⚠️ **Tracker is manual** — After completing any subtask, update `command-center/project-tracker.json` (e.g. `"status": "done"`). Git commits do NOT auto-update the tracker.

```bash
export CC_ROOT=/media/islamux/Variety/Flutter_Projects/salam/command-center
alias cc="PROJECT_ROOT=$CC_ROOT node $CC_ROOT/packages/mcp/dist/cli.js"
```

| Category | Usage |
|----------|-------|
| **Status** | `cc get-project-status`, `cc list-tasks [--status X] [--milestone ID] [--domain X]` |
| **Task info** | `cc get-task-context <id>`, `cc get-task-summary <id>`, `cc get-task-history <id>` |
| **Lifecycle** | `cc start-task <id> [--agent_id X]`, `cc complete-task <id> "summary"`, `cc block-task <id> "reason"`, `cc unblock-task <id>` |
| **Lifecycle (operator)** | `cc approve-task <id>`, `cc reject-task <id> "feedback"`, `cc reset-task <id>` |
| **Update** | `cc update-task <id> [--priority P1] [--assignee X] [--notes X]`, `cc log-action <id> "action" "desc"` |
| **Enrich** | `cc enrich-task <id> --prompt "..." --acceptance_criteria "a,b" --context_files "f1,f2"` |
| **Milestones** | `cc create-milestone <id> "Title"`, `cc add-milestone-task <ms_id> "Label"`, `cc set-milestone-dates <ms_id>`, `cc update-drift <ms_id> <days>`, `cc add-milestone-note <ms_id> "note"` |
| **Agents** | `cc register-agent <id> "Name" orchestrator --permissions read,write`, `cc list-agents`, `cc get-activity-feed [--agent_id X]` |
| **TUI** | `cd command-center-tui && PROJECT_ROOT=$PROJECT_ROOT pnpm dev` — keys: `1-4` tabs, `q` quit, `r` refresh, `t` theme, `[` `]` milestones |

## Phases Complete (as of May 2026)

- Phase 1: Code cleanup ✅
- Phase 2: Testing infrastructure ✅
- Phase 3: Command Center MCP Server (24 tools, 150 tests) ✅
- Phase 4: TUI Dashboard shell + Task Board ✅

See `docs/IMPROVEMENT_PLAN.md` for full roadmap.
