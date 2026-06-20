# Khatira — Flutter Islamic Education App Blueprint

**Last Updated:** June 20, 2026

---

## Overview

**Khatira** (package: `com.khatir`) is a Flutter application displaying 34 Islamic khatira (sermons/lessons) — 32 ders + pre + final = 34 chapters. Features native Arabic text support (Cairo font), BLoC state management, and Android deployment.

**Current Stack**
- Flutter: 3.35.1
- Dart: >=2.18.2 <3.0.0
- State Management: flutter_bloc ^9.0.0
- UI: flutter_screenutil ^5.9.0, CustomButton
- Sharing: share_plus ^11.0.0

---

## Project Structure

```
lib/
├── main.dart                           # Entry: RepositoryProvider + MaterialApp
├── app.dart                            # App shell with routes
├── core/
│   ├── cubit/
│   │   └── base_cubit/
│   │       ├── base_page_cubit.dart     # Sole content cubit (all 34 chapters)
│   │       └── base_page_state.dart     # PageDataLoading / PageDataLoaded
│   ├── data/
│   │   ├── model/
│   │   │   ├── khatira_model_order.dart # Data model: KhatiraModelOrder
│   │   │   ├── enum_order.dart          # EnOrder enum
│   │   │   └── khatira_lists/           # 34 generated list files (_order.dart)
│   │   ├── repository/
│   │   │   ├── khatira_repository.dart  # Abstract interface
│   │   │   └── static_khatira_repository.dart  # Concrete impl
│   │   └── static/
│   │       ├── strings/app_strings.dart # Centralized Arabic UI strings
│   │       └── text/                    # 34 text source files
│   ├── routing/
│   │   ├── routes_constant.dart         # 35 route constants
│   │   └── app_routes.dart              # Route generator
│   ├── services/
│   │   ├── navigation_helper.dart       # context.pushNamed extension
│   │   ├── handle_pop.dart             # PopScope handler
│   │   └── get_page_text_for_sharing.dart  # Sharing text builder
│   ├── theme/
│   │   └── app_color_constant.dart      # Color constants
│   └── widgets/
│       └── custom_botton.dart           # Reusable button widget
├── features/
│   ├── khatira/presentation/
│   │   ├── khatira_content_page.dart    # Generic content page widget
│   │   ├── khatira1.dart … khatira32.dart  # Chapter pages (each ~8 lines)
│   │   ├── khatira_pre_page.dart
│   │   └── khatira_final_page.dart
│   ├── home/presentation/
│   │   ├── home.dart                    # Home page (197 lines)
│   │   └── custom_drawer_listview.dart  # Drawer content
│   └── search/presentation/
│       ├── cubit/search_cubit.dart      # SearchCubit + SearchState
│       └── data_search.dart             # DataSearch (SearchDelegate)
tool/
└── generate_elm_lists.dart              # Codegen: text → lists
```

---

## Core Architecture

### State Management — Cubit Pattern

All content pages use `BasePageCubit` (concrete class):

```dart
class BasePageCubit extends Cubit<BasePageState> {
  BasePageCubit(this.repository, this.chapterId) : super(PageDataLoading()) {
    _loadChapter();
  }

  final KhatiraRepository repository;
  final int chapterId;  // 0=pre, 1-32=khatira, 33=final

  double fontSize;        // 21.0–37.0, step 2.0
  int currentPageIndex;
  void searchContent(String query);  // delegates to SearchCubit
  String customShareContent();       // returns shareable text
}
```

### Data Layer — Repository Pattern

```
KhatiraRepository (abstract interface)
  └─ StaticKhatiraRepository (concrete)
       └─ wraps 34 static list files in _chapters list
            getChapter(int chapterId) → List<KhatiraModelOrder>
```

Provided via `RepositoryProvider<KhatiraRepository>` in `main.dart`.

### Data Model

```dart
KhatiraModelOrder(
  List<String>? titles,
  List<String>? subtitles,
  List<String>? texts,
  List<String>? ayahs,
  String? footer,
  List<EnOrder> order,  // display order for fields
)
```

Equality uses `_listEquals` (deep comparison) — fixes identity-based list equality bug.

### Navigation

Centralized named routes in `RoutesConstant` + `app_routes.dart` generator. `KhatiraContentPage` receives `initialPage` via route arguments (`settings.arguments`).

```dart
context.pushNamed(RoutesConstant.khatira1, arguments: pageIndex);
```

---

## Dependencies

### Production
| Package | Version | Purpose |
|---------|---------|---------|
| flutter_bloc | ^9.0.0 | State management |
| flutter_screenutil | ^5.9.0 | Responsive UI |
| share_plus | ^11.0.0 | Native sharing |

### Development
| Package | Purpose |
|---------|---------|
| flutter_test | Unit testing (58 tests) |

---

## Development Workflow

### Daily Commands

```bash
flutter analyze                # 0 app-level errors expected
flutter test                   # 58 tests pass
dart format .                  # Check formatting
dart run tool/generate_elm_lists.dart --rename-prefix khatira  # Regenerate lists
```

### Build

```bash
# MUST use this flag — bypasses Gradle version warnings
flutter build apk --release --android-skip-build-dependency-validation
flutter build appbundle --release --android-skip-build-dependency-validation
```

---

## Code Standards

1. **State**: All content via `BasePageCubit` + `KhatiraRepository`. No per-chapter cubits.
2. **UI strings**: `AppStrings` class — never hardcode Arabic in widgets.
3. **Sharing**: `SharePlus.instance.share(ShareParams(text: …))` — not deprecated `Share.share`.
4. **Generated files**: Never edit `khatira_lists/*_order.dart` by hand — run the generator.
5. **Naming**: `khatira_*` for all files/classes/variables. No `elm_*` or `NewOrder` suffix.

---

## Tests

| Suite | Tests |
|-------|-------|
| `base_page_cubit_test.dart` | 7 |
| `khatira_model_order_test.dart` | 14 |
| `get_page_text_for_sharing_test.dart` | 7 |
| `search_cubit_test.dart` | 6 |
| `generate_elm_lists_test.dart` | 23 |
| **Total** | **58** |

---

## MS-8 Remaining Work

| ID | Task | Priority |
|----|------|----------|
| MS-8.6 | Move UI logic out of BasePageCubit | P3 |
| MS-8.7 | Split large text files (19 >300 lines) | P2 |
| MS-8.8 | Split large list files (17 >300 lines) | P2 |
| MS-8.10 | Final verify build (blocked by 8.7+8.8) | P2 |
| MS-8.12 | Remove unused deps from pubspec.yaml | P2 |

**MS-8 progress:** 11/14 subtasks complete.
