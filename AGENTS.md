# AGENTS.md - Developer Guide

**Dart package:** `khatir` (imports use `package:khatir/...`, directory name is `salam`)

## Critical Commands

```bash
# Build APK - MUST use flag to bypass Gradle version warnings
flutter build apk --release --android-skip-build-dependency-validation

# Build App Bundle (for Play Store)
flutter build appbundle --release --android-skip-build-dependency-validation

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
dart format .

# MCP server tests (150 tests)
cd command-center-mcp && pnpm test && pnpm build

# TUI dashboard
cd command-center-tui && PROJECT_ROOT=$PROJECT_ROOT pnpm dev
```

## Project Structure

```
lib/
  main.dart                          - App entry point (runApp ElmApp)
  app_routes.dart                    - Route generator
  core/data/model/elm_lists/         - 34 ElmList data files (1-32 + pre + final)
  core/data/model/elm_model_new_order.dart - Data model
  core/data/model/enum_order.dart    - EnOrder enum
  cubit/base_cubit/                  - BasePageCubit (all 32+ pages extend this)
  cubit/elm_cubits/                  - 35 page cubits (32 numbered + pre + final + home)
  cubit/share/                       - get_page_text_for_sharing.dart
  helpers/                           - share_app.dart
  view/pages/elm*.dart               - 34 content pages (elm1-32 + elmpre_page + elm_final)
```

## Shared Patterns

**State Management**: All pages use `BasePageCubit` for:
- `fontSize` (21.0-37.0 range, step 2.0)
- `currentPageIndex` / pagination
- `searchContent(query)` - searches titles, subtitles, texts, ayahs, footer
- `customShareContent()` - shares page content

**Data Model**: `ElmModelNewOrder` (6 fields)
```dart
ElmModelNewOrder(
  titles: [...],
  subtitles: [...],
  texts: [...],
  ayahs: [...],
  footer: '...',
  order: [EnOrder.titles, EnOrder.subtitles, EnOrder.texts, EnOrder.ayahs, EnOrder.footer]
)
```

**Share**: Use `SharePlus.instance.share(ShareParams(text: ...))` - NOT the deprecated `Share.share()`

**Key Dependencies**: `flutter_bloc: ^9.0.0`, `share_plus: ^11.0.0`, `flutter_screenutil: ^5.9.0`

## Command Center

Source of truth: `project-tracker.json` | Agents: **opencode**, **gemini-cli**

⚠️ **Tracker is manual** — After completing any subtask, update `command-center/project-tracker.json` (e.g. `"status": "done"`). Git commits do NOT auto-update the tracker.

```bash
export CC_ROOT=/media/islamux/Variety/Flutter_Projects/salam/command-center
alias cc="PROJECT_ROOT=$CC_ROOT node $CC_ROOT/packages/mcp/dist/cli.js"
```

### Read
| Command | Description |
|---------|-------------|
| `cc get-project-status` | Project overview |
| `cc list-tasks [--status todo\|in_progress\|review\|done\|blocked] [--milestone ID] [--domain X]` | List tasks with filters |
| `cc get-task-context <task_id>` | Full task context (~8K tokens) |
| `cc get-task-summary <task_id>` | Slim task summary |
| `cc get-milestone-overview <id>` | Milestone details + task list |
| `cc get-task-history <task_id>` | Task log entries |
| `cc list-agents` | Registered agents + status |
| `cc get-activity-feed [--agent_id X] [--limit N]` | Recent activity |

### Task Lifecycle
| Command | Description |
|---------|-------------|
| `cc start-task <id> [--agent_id X]` | todo → in_progress |
| `cc complete-task <id> "summary"` | in_progress → review |
| `cc approve-task <id> [--feedback "ok"]` | review → done (operator only) |
| `cc reject-task <id> "feedback"` | review → in_progress (operator only) |
| `cc reset-task <id>` | any → todo (operator only) |
| `cc block-task <id> "reason"` | any → blocked |
| `cc unblock-task <id> [--resolution "fixed"]` | blocked → todo/in_progress |
| `cc update-task <id> [--priority P1] [--assignee X] [--notes X]` | Update fields |
| `cc log-action <id> "action" "desc" [--tags a,b]` | Log custom action |

### Enrich
```bash
cc enrich-task <id> --prompt "..." --acceptance_criteria "a,b" --context_files "f1,f2"
```

### Milestones
| Command | Description |
|---------|-------------|
| `cc create-milestone <id> "Title" [--domain X] [--phase X] [--planned_start YYYY-MM-DD] [--planned_end YYYY-MM-DD]` | Create milestone |
| `cc add-milestone-task <ms_id> "Label" [--priority P1] [--execution_mode agent\|human\|pair]` | Add task |
| `cc add-milestone-note <ms_id> "note"` | Add exit criterion |
| `cc set-milestone-dates <ms_id> [--actual_start YYYY-MM-DD] [--actual_end YYYY-MM-DD]` | Set dates (auto-drift) |
| `cc update-drift <ms_id> <days>` | Manual drift (+behind / -ahead) |

### Agents
```bash
cc register-agent <id> "Name" orchestrator --permissions read,write [--color "#22c55e"]
```

### TUI Dashboard
```bash
cd command-center-tui && PROJECT_ROOT=$PROJECT_ROOT pnpm dev
```
Keys: `1-4` tabs | `q` quit | `r` refresh | `t` theme | `[` `]` milestones

## Build Notes

- Gradle/SDK version warnings are normal - use `--android-skip-build-dependency-validation`
- First build after Gradle upgrade takes longer (downloading)

## Phases Complete (as of May 2026)

- Phase 1: Code cleanup ✅
- Phase 2: Testing infrastructure ✅
- Phase 3: Command Center MCP Server (24 tools, 150 tests) ✅
- Phase 4: TUI Dashboard shell + Task Board ✅

See `docs/IMPROVEMENT_PLAN.md` for full roadmap.
