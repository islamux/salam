# Elm Project Improvement Plan

## Overview

This plan outlines a phased approach to improve code quality, architecture, performance, and user experience of the Elm Flutter application.

**Last Updated**: June 20, 2026

---

## Phase 1: Code Cleanup (Quick Wins)
**Duration**: 1 day | **Priority**: High | **Status**: ✅ COMPLETE

### 1.1 Remove Dead Code
- [x] Delete `lib/helpers/custom_share_content.dart` (unused file)
- [x] Audit `to_delete_later/` directory and clean up

### 1.2 Consolidate Font Size Management
- [x] Remove duplicate `fontSize` state from `FontCubit`
- [x] Keep single source of truth in `BasePageCubit`
- [x] Update all references

### 1.3 Clean Up Untracked Files
- [x] Remove `@` file from project root
- [x] Clean `to_delete_later/` directory

### 1.4 Update Documentation
- [x] Sync `CLAUDE.md` with current project state
- [x] Remove outdated references

**Verification**:
```bash
flutter analyze
flutter build apk
```

---

## Phase 2: Testing Infrastructure
**Duration**: 2 days | **Priority**: High | **Status**: ✅ COMPLETE

### 2.1 Unit Tests for Cubits
- [x] Test `BasePageCubit.searchContent()` — covered by `search_cubit_test.dart`
- [x] Test `BasePageCubit.customShareContent()` — covered by `get_page_text_for_sharing_test.dart`
- [x] Test font size methods — 4 tests in `base_page_cubit_test.dart`
- [x] Test pagination logic — `goToPage` test in `base_page_cubit_test.dart`

### 2.2 Unit Tests for Data Models
- [x] Test `KhatiraModelOrder` construction — 14 tests in `khatira_model_order_test.dart`
- [x] Test `copyWith()` method
- [x] Test field validations
- [x] Model equality fixed: `_listEquals` deep comparison replaces identity check

### 2.3 Widget Tests
- [ ] Test `GenericCustomTextSlider` — deferred (MS-QT)
- [ ] Test navigation between pages — deferred (MS-QT)
- [ ] Test home page interactions — deferred (MS-QT)

### 2.4 CI Setup
- [ ] Configure `flutter test --coverage` — deferred
- [ ] Add coverage reporting — deferred

**Verification**:
```bash
flutter test   # 58 tests pass
```

---

## Phase 3: Architecture Refactoring
**Duration**: 3 days | **Priority**: Medium | **Status**: ✅ COMPLETE

### 3.1 Generic Content Page Widget
**Target achieved**: Single reusable `KhatiraContentPage` widget (`lib/features/khatira/presentation/`)
- All 34 pages refactored from ~3,700 lines to ~300 lines
- Per-chapter cubits consolidated into single `BasePageCubit`
- Repository pattern via `KhatiraRepository` + `StaticKhatiraRepository`

### 3.2 Extract Arabic Strings
**Target achieved**: `AppStrings` class created (`lib/core/data/static/strings/app_strings.dart`)
- All hardcoded UI text extracted from widgets
- Shared navigation labels, home UI, drawer items centralized

### 3.3 Separate Search Logic
**Target achieved**: `SearchCubit` + `SearchState` extracted (`lib/features/search/`)
- Search logic moved from `BasePageCubit` to dedicated `SearchCubit`
- `BasePageCubit.searchContent()` delegates internally to `SearchCubit`
- 6 unit tests cover initial state, matching (titles/texts/ayahs), empty query, no-match

### 3.4 Feature-First Migration
- Codebase restructured to `features/khatira/`, `features/home/`, `features/search/`
- 132 files changed across feature directories
- All 58 tests pass

**Verification**:
```bash
flutter analyze   # 0 app-level errors
flutter test      # 58 tests pass
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

### 6.5 Upload to Google Play
**Duration**: 1 day | **Priority**: High

#### Pre-requisites
- [ ] Google Play Developer Account ($25 one-time fee)
- [ ] App icon (512x512 PNG)
- [ ] Feature graphic (1024x500 PNG)
- [ ] Screenshots (3-5 phone images, 1080x1920 PNG each)

#### Build Release APK
```bash
# Clean and build release APK
flutter clean
flutter pub get
flutter build apk --release --android-skip-build-dependency-validation
# Output: build/app/outputs/flutter-apk/app-release.apk
```

#### Google Play Console Steps

**Step 1: Create App**
1. Go to https://play.google.com/console
2. Click "Create app"
3. Select "Android"
4. Fill:
   - App name: خواطر إيمانية (Khatir)
   - Default language: Arabic
   - App or game: App
   - Free or Paid: Free

**Step 2: App Listings**
| Field | What to Fill | Example |
|-------|-------------|---------|
| App title | Arabic name | خواطر إيمانية |
| Short description | 80 chars max | تطبيقات إسلامية للتقرب إلى الله |
| Full description | 4000 chars max | تطبيق يحتوي على الخواطر والمقالات الإسلامية... |
| App icon | 512x512 PNG | app_icon.png |
| Feature graphic | 1024x500 PNG | feature_graphic.png |
| Phone screenshots | 3-5 images | screenshot1.png, screenshot2.png... |

**Step 3: Content Rating**
1. Go to "Content rating"
2. Click "Get started"
3. Select "Islamic" content category
4. Answer all questions honestly
5. Get rating (usually "Everyone" or "6+")

**Step 4: Pricing & Distribution**
- Pricing: Free
- Countries: Select all available countries
- Enable "App in Amazon Appstore" if desired

**Step 5: App Releases**
1. Go to "App releases"
2. Click "Production" track
3. Click "Create release"
4. Upload APK: Drag `app-release.apk`
5. Release name: 1.0.0
6. Release notes (AR): إصدار inaugural

**Step 6: Review & Submit**
1. Click "Submit for review"
2. Wait 1-24 hours for approval
3. App goes live automatically

#### Common Issues & Fixes

| Issue | Fix |
|------|-----|
| APK too large | Enable R8 minification in build.gradle |
| Policy violation | Ensure content follows guidelines |
| Missing icons | Check all required sizes |
| Review rejected | Fix issues and resubmit |

---

### 6.6 Alternative App Stores

Since Google Play may not be available in all regions, consider these alternatives:

#### Aptoide (Recommended Alternative)
- **URL**: https://connect.aptoide.com
- **Cost**: Free developer account
- **Works in Yemen**: ✅ Yes
- **Requirements**:
  - Upload APK (not AAB - must use bundletool if converting)
  - Same signing key as Google Play (recommended)
  - App icon and screenshots

**Upload Steps**:
1. Create account at https://connect.aptoide.com
2. Click "Add App"
3. If on Google Play: enter package name
4. Upload app-release.apk (max 4GB)
5. Wait for review (usually fast)
6. Set release mode (Immediate/Manual)

#### Uptodown
- **URL**: https://en.uptodown.com/android/developers
- **Cost**: Free
- **Works in Yemen**: ✅ Yes
- **Notes**: Popular in Spanish-speaking countries

#### Amazon Appstore
- **URL**: https://developer.amazon.com
- **Cost**: Free
- **Works in Yemen**: ✅ Yes
- **Notes**: Can auto-import from Google Play

#### Samsung Galaxy Store
- **URL**: https://seller.samsung.com
- **Cost**: Free registration
- **Works in Yemen**: ✅ Yes
- **Notes**: For Samsung device users

#### Direct APK Distribution
- **Website**: Host APK on your own website
- **GitHub Releases**: Upload to GitHub repo releases
- **APKMirror**: Upload after Google Play approval

**Build for Alternative Stores**:
```bash
flutter build apk --release --android-skip-build-dependency-validation
# Note: Use APK, NOT appbundle (.aab) for Aptoide
```

#### Store Comparison

| Store | Countries | Cost | Works in Yemen |
|-------|-----------|------|----------------|
| Google Play | Global | $25 | ⚠️ Limited |
| Aptoide | Global | Free | ✅ Yes |
| Uptodown | Global | Free | ✅ Yes |
| Amazon | Global | Free | ✅ Yes |
| Samsung | Global | Free | ✅ Yes |
| Direct APK | Everywhere | Free | ✅ Yes |

**Final Verification**:
```bash
flutter analyze
flutter test --coverage
flutter build apk --release --android-skip-build-dependency-validation
flutter build appbundle --release --android-skip-build-dependency-validation
```

---

## Implementation Timeline

| Phase | Duration | Priority | Status |
|-------|----------|----------|--------|
| 1. Code Cleanup | 1 day | High | ✅ COMPLETE |
| 2. Testing Infrastructure | 2 days | High | ✅ COMPLETE |
| 3. Architecture Refactoring | 3 days | Medium | ✅ COMPLETE |
| 4. Performance & Caching | 2 days | Medium | ⏳ Pending |
| 5. New Features | 3 days | Low | ⏳ Pending |
| 6. Polish & Release | 2 days | Medium | ⏳ Pending |

---

## Known Issues & Solutions

### Gradle/SDK Version Warnings
**Problem**: Flutter warnings about outdated Gradle, AGP, Kotlin, and SDK versions when building.

**Solution**: Use `--android-skip-build-dependency-validation` flag to bypass version checks.

```bash
# Debug build
flutter build apk --debug --android-skip-build-dependency-validation

# Release build
flutter build apk --release --android-skip-build-dependency-validation

# App bundle (for Play Store)
flutter build appbundle --release --android-skip-build-dependency-validation
```

**Alternative**: Upgrade Gradle/AGP/Kotlin manually (takes time on first build).

### Manual Gradle Upgrade (Optional)
| File | Current | Recommended |
|------|---------|-------------|
| `gradle-wrapper.properties` | Gradle 8.6 | 8.10.2 |
| `settings.gradle` (AGP) | 8.4.0 | 8.7.0 |
| `settings.gradle` (Kotlin) | 2.0.21 | 2.1.0 |
| `app/build.gradle` | compileSdk 35 | 36 |

---

## Success Metrics

### Code Quality
- [x] `flutter analyze` returns 0 app-level errors (14 pre-existing tool-only issues)
- [x] 58 unit tests pass (model 14 + sharing 7 + cubit 7 + search 6 + base 24)
- [x] Dead code removed (4 dead helpers deleted)
- [x] Single source of truth: `BasePageCubit.fontSize` (21.0–37.0)
- [x] Model equality fixed: `_listEquals` deep comparison
- [ ] Test coverage ≥ 70% — requires widget tests (MS-QT)

### Performance
- [ ] App launch < 2 seconds
- [ ] Memory usage < 100MB
- [ ] Smooth 60fps scrolling

### User Experience
- [ ] All pages accessible via screen reader
- [ ] Dark mode available — pending (MS-5)
- [ ] Bookmark feature working — pending (MS-5)

---

## Notes

- Test on both high-end and low-end devices
- Keep commits atomic and descriptive
- Run `flutter analyze` after each phase
- Update this plan as phases complete