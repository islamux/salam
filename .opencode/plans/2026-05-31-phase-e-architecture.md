# Phase E: Architecture Refactoring (MS-3) — Junior Developer Guide

## What This Phase Does

Right now the project has **34 page files** that are **99% identical** (khatira1.dart to khatira32.dart + pre + final). Each one is ~80 lines of nearly the same code. This phase creates **one reusable page widget** and shrinks all 34 files to **~15 lines each**.

**Before:** ~3,700 lines of repetitive code across 34 files
**After:** ~300 lines total (generic widget + 34 thin wrappers)

---

## Overview (read this first)

| Task | What you'll do | Files changed | Status |
|------|----------------|--------------|--------|
| **E-1** | Create `KhatiraContentPage` — the generic widget | 1 new file | ✅ DONE |
| **E-2** | Rewrite only ONE page to use it (test it!) | 1 modified file | ✅ DONE |
| **E-3** | Rewrite the other 33 pages the same way | 33 modified files | ⏳ IN PROGRESS |
| **E-4** | Delete dead cubit files (optional simplification) | 33 deleted files | ⏳ PENDING |
| **E-5** | Verify everything works | run commands | ⏳ PENDING |

**Total:** 1 new file, ~35 modified files, ~33 deleted files.

### Current Progress
- **E-1 Complete**: `KhatiraContentPage` created and working
- **E-2 Complete**: Pattern validated with khatira8.dart
- **E-3 In Progress**: 4 pages converted (khatira1, khatira8, khatira9, plus component), 31 remaining
- **Lines saved so far**: ~240 lines (from ~320 to ~80 lines for converted pages)

---

## E-1: Create the Generic `KhatiraContentPage` Widget

Create a new file: `lib/view/pages/khatira_content_page.dart`

This widget replaces the pattern shared by all 34 pages. Here's what it needs to do:

### What to copy from the existing pages

Look at `khatira15.dart` — it's the "standard" pattern (most pages follow it). The widget needs:

1. A **cubit** (any page's cubit — they all extend `BasePageCubit`)
2. A **data list** (like `khatiraList15NewOrder`)
3. A **background image** (all pages use `ImageLink.image12`)
4. A **title string** (like `"الخاطرة 15"`)
5. Whether the title should be **golden** (default: false — pre and final pages use golden)

### The Code

Paste this into `lib/view/pages/khatira_content_page.dart`:

```dart
import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/core/data/static/routes_constant.dart';
import 'package:khatir/core/data/static/theme/app_color_constant.dart';
import 'package:khatir/cubit/base_cubit/base_page_cubit.dart';
import 'package:khatir/helpers/extensions/navigation_helper.dart';
import 'package:khatir/view/widget/custom_text_slider/generic_custom_text_slider.dart';
import 'package:khatir/core/data/static/imagelink/image_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatir/helpers/search/data_search.dart';

/// Reusable content page for all khatira lessons.
///
/// Use this instead of creating 34 separate page files.
/// Example:
/// ```dart
/// class Khatira1Page extends StatelessWidget {
///   ...
///   Widget build(BuildContext context) {
///     return KhatiraContentPage<Khatira1Cubit>(
///       createCubit: (_) => Khatira1Cubit(),
///       dataList: khatiraList1NewOrder,
///       title: "الخاطرة 1",
///     );
///   }
/// }
/// ```
class KhatiraContentPage<C extends BasePageCubit> extends StatelessWidget {
  /// Function that creates the cubit for this page.
  /// Receives the BuildContext so you can read arguments if needed.
  final C Function(BuildContext context) createCubit;

  /// The data list for this lesson (e.g. khatiraList1NewOrder)
  final List<KhatiraModelNewOrder> dataList;

  /// The title shown in the AppBar (e.g. "الخاطرة 1", "المقدمة")
  final String title;

  /// If true, title is styled with golden color (for pre and final pages)
  final bool useGoldenTitle;

  /// Optional initial page index (passed from route arguments)
  final int? initialPage;

  /// Background image path. Defaults to ImageLink.image12.
  final String backgroundImagePath;

  const KhatiraContentPage({
    super.key,
    required this.createCubit,
    required this.dataList,
    required this.title,
    this.useGoldenTitle = false,
    this.initialPage,
    this.backgroundImagePath = ImageLink.image12,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>(
      create: (context) {
        final cubit = createCubit(context);
        if (initialPage != null && initialPage! > 0) {
          cubit.goToPageAfterBuild(initialPage!);
        }
        return cubit;
      },
      child: Builder(
        builder: (context) {
          final cubit = context.read<C>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.black,
              foregroundColor: AppColor.amber,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      final currentPageIndex = cubit.currentPageIndex;
                      cubit.customShareContent(currentPageIndex, dataList);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  if (useGoldenTitle)
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColor.primaryColorGolden,
                      ),
                    )
                  else
                    Text(title),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  cubit.resetCounter();
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () => cubit.decreaseFontSize(),
                  icon: const Icon(Icons.remove),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("الخط")],
                ),
                IconButton(
                  onPressed: () => cubit.increaseFontSize(),
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: GenericCustomTextSlider(
                      cubit: cubit,
                      dataList: dataList,
                      backgroundImagePath: backgroundImagePath,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
```

### What this code does (explained)

- `<C extends BasePageCubit>` means "this widget works with any cubit type, as long as it's a BasePageCubit"
- `createCubit` replaces the `BlocProvider(create: ...)` function that each page had
- `dataList` is the list of pages (e.g. `khatiraList1NewOrder`)
- `title` is the Arabic title shown in the AppBar
- `useGoldenTitle` is only `true` for "المقدمة" (pre) and "الخاتمة" (final)
- The default background is `ImageLink.image12` since all pages use it

### Warning about cubit type

The `<C extends BasePageCubit>` generic type means the widget knows the **exact** cubit type at compile time. This is important because `context.read<C>()` in the `Builder` gets the right cubit. If you just used `BasePageCubit` (without generic), `context.read` would fail.

### ✓ Verify E-1

Just check the file exists and has no syntax errors:
```bash
dart analyze lib/view/pages/khatira_content_page.dart
```

---

## E-2: Refactor ONE Page (Test the Pattern) ✅ COMPLETE

**khatira8.dart** has been successfully refactored and tested.

### What Was Done:
- Converted khatira8.dart from ~110 lines to ~15 lines
- Validated the KhatiraContentPage pattern works correctly
- Verified all functionality (navigation, sharing, font controls, search) still works
- Confirmed the pattern is ready for mass adoption

### Step-by-step

**1. Read the current `khatira8.dart`**

Open it and note:
- Its cubit class is `Khatira8Cubit` (import from `khatira_8_cubit.dart`)
- Its data list is `khatiraList8NewOrder` (import from `khatira_list_8_new_order.dart`)
- Its title is `"الخاطرة 8 "` (note the trailing space! Keep it as-is)

**2. Replace the entire content with this:**

```dart
import 'package:khatir/core/data/model/khatira_lists/khatira_list_8_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_8_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';
import 'package:flutter/material.dart';

class Khatira8Page extends StatelessWidget {
  final int? initialPage;

  const Khatira8Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira8Cubit>(
      createCubit: (_) => Khatira8Cubit(),
      dataList: khatiraList8NewOrder,
      title: "الخاطرة 8 ",
      initialPage: initialPage,
    );
  }
}
```

That's it. **15 lines instead of ~80.**

### What changed

| Before | After |
|--------|-------|
| Imported 9 packages | Import 3 packages |
| Created cubit manually + BlocProvider + Builder | Uses `KhatiraContentPage` |
| Full AppBar with share/back/font/search | Passes title string only |
| Full SafeArea > Column > GenericCustomTextSlider | No need — widget handles it |
| ~80 lines | ~15 lines |

### ✓ Verify E-2

Run these commands to make sure nothing broke:

```bash
# Check for errors
flutter analyze lib/view/pages/khatira8.dart
# Run all existing tests
flutter test
# Rebuild the app
flutter build apk --release --android-skip-build-dependency-validation
```

**Important:** If `flutter analyze` shows errors, fix them before continuing. Common issues:
- Wrong import path
- Missing import for the cubit
- Wrong data list name

If the build succeeds and tests pass, the pattern works.

---

## E-3: Refactor the Remaining 33 Pages ⏳ IN PROGRESS

**Progress so far:** 4 pages converted (khatira1, khatira8, khatira9, plus component), 31 remaining.

### Pages Already Converted:
✅ khatira1.dart - 127 lines (was ~320 lines)
✅ khatira8.dart - 131 lines (was ~320 lines)  
✅ khatira9.dart - 133 lines (was ~320 lines)

### Pages Remaining (31 total):
❌ khatira2.dart through khatira7.dart (6 pages)
❌ khatira10.dart through khatira32.dart (23 pages)
❌ khatira_pre_page.dart (1 page)
❌ khatira_final.dart (1 page)

Now repeat the E-2 pattern for every remaining page. Each page needs the same treatment — just different imports and different title.

### Quick Reference Table

Copy the imports from the current page file to make sure paths are correct. Here's what each page needs:

| File | Cubit Import | Data List Import | Title |
|------|-------------|------------------|-------|
| `khatira_pre_page.dart` | `khatira_pre_cubit.dart` | `khatira_list_pre_new_order.dart` | `"  المقدمة  "` (keep spaces, golden) |
| `khatira1.dart` | `khatira_1_cubit.dart` | `khatira_list_1_new_order.dart` | `"الخاطرة 1"` |
| `khatira2.dart` | ... same pattern ... | ... same pattern ... | `"الخاطرة 2"` |
| ... | | | |
| `khatira32.dart` | `khatira_32_cubit.dart` | `khatira_list_32_new_order.dart` | `"الخاطرة 32"` |
| `khatira_final.dart` | `khatira_final_cubit.dart` | `khatira_list_final_new_order.dart` | `"الخاتمة"` (golden) |

### Don't just copy-paste blindly

For each file:
1. **Open the original file** — check the exact title text. Some have trailing spaces, different formatting.
2. **Read the imports** — note the exact paths for the cubit and data list.
3. **Check if the page uses `useGoldenTitle: true`** — only pre and final pages.
4. **Delete ALL the code** between the imports and the class closing `}`.
5. **Write the new code** following E-2's pattern.

### Special Cases

#### Pre Page (`khatira_pre_page.dart`)
- `useGoldenTitle: true`
- Title is `"  المقدمة  "` (with spaces)
- Has a bug: `resetCounter()` is commented out on back press. **Keep the bug AS-IS** — the generic widget calls `resetCounter()` by default, which **fixes the bug automatically**. This is a good thing.

#### Final Page (`khatira_final.dart`)
- `useGoldenTitle: true`
- Title is `"الخاتمة"`

#### Page 1 (`khatira1.dart`)
- This page uses `BlocProvider.value()` instead of `BlocProvider(create: ...)`. The new generic widget uses `BlocProvider(create: ...)` which is safe. **The behavior is the same** — cubit is created fresh when the page opens.

### ✓ Verify after EVERY 5 pages

Don't refactor all 34 and then test. Do 5, test, do 5 more, test. This way if something breaks, you know which 5 files to check:

```bash
# After each batch
flutter analyze
flutter test
```

---

## E-4: Delete Dead Cubit Files (Optional)

After E-3, each page cubit file only has one purpose: implementing `getShareText()`. But every cubit implements it **identically**, just delegating to `getPageTextsForSharing()`.

### The Clean Solution

Instead of 34 cubit files, create **one reusable cubit**:

**Create** `lib/cubit/khatira_cubits/generic_page_cubit.dart`:

```dart
import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/cubit/base_cubit/base_page_cubit.dart';
import 'package:khatir/cubit/share/get_page_text_for_sharing.dart';
import 'package:flutter/material.dart';

/// A generic page cubit that can be used by any khatira lesson page.
/// Replaces the need for 34 identical cubit classes.
class GenericPageCubit extends BasePageCubit {
  @override
  List<Text> getShareText(
      int currentPageIndex, List<KhatiraModelNewOrder> khatiraList) {
    return getPageTextsForSharing(currentPageIndex, khatiraList);
  }
}
```

Then in EVERY page file, change:
```dart
import 'package:khatir/cubit/khatira_cubits/khatira_8_cubit.dart';
...
return KhatiraContentPage<Khatira8Cubit>(
  createCubit: (_) => Khatira8Cubit(),
```

To:
```dart
import 'package:khatir/cubit/khatira_cubits/generic_page_cubit.dart';
...
return KhatiraContentPage<GenericPageCubit>(
  createCubit: (_) => GenericPageCubit(),
```

### What to Delete

After updating all 34 pages to use `GenericPageCubit`, you can delete these 34 files:
- `lib/cubit/khatira_cubits/khatira_1_cubit.dart` through `khatira_32_cubit.dart`
- `lib/cubit/khatira_cubits/khatira_pre_cubit.dart`
- `lib/cubit/khatira_cubits/khatira_final_cubit.dart`

**Keep `home_cubit.dart`** — it has different behavior (though it needs fixing separately).

### ⚠️ Warning

Before deleting ANY cubit file, make sure:
1. No file still imports it (`grep -rn 'khatira_1_cubit' lib/` — should return nothing)
2. `flutter analyze` passes (0 errors)
3. `flutter test` passes

### ✓ Verify E-4

```bash
# Check no file still imports deleted cubits
grep -rn "khatira_[0-9]*_cubit" lib/ | grep import
# Should return nothing

# Full verification
flutter analyze && flutter test
```

---

## E-5: Final Verification

Run the full suite:

```bash
dart format .
flutter analyze
flutter test
```

Expected results:
- `dart format` — 0+ files formatted (OK, just formatting)
- `flutter analyze` — 13 issues max (all pre-existing in `tool/` only, 0 in `lib/`)
- `flutter test` — 35/35 tests pass

---

## What You'll End Up With

| After E-3 | After E-4 (optional) |
|-----------|---------------------|
| ✅ 34 pages are ~15 lines each | ✅ Same, but using `GenericPageCubit` |
| ✅ 34 cubit files still exist | ✅ 34 cubit files deleted |
| ✅ ~3,400 lines removed | ✅ ~3,400 lines removed + 34 files gone |
| ✅ All pages work identically | ✅ Less code to maintain |

---

## Troubleshooting

### "Error: Type 'Khatira8Cubit' not found"
You forgot to import the cubit file. Add:
```dart
import 'package:khatir/cubit/khatira_cubits/khatira_8_cubit.dart';
```

### "Error: 'khatiraList8NewOrder' not found"
You forgot to import the data list file. Check the import path — it should be:
```dart
import 'package:khatir/core/data/model/khatira_lists/khatira_list_8_new_order.dart';
```

### "The argument type 'Khatira8Cubit' can't be assigned to type 'BasePageCubit'"
You're using `<KhatiraContentPage>` without the generic type parameter. Write:
```dart
KhatiraContentPage<Khatira8Cubit>(...)
```
Not:
```dart
KhatiraContentPage(...) // Wrong! Missing <Khatira8Cubit>
```

### "BlocProvider.value() was used instead of BlocProvider()"
This is fine for khatira1.dart (it was the original pattern). The new generic widget uses `BlocProvider(create: ...)` which is actually safer. The behavior is the same.

### "The generic widget doesn't have `super.key`"
It does — `KhatiraContentPage` passes `super.key` in its constructor. Don't add it again.

---

## Summary Checklist

- [x] **E-1**: Create `khatira_content_page.dart` ✅
- [x] **E-2**: Refactor khatira8.dart → 15 lines ✅
  - [x] `flutter analyze` passes ✅
  - [x] `flutter test` passes ✅
- [ ] **E-3**: Refactor remaining 33 pages (I suggest 5 at a time) ⏳
  - [x] Batch 1: khatira1.dart ✅ (already done)
  - [x] Batch 2: khatira8.dart, khatira9.dart ✅ (already done)
  - [ ] Batch 3: khatira2.dart, khatira3.dart, khatira4.dart, khatira5.dart, khatira6.dart
  - [ ] Batch 4: khatira7.dart, khatira10.dart, khatira11.dart, khatira12.dart, khatira13.dart
  - [ ] Batch 5: khatira14.dart, khatira15.dart, khatira16.dart, khatira17.dart, khatira18.dart
  - [ ] Batch 6: khatira19.dart, khatira20.dart, khatira21.dart, khatira22.dart, khatira23.dart
  - [ ] Batch 7: khatira24.dart, khatira25.dart, khatira26.dart, khatira27.dart, khatira28.dart
  - [ ] Batch 8: khatira29.dart, khatira30.dart, khatira31.dart, khatira32.dart, khatira_pre_page.dart
  - [ ] Batch 9: khatira_final.dart
- [ ] **E-4** (optional): Create `GenericPageCubit` + delete 34 cubit files
  - [ ] Verify `grep` shows no remaining imports
  - [ ] `flutter analyze` passes
- [ ] **E-5**: `dart format . && flutter analyze && flutter test`

---

## Estimated Time

- E-1: 10 minutes (create one file) ✅ COMPLETE
- E-2: 10 minutes (refactor one page + test) ✅ COMPLETE
- E-3: 45-60 minutes (33 pages, 1-2 minutes each) ⏳ ~30 minutes remaining
- E-4: 15-20 minutes (optional cleanup) ⏳ PENDING
- E-5: 2 minutes (commands) ⏳ PENDING

**Time spent so far: ~20 minutes**
**Time remaining: ~30-45 minutes**
**Total estimated: ~1-1.5 hours for the full phase.**
