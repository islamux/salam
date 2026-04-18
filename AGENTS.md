# AGENTS.md - Developer Guide

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
```

## Project Structure

- `lib/main.dart` - App entry point
- `lib/cubit/base_cubit/` - BasePageCubit (all 32+ pages extend this)
- `lib/core/data/model/elm_lists/` - 34 ElmList data files (1-32 + pre + final)
- `lib/view/pages/elm*.dart` - 34 content pages (elm1-elm32 + pre + final)

## Shared Patterns

**State Management**: All pages use `BasePageCubit` for:
- `fontSize` (21.0-37.0 range)
- `currentPageIndex` / pagination
- `searchContent()` - searches titles/texts/ayahs/footer
- `customShareContent()` - shares page content

**Data Model**: `ElmModelNewOrder`
```dart
ElmModelNewOrder(
  titles: [...],
  texts: [...],
  ayahs: [...],
  order: [EnOrder.titles, EnOrder.texts, EnOrder.ayahs]
)
```

**Share**: Use `SharePlus.instance.share(ShareParams(text: ...))` - NOT the deprecated `Share.share()`

## Build Notes

- Gradle/SDK version warnings are normal - use `--android-skip-build-dependency-validation`
- First build after Gradle upgrade takes longer (downloading)

## Phases Complete (as of April 2026)

- Phase 1: Code cleanup ✅
- Phase 2: Testing infrastructure ✅

See `docs/IMPROVEMENT_PLAN.md` for full roadmap.