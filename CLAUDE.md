# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter application called **elm** - a Muslim devotional app that displays Islamic spiritual texts and quotations. The app features Arabic text support with custom fonts (Amiri and Cairo), and presents content across 27+ numbered sections plus introductory and final pages.

**Current Flutter Version**: 3.35.1
**Dart Version**: 3.9.0
**State Management**: Flutter BLoC

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
# Build APK for Android
flutter build apk --release

# Build App Bundle for Android Play Store
flutter build appbundle --release

# Build for specific platform
flutter build apk --release --platform=android-arm64

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
├── app_routes.dart             # Route definitions for all pages
├── core/                       # Core functionality
│   ├── data/
│   │   ├── model/
│   │   │   ├── elm_model_new_order.dart    # Base model structure
│   │   │   └── elm_lists/                  # 27+ data files (elm_list_1_new_order.dart through elm_list_27_new_order.dart, etc.)
│   │   └── static/
│   │       ├── routes_constant.dart        # Route constants
│   │       └── theme/                      # App themes
├── cubit/                      # BLoC state management
│   ├── base_cubit/
│   │   └── base_page_cubit.dart            # Base BLoC for page functionality
│   ├── elm_cubits/
│   │   └── home_cubit.dart                 # Home page BLoC
│   ├── font_cubit.dart                     # Font settings management
│   └── share/
├── view/                       # UI layer
│   ├── pages/
│   │   ├── home.dart                      # Main home page
│   │   ├── elm1.dart through elm27.dart   # Individual content pages
│   │   ├── elm_pre_page.dart              # Intro/preparation page
│   │   ├── elm_final.dart                 # Final page
│   │   ├── search_page.dart               # Search functionality
│   │   └── target_page.dart               # Target/goal page
│   └── widget/                   # Reusable UI components
│       ├── custom_text_slider/            # Text slider component
│       └── home/                          # Home page widgets
└── helpers/                     # Utility functions
    ├── extensions/                       # Dart extensions
    └── search/                           # Search utilities
```

### Key Components

1. **State Management (BLoC)**: Located in `/lib/cubit/`, using `flutter_bloc` package
   - `HomeCubit` extends `BasePageCubit` for home page state
   - `FontCubit` manages font settings
   - Share functionality handled in `cubit/share/`

2. **Data Models**: `/lib/core/data/model/`
   - `ElmModelNewOrder`: Base data model structure
   - Individual data files for each page content (27+ pages)
   - Static data stored as Dart files in `core/data/static/`

3. **Navigation**: Centralized in `app_routes.dart`
   - Uses `RoutesConstant` from `core/data/static/routes_constant.dart`
   - Simple switch-based route generation
   - Named routes for each content page (elm1-elm27)

4. **Theming**: `/lib/core/data/static/theme/`
   - `AppTheme.goldenTheme` set in main.dart
   - Custom Arabic fonts: Amiri and Cairo

5. **Dependencies** (from pubspec.yaml):
   - `flutter_bloc`: State management
   - `flutter_screenutil`: Responsive UI
   - `shared_preferences`: Local storage
   - `share_plus`: Share functionality
   - `intl`: Internationalization
   - Custom fonts: Amiri and Cairo

## Development Guidelines

From the project rules:
- Always create a phase-by-phase plan before implementing changes
- Generate only the markdown/documentation files, don't change existing code
- Use latest stable and community-supported libraries
- Prefer native solutions over third-party libraries
- Keep responses simple while respecting best practices
- Ask clarifying questions when needed

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

## Current Status

The project is on the `react-next-version` branch (switched from main), and the current focus is on text coloring based on README.md.
