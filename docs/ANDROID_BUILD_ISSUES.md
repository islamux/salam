# Android Build Issues

## Issue: App Closes Immediately on Launch (ClassNotFoundException)

### Symptom
Build succeeds, APK installs, but app crashes instantly:

```
java.lang.RuntimeException: Unable to instantiate activity ComponentInfo{com.khatir/com.khatir.MainActivity}:
java.lang.ClassNotFoundException: Didn't find class "com.khatir.MainActivity"
```

### Root Cause — Mismatch
The `AndroidManifest.xml` uses `.MainActivity` (shorthand for `com.khatir.MainActivity` based on the `namespace="com.khatir"` in `android/app/build.gradle`). But the `MainActivity.kt` file declares `package com.elm` — making the actual class `com.elm.MainActivity`.

```
Manifest expects: com.khatir.MainActivity  (from android:name=".MainActivity" + namespace=com.khatir)
Actual class:     com.elm.MainActivity    (from package com.elm in MainActivity.kt)
```

### Fix
Changed the manifest to use the full qualified class name:

**File:** `android/app/src/main/AndroidManifest.xml`

```diff
- <activity android:name=".MainActivity" ...>
+ <activity android:name="com.elm.MainActivity" ...>
```

### Alternative Fix (not used)
Move `MainActivity.kt` from `kotlin/com/elm/` to `kotlin/com/khatir/` and change its package to `com.khatir`. Either approach works — the key is consistency between the manifest and the actual class package.

---

## KGP Warning (No Fix Yet)

```
WARNING: Your app uses the following plugins that apply Kotlin Gradle Plugin (KGP):
share_plus, shared_preferences_android
```

This is a **warning, not an error**. The build succeeds and the app runs normally. It will become a hard error in a future Flutter version. To suppress it, upgrade both plugins to versions that have migrated to Built-in Kotlin.

**Current versions:**
| Package | Version | Latest Available |
|---------|---------|-----------------|
| `share_plus` | 11.1.0 | 13.1.0 |
| `shared_preferences_android` | 2.4.23 | 2.4.23 |

`shared_preferences_android` is already at the latest. `share_plus` has 13.1.0 available but needs the pubspec constraint bumped from `^11.0.0` to `^13.0.0` — may require API changes.

### Build Command (Skips Gradle Validation Warnings)
```bash
flutter build apk --release --android-skip-build-dependency-validation
flutter build appbundle --release --android-skip-build-dependency-validation
```
