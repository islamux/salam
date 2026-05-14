# Project Rename Plan: elm → khatir

## Overview

Rename the Flutter project from "elm" to "khatir" (matching the app's Arabic name: خواطر إيمانية).

---

## Files to Change

| File | Current | Change To |
|------|---------|-----------|
| `pubspec.yaml` | `name: elm` | `name: khatir` |
| `android/app/build.gradle` | `namespace "com.elm"` | `namespace "com.khatir"` |
| `android/app/build.gradle` | `applicationId "com.elm"` | `applicationId "com.khatir"` |

---

## What NOT to Change

These are code naming conventions (NOT app name):
- `ElmModelNewOrder` class
- `ElmContentPage` widget
- `elm_list_*_new_order.dart` files
- `Elm1Cubit`, `elm1.dart` files
- Routes like `/elm1`

---

## Steps to Execute

```bash
# Step 1: Change pubspec.yaml
name: khatir

# Step 2: Change android/app/build.gradle
namespace "com.khatir"
applicationId "com.khatir"

# Step 3: Clean and rebuild
flutter clean
flutter pub get
flutter build apk --debug --android-skip-build-dependency-validation
```

---

## Expected Result

| Item | Before | After |
|------|--------|-------|
| Package name | elm | khatir |
| Android App ID | com.elm | com.khatir |
| Display name | تطبيقات خواطر إيمانية | تطبيقات خواطر إيمانية |

---

## Notes

- The Arabic display name ("خواطر إيمانية") stays unchanged in UI
- Code files like `ElmModelNewOrder` are Flutter naming conventions - keep as-is
- After rename, Flutter will assign new package names to new installations
- Existing users won't be affected (they keep old package)
- New Play Store releases will use `com.khatir`

---

## Verification

```bash
flutter analyze
flutter build apk --debug --android-skip-build-dependency-validation
```

After build, check:
- `android/app/build.gradle` shows `com.khatir`
- `pubspec.yaml` shows `name: khatir`