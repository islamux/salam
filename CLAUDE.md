# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter application called **elm** - a Muslim devotional app (Arabic: **تطبيق خواطر إيمانية**) that displays Islamic spiritual texts and quotations. The app features Arabic text support with custom fonts (Amiri and Cairo), and presents content across 27 numbered sections plus introductory and final pages.

**Current Flutter Version**: 3.35.1
**Dart Version**: 3.9.0
**State Management**: Flutter BLoC
**Current Branch**: `feat/project-improvements` (implementing improvement plan)

### Current Development Focus
The project is actively consolidating **elm_list** files to fix duplicate and split page entries:
- elm_list_17: ✅ COMPLETE (21 pages, variables renamed to match slider)
- elm_list_18: ✅ COMPLETE (40 pages, pages renumbered 1-40)
- elm_list_1 to elm_list_16, elm_list_19 to elm_list_27: PENDING AUDIT

## Common Commands

### Development
```bash
# Run the app on connected device/emulator
flutter run

# Run with specific device
flutter run -d <device-id>

# Hot reload (during development)
# Press 'r' in the terminal

# Hot restart
# Press 'R' in the terminal

# Run in debug mode
flutter run --debug

# Run in release mode
flutter run --release
```

### Building
```bash
# Build APK for Android (REQUIRED FLAG to bypass version warnings)
flutter build apk --release --android-skip-build-dependency-validation

# Build App Bundle for Android Play Store
flutter build appbundle --release --android-skip-build-dependency-validation

# Build for specific platform
flutter build apk --release --platform=android-arm64 --android-skip-build-dependency-validation

# Build iOS (requires macOS)
flutter build ios --release

# Build web
flutter build web
```

### Code Quality & Testing
```bash
# Analyze code for errors and warnings
flutter analyze

# Run tests
flutter test

# Run tests with coverage
flutter test --coverage

# Format code
dart format .
```

### Dependencies
```bash
# Get dependencies
flutter pub get

# Upgrade dependencies
flutter pub upgrade

# Clean build cache
flutter clean && flutter pub get
```

## Architecture

The app follows a **BLoC pattern** with clean separation of concerns:

### Directory Structure
```
lib/
├── main.dart                    # App entry point, configures BLoC providers
├── app_routes.dart             # Route definitions for all pages (27 content pages)
├── core/                       # Core functionality
│   ├── data/
│   │   ├── model/
│   │   │   ├── elm_model_new_order.dart    # Base data model
│   │   │   ├── enum_order.dart             # EnOrder enum for rendering sequence
│   │   │   └── elm_lists/                  # 27 data files (elm_list_1_new_order.dart
│   │   │                                     through elm_list_27_new_order.dart)
│   │   └── static/
│   │       ├── routes_constant.dart       # Route constants (all 27+ routes)
│   │       ├── theme/                     # App themes and colors
│   │       └── text/                      # Raw text data from ElmTextDers*.dart files
├── cubit/                      # BLoC state management
│   ├── base_cubit/
│   │   ├── base_page_cubit.dart           # Base BLoC with common page functionality
│   │   └── base_page_state.dart           # Base state definitions
│   ├── elm_cubits/
│   │   └── home_cubit.dart                # Home page BLoC
│   └── share/                             # Share functionality
├── view/                       # UI layer
│   ├── pages/
│   │   ├── home.dart                      # Main home page with navigation
│   │   ├── elm1.dart through elm27.dart   # Individual content pages (27 total)
│   │   ├── elm_pre_page.dart              # Intro/preparation page
│   │   ├── elm_final.dart                 # Final page
│   │   ├── search_page.dart               # Search functionality
│   │   ├── result_page.dart               # Search results page
│   │   └── target_page.dart               # Target/goal page
│   └── widget/                            # Reusable UI components
│       ├── custom_text_slider/            # Text slider component
│       └── home/                          # Home page widgets
├── helpers/                     # Utility functions
│   ├── extensions/                        # Dart extensions
│   └── search/                            # Search utilities

docs/                          # Project documentation
├── consolidation-plan.md        # Elm lists consolidation plan (Phase 1-2 in progress)
└── IMPROVEMENT_PLAN.md        # Overall project improvement plan
```

### Key Components

1. **State Management (BLoC)**: Located in `/lib/cubit/`, using `flutter_bloc: ^9.0.0`
   - `HomeCubit` extends `BasePageCubit` for home page state
   - `BasePageCubit`: Provides common page functionality (font size, pagination, search, sharing)
     - `fontSize` management (21.0 - 37.0 range)
     - `PageController` for horizontal navigation
     - `searchContent()`: Searches across titles, subtitles, texts, ayahs, and footer
     - `customShareContent()`: Shares page content using share_plus
   - Share functionality handled in `cubit/share/`

2. **Data Models**: `/lib/core/data/model/`
   - **ElmModelNewOrder**: Base data model
      - Fields: `titles?`, `subtitles?`, `texts?`, `ayahs?`, `footer?`, `order` (required)
      - `order`: List defining rendering sequence using `EnOrder` enum
      - Supports `copyWith()` method
   - **EnOrder enum**: Defines rendering order (titles, subtitles, texts, ayahs, footer)
   - Individual data files: `elm_list_1_new_order.dart` through `elm_list_27_new_order.dart`

3. **Navigation**: Centralized in `app_routes.dart`
   - Uses `RoutesConstant` from `core/data/static/routes_constant.dart`
   - Switch-based route generation (37 total routes defined)
   - Named routes for each content page (elm1-elm27, plus pre/final pages)
   - Routes: home, elmPre, elm1-elm27, elmFinal, aboutUs, resultPage, searchPage

4. **Theming**: `/lib/core/data/static/theme/`
   - `AppTheme.goldenTheme` set in main.dart
   - Custom text styles for different content types:
     - `customTextStyleTitle`: Black, bold
     - `customTextStyleSubtitle`: Black, bold
     - `customTextStyleHadith`: Purple (fromARGB 255, 96, 51, 180)
     - `customTextStyleFooter`: Grey, bold
   - Custom Arabic fonts: **Amiri** (Regular, Bold) and **Cairo** (Regular, Bold)
   - Color constants in `app_color_constant.dart`

5. **Dependencies** (from pubspec.yaml):
   - `flutter_bloc: ^9.0.0`: State management
   - `flutter_screenutil: ^5.9.0`: Responsive UI
   - `shared_preferences: ^2.0.18`: Local storage
   - `share_plus: ^11.0.0`: Share functionality (replaces deprecated flutter_share)
   - `intl: ^0.20.1`: Internationalization
   - `hex: ^0.2.0`: Hex color handling
   - `url_launcher: ^6.1.10`: URL launching
   - `flutter_launcher_icons: ^0.14.2`: Icon generation
   - **Custom fonts**: Amiri and Cairo (TTF format)

6. **Content Rendering Pattern**:
   - Each page uses `BasePageCubit` for state management
   - Content rendered using `PageView` with horizontal scrolling
   - `order` list in `ElmModelNewOrder` defines rendering sequence
   - Font size adjustable (21.0 - 37.0) via `increaseFontSize()` / `decreaseFontSize()`
   - Search functionality searches across all text fields

7. **Data Flow**:
   - Static Dart files → ElmTextDers*.dart (raw text constants)
   - ElmList*.dart → List<ElmModelNewOrder> (data models)
   - Pages → Load ElmList data → Render via PageView

## Testing

- Test file: `test/widget_test.dart` (currently empty - basic Flutter template)
- Run tests: `flutter test`
- Tests use `flutter_test` package (dev dependency)

## Platform Support

- **Android**: Primary target (build.gradle configured)
- **iOS**: Supported (ios/ directory present)
- **Web**: Supported (web/ directory present)
- **Desktop**: Linux, macOS, Windows directories present

## Assets

Located in `/assets/`:
- Images: JPG files for app UI
- Fonts: Arabic fonts (Amiri, Cairo) in TTF format
- Referenced in `pubspec.yaml` under `flutter.assets` and `flutter.fonts`

## Important Files to Know

### Core Data Files
- `lib/cubit/base_cubit/base_page_cubit.dart:68-89`: `searchContent()` - Built-in search functionality
- `lib/app_routes.dart:36-145`: Route generator - All 37 routes defined here

### Data Structure Example
```dart
ElmModelNewOrder(
  titles: ["Title Text"],
  texts: ["Text 1", "Text 2"],
  ayahs: ["Quran verse"],
  order: [EnOrder.titles, EnOrder.texts, EnOrder.ayahs]
)
```

## Development Guidelines

From project rules and current implementation:
- **Always create a phase-by-phase plan** before implementing changes
- Follow clean architecture with separation of concerns
- Use `BasePageCubit` for common page functionality (don't duplicate code)
- **Search**: Use `BasePageCubit.searchContent()` for consistent search behavior
- **Share**: Use `BasePageCubit.customShareContent()` for consistent sharing
- Keep responses simple while respecting best practices
- Ask clarifying questions when needed

## Current Status

**Branch**: `feat/project-improvements` (implementing improvement plan)

**Phases Complete**:
- Phase 1: Code cleanup - ✅
- Phase 2: Testing infrastructure - ✅ (12 unit tests for BasePageCubit)

**Known Issues**:
- Gradle/SDK version warnings when building. Use:
  ```bash
  flutter build apk --debug --android-skip-build-dependency-validation
  ```

**App Status**:
- ✅ No analysis errors
- ✅ 12 unit tests passing
- ✅ Running on all platforms
