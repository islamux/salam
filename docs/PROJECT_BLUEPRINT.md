# Elm - Flutter Devotional App Blueprint

## Overview

**Elm** is a Flutter application displaying Islamic spiritual texts across 27+ numbered sections. Features native Arabic text support (Amiri & Cairo fonts), BLoC state management, and multi-platform deployment.

**Current Stack**
- Flutter: 3.35.1
- Dart: 3.9.0
- State Management: Flutter BLoC
- UI: Custom widgets + flutter_screenutil

---

## Project Structure

```
lib/
├── main.dart                     # App entry point
├── app_routes.dart              # Route definitions
├── core/                        # Core functionality
│   ├── data/
│   │   ├── model/
│   │   │   ├── elm_model_new_order.dart
│   │   │   └── elm_lists/       # 27+ data files
│   │   └── static/
│   │       ├── routes_constant.dart
│   │       └── theme/           # App themes
├── cubit/                       # State management
│   ├── base_cubit/
│   ├── elm_cubits/
│   ├── font_cubit.dart
│   └── share/
├── view/                        # UI layer
│   ├── pages/                   # All app pages
│   └── widget/                  # Reusable components
└── helpers/                     # Utilities
```

---

## Core Architecture

### State Management (BLoC Pattern)

**Pattern**: Cubit-based state management extending `BasePageCubit`

```dart
// cubit/elm_cubits/home_cubit.dart
class HomeCubit extends BasePageCubit {
  // State logic here
}
```

**Benefits**:
- Separation of concerns
- Testable state logic
- Predictable state updates
- Built-in Flutter integration

### Data Layer

**Location**: `/lib/core/data/model/elm_lists/`

- 27+ individual data files
- Each file represents one content section
- Static data loaded at runtime
- Type-safe models

**Model Structure**:
```dart
// elm_model_new_order.dart
class ElmModelNewOrder {
  final int id;
  final String arabicText;
  final String translation;
  // Additional fields
}
```

### Navigation

**Implementation**: Centralized routes in `app_routes.dart`

```dart
// app_routes.dart
class RoutesConstant {
  static const String home = '/';
  static const String elm1 = '/elm1';
  // ... all routes
}

// Route generator
Route<dynamic> generateRoute(RouteSettings settings) {
  // Switch-based routing
}
```

**Benefits**:
- Single source of truth
- Easy to maintain
- Type-safe route names

### Theming

**Theme**: Golden theme configured in `main.dart`

```dart
// main.dart
MaterialApp(
  theme: AppTheme.goldenTheme,
  // ...
)
```

**Custom Fonts**:
- Arabic: Amiri (serif)
- UI: Cairo (sans-serif)
- Loaded via `pubspec.yaml`

---

## Dependencies

### Production Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_bloc` | Latest | State management |
| `flutter_screenutil` | Latest | Responsive UI |
| `shared_preferences` | Latest | Local storage |
| `share_plus` | Latest | Native sharing |
| `intl` | Latest | Internationalization |

### Development Dependencies

| Package | Purpose |
|---------|---------|
| `flutter_test` | Unit testing |
| `flutter_lints` | Code analysis |

**Philosophy**: Minimal dependencies, native Flutter solutions preferred.

---

## Development Workflow

### Prerequisites

- Flutter SDK 3.35.1+
- Dart SDK 3.9.0+
- Android Studio / VS Code
- Git

### Setup

```bash
# Clone and setup
git clone <repo>
cd salam

# Get dependencies
flutter pub get

# Run on device/emulator
flutter run
```

### Daily Commands

```bash
# Development
flutter run                    # Run with hot reload
flutter run --release          # Release mode

# Quality
flutter analyze                # Check errors/warnings
dart format .                  # Format code
flutter test                   # Run tests
flutter test --coverage        # Coverage report

# Building
flutter build apk --release    # Android APK
flutter build appbundle        # Play Store
flutter build ios --release    # iOS
flutter build web              # Web
```

### Code Standards

1. **State Management**
   - Use BLoC pattern for all state
   - Extend `BasePageCubit` for pages
   - Separate UI from business logic

2. **Widget Structure**
   - Keep widgets small and focused
   - Extract reusable components to `/widget/`
   - Use `const` constructors where possible

3. **Data Handling**
   - Static data in `/core/data/model/`
   - Model classes for type safety
   - Constants in `/core/data/static/`

4. **Navigation**
   - Use named routes
   - Centralize route definitions
   - Pass data via route arguments

---

## Key Components

### Base Cubit

```dart
// cubit/base_cubit/base_page_cubit.dart
abstract class BasePageCubit extends Cubit<BaseState> {
  BasePageCubit(super.initialState);

  // Common page functionality
}
```

### Font Management

```dart
// cubit/font_cubit.dart
class FontCubit extends Cubit<FontState> {
  // Font size and family management
}
```

### Custom Text Slider

```dart
// view/widget/custom_text_slider/
class CustomTextSlider extends StatelessWidget {
  // Reusable slider component
}
```

---

## Platform Support

| Platform | Status | Build Command |
|----------|--------|---------------|
| **Android** | Primary | `flutter build apk --release` |
| **iOS** | Supported | `flutter build ios --release` |
| **Web** | Supported | `flutter build web` |
| **Desktop** | Available | Platform-specific commands |

---

## Assets

**Location**: `/assets/`

- **Images**: JPG files for UI
- **Fonts**: Amiri.ttf, Cairo.ttf (Arabic support)
- **Referenced**: `pubspec.yaml` under `flutter.assets` and `flutter.fonts`

---

## Testing

### Test Structure

```
test/
└── widget_test.dart    # Currently empty (template)
```

### Testing Commands

```bash
# Run all tests
flutter test

# With coverage
flutter test --coverage

# Specific test file
flutter test test/unit/home_cubit_test.dart
```

### Best Practices

1. **Unit Tests**: Test cubit logic
2. **Widget Tests**: Test UI components
3. **Integration Tests**: Test user flows (optional)

---

## Performance Considerations

### Native Optimizations

1. **const Constructors**
   - Reduce widget rebuilds
   - Improve rendering performance

2. **Efficient Lists**
   - Use `ListView.builder` for long lists
   - Avoid rendering off-screen items

3. **Image Optimization**
   - Use appropriate image formats
   - Compress assets when possible

4. **State Management**
   - Minimize rebuilds with selective listening
   - Use `BlocBuilder` strategically

---

## Deployment

### Android (Play Store)

```bash
# Build App Bundle (recommended)
flutter build appbundle --release

# Or build APK
flutter build apk --release --split-per-abi
```

**Configuration**: `android/app/build.gradle`
- compileSdk: 35
- minSdk: 21
- targetSdk: 35

### iOS (App Store)

```bash
# Build for iOS (requires macOS)
flutter build ios --release

# Then use Xcode for App Store submission
```

### Web

```bash
flutter build web

# Deploy to Firebase Hosting, Vercel, or any static host
```

---

## Best Practices

### Architecture
1. **Single Responsibility**: Each class has one clear purpose
2. **Separation of Concerns**: UI, state, data layers distinct
3. **Dependency Injection**: Pass dependencies via constructors
4. **Error Handling**: Graceful error states in UI

### Code Quality
1. **Type Safety**: Strong typing throughout
2. **Null Safety**: Enable and respect null safety
3. **Consistent Naming**: Follow Dart conventions
4. **Documentation**: Comment complex logic

### Performance
1. **Minimize Widget Rebuilds**: Use `const`, `memoization`
2. **Efficient Data Loading**: Lazy loading where possible
3. **Optimize Images**: Proper formats and sizing
4. **Profiling**: Use Flutter Inspector regularly

---

## Troubleshooting

### Common Issues

**Build Errors**:
```bash
# Clean build cache
flutter clean && flutter pub get
```

**Dependency Issues**:
```bash
# Upgrade dependencies
flutter pub upgrade
```

**Hot Reload Not Working**:
- Check for syntax errors
- Restart Flutter daemon: `flutter restart`

**Font Not Loading**:
- Verify `pubspec.yaml` font configuration
- Check asset paths are correct
- Run `flutter packages get`

---

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Library](https://bloclibrary.dev/)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [Flutter Performance](https://docs.flutter.dev/perf)

---

## Next Steps

1. Explore existing code structure
2. Run `flutter analyze` to check current state
3. Review `/lib/cubit/` for state management patterns
4. Check `/lib/view/pages/` for UI implementation
5. Start with small improvements following this blueprint
