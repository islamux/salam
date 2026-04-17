# Elm Project Improvement Plan

## Overview

This plan outlines a phased approach to improve code quality, architecture, performance, and user experience of the Elm Flutter application.

**Last Updated**: April 2026

---

## Phase 1: Code Cleanup (Quick Wins)
**Duration**: 1 day | **Priority**: High

### 1.1 Remove Dead Code
- [ ] Delete `lib/helpers/custom_share_content.dart` (unused file)
- [ ] Audit `to_delete_later/` directory and clean up

### 1.2 Consolidate Font Size Management
- [ ] Remove duplicate `fontSize` state from `FontCubit`
- [ ] Keep single source of truth in `BasePageCubit`
- [ ] Update all references

### 1.3 Clean Up Untracked Files
- [ ] Remove `@` file from project root
- [ ] Clean `to_delete_later/` directory

### 1.4 Update Documentation
- [ ] Sync `CLAUDE.md` with current project state
- [ ] Remove outdated references

**Verification**:
```bash
flutter analyze
flutter build apk
```

---

## Phase 2: Testing Infrastructure
**Duration**: 2 days | **Priority**: High

### 2.1 Unit Tests for Cubits
- [ ] Test `BasePageCubit.searchContent()`
- [ ] Test `BasePageCubit.customShareContent()`
- [ ] Test font size methods
- [ ] Test pagination logic

### 2.2 Unit Tests for Data Models
- [ ] Test `ElmModelNewOrder` construction
- [ ] Test `copyWith()` method
- [ ] Test field validations

### 2.3 Widget Tests
- [ ] Test `GenericCustomTextSlider`
- [ ] Test navigation between pages
- [ ] Test home page interactions

### 2.4 CI Setup
- [ ] Configure `flutter test --coverage`
- [ ] Add coverage reporting

**Verification**:
```bash
flutter test
flutter test --coverage
```

---

## Phase 3: Architecture Refactoring
**Duration**: 3 days | **Priority**: Medium

### 3.1 Generic Content Page Widget
**Current**: 27 near-identical `elm1.dart` - `elm27.dart` files

**Target**: Single reusable widget

```dart
// lib/view/pages/elm_content_page.dart
class ElmContentPage extends StatelessWidget {
  final BasePageCubit cubit;
  final List<ElmModelNewOrder> dataList;
  final String backgroundImagePath;
  
  const ElmContentPage({...});
}
```

**Tasks**:
- [ ] Create `ElmContentPage` generic widget
- [ ] Refactor `elm1.dart` - `elm27.dart` to use generic widget
- [ ] Reduce code from ~2700 lines to ~300 lines

### 3.2 Extract Arabic Strings
**Current**: Hardcoded Arabic text in widget files

**Target**: Centralized constants

```dart
// lib/core/data/static/strings/app_strings.dart
class AppStrings {
  static const String appName = 'تطبيق خواطر إيمانية';
  static const String homeTitle = 'الرئيسية';
  // ...
}
```

**Tasks**:
- [ ] Create `AppStrings` constant class
- [ ] Extract all UI text
- [ ] Prepare for future localization

### 3.3 Separate Search Logic
**Current**: `searchContent()` in `BasePageCubit`

**Target**: Dedicated `SearchCubit`

**Tasks**:
- [ ] Create `lib/cubit/search_cubit.dart`
- [ ] Move search logic from `BasePageCubit`
- [ ] Update search page to use new cubit

**Verification**:
```bash
flutter analyze
flutter build apk
flutter test
```

---

## Phase 4: Performance & Caching
**Duration**: 2 days | **Priority**: Medium

### 4.1 Image Caching
**Current**: Background images loaded each time

**Target**: Precache images on app start

```dart
// In main.dart
precacheImage(AssetImage('assets/images/91k.jpg'), context);
```

**Tasks**:
- [ ] Add `precacheImage` for background images
- [ ] Consider `cached_network_image` for future remote images

### 4.2 Lazy Load Elm Lists
**Current**: All 27 lists loaded at startup

**Target**: Load on-demand

**Tasks**:
- [ ] Implement lazy loading pattern
- [ ] Add loading states
- [ ] Test memory improvement

### 4.3 Optimize PageView
**Tasks**:
- [ ] Add `keepPage: true` to `PageController`
- [ ] Configure `pageSnapping` for smoother UX

**Verification**:
- [ ] Profile with DevTools
- [ ] Compare memory before/after

---

## Phase 5: New Features
**Duration**: 3 days | **Priority**: Low

### 5.1 Bookmarking System
**Tasks**:
- [ ] Create `BookmarkCubit`
- [ ] Add bookmark storage with `shared_preferences`
- [ ] Add bookmark icons to pages
- [ ] Create bookmarks list view

### 5.2 Reading History
**Tasks**:
- [ ] Track last read page per section
- [ ] Add "Continue Reading" on home screen
- [ ] Store in `shared_preferences`

### 5.3 Dark Mode
**Tasks**:
- [ ] Create `ThemeCubit`
- [ ] Implement dark theme colors
- [ ] Add theme toggle in settings
- [ ] Persist theme preference

### 5.4 Last Position Restore
**Tasks**:
- [ ] Save scroll position when leaving page
- [ ] Restore position when returning
- [ ] Use `shared_preferences`

**Verification**:
```bash
flutter analyze
flutter build apk --release
flutter test
```

---

## Phase 6: Polish & Release
**Duration**: 2 days | **Priority**: Medium

### 6.1 Accessibility
- [ ] Add `Semantics` widgets for screen readers
- [ ] Add meaningful `tooltip` properties
- [ ] Test with TalkBack/VoiceOver

### 6.2 Error Handling
- [ ] Add global error handler
- [ ] Create user-friendly error messages
- [ ] Add retry mechanisms

### 6.3 Documentation
- [ ] Update README.md
- [ ] Document architecture decisions
- [ ] Add inline code comments

### 6.4 Version Preparation
- [ ] Update `pubspec.yaml` version
- [ ] Update CHANGELOG
- [ ] Create release notes

**Final Verification**:
```bash
flutter analyze
flutter test --coverage
flutter build apk --release
flutter build appbundle --release
```

---

## Implementation Timeline

| Phase | Duration | Priority | Status |
|-------|----------|----------|--------|
| 1. Code Cleanup | 1 day | High | Pending |
| 2. Testing Infrastructure | 2 days | High | Pending |
| 3. Architecture Refactoring | 3 days | Medium | Pending |
| 4. Performance & Caching | 2 days | Medium | Pending |
| 5. New Features | 3 days | Low | Pending |
| 6. Polish & Release | 2 days | Medium | Pending |
| **Total** | **13 days** | | |

---

## Success Metrics

### Code Quality
- [ ] `flutter analyze` returns 0 issues
- [ ] Test coverage ≥ 70%
- [ ] No dead code
- [ ] Single source of truth for font size

### Performance
- [ ] App launch < 2 seconds
- [ ] Memory usage < 100MB
- [ ] Smooth 60fps scrolling

### User Experience
- [ ] All pages accessible via screen reader
- [ ] Dark mode available
- [ ] Bookmark feature working

---

## Notes

- Test on both high-end and low-end devices
- Keep commits atomic and descriptive
- Run `flutter analyze` after each phase
- Update this plan as phases complete