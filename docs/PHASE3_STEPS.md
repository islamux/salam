# Phase 3: Generic Content Page Widget
## Step-by-Step Guide for Juniors

---

## Why Are We Doing This?

**Current Problem:**
- We have 34 page files (elm1.dart to elm32.dart + pre + final)
- All 34 files are ~95% IDENTICAL!
- Same code copied 34 times = HARD to maintain

**Solution:**
- Create ONE generic widget
- Use it for all 34 pages
- Save ~3,000 lines of code!

---

## What Changes Per Page?

| Page | Cubit | Data List | Title |
|------|------|----------|-------|
| elm1 | Elm1Cubit | elmList1NewOrder | الخاطرة 1 |
| elm2 | Elm2Cubit | elmList2NewOrder | الخاطرة 2 |
| ... | ... | ... | ... |
| elm32 | Elm32Cubit | elmList32NewOrder | الخاطرة 32 |

Everything else (AppBar, buttons, slider) is EXACTLY the same.

---

## Simple Steps

### Step 1: Read One Page (5 min)
```bash
cat lib/view/pages/elm1.dart
```
Understand the structure. Don't worry about understanding every line.

---

### Step 2: Create Generic Widget (30 min)
Create new file: `lib/view/pages/elm_content_page.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/cubit/base_cubit/base_page_cubit.dart';
import 'package:elm/cubit/base_cubit/base_page_state.dart';
import 'package:elm/view/widget/custom_text_slider/generic_custom_text_slider.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/helpers/extensions/navigation_helper.dart';
import 'package:elm/core/data/static/routes_constant.dart';

class ElmContentPage extends StatelessWidget {
  final BasePageCubit cubit;
  final List<ElmModelNewOrder> dataList;
  final String title;
  final String backgroundImagePath;
  final int? initialPage;

  const ElmContentPage({
    super.key,
    required this.cubit,
    required this.dataList,
    required this.title,
    this.backgroundImagePath = '',
    this.initialPage,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Builder(
        builder: (context) {
          if (initialPage != null && initialPage! > 0) {
            cubit.goToPageAfterBuild(initialPage!);
          }
          
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
                  onPressed: cubit.decreaseFontSize,
                  icon: const Icon(Icons.remove),
                ),
                const Text('الخط'),
                IconButton(
                  onPressed: cubit.increaseFontSize,
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

---

### Alternative: Single Return Pattern

If you find multiple `return` keywords confusing, here's the same widget using **one return** at the end:

```dart
class ElmContentPage extends StatelessWidget {
  final BasePageCubit cubit;
  final List<ElmModelNewOrder> dataList;
  final String title;
  final String backgroundImagePath;
  final int? initialPage;

  const ElmContentPage({
    super.key,
    required this.cubit,
    required this.dataList,
    required this.title,
    this.backgroundImagePath = '',
    this.initialPage,
  });

  @override
  Widget build(BuildContext context) {
    // Step 1: Initialize page if needed
    if (initialPage != null && initialPage! > 0) {
      cubit.goToPageAfterBuild(initialPage!);
    }

    // Step 2: Build the slider content first
    Widget sliderContent = GenericCustomTextSlider(
      cubit: cubit,
      dataList: dataList,
      backgroundImagePath: backgroundImagePath,
    );

    // Step 3: Build the body
    Widget body = SafeArea(
      child: Column(
        children: [
          Expanded(child: sliderContent),
        ],
      ),
    );

    // Step 4: Build the Scaffold (the whole screen)
    Widget screen = Scaffold(
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
            onPressed: cubit.decreaseFontSize,
            icon: const Icon(Icons.remove),
          ),
          const Text('الخط'),
          IconButton(
            onPressed: cubit.increaseFontSize,
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
      body: body,
    );

    // Step 5: Single return with BlocProvider
    return BlocProvider.value(
      value: cubit,
      child: screen,
    );
  }
}
```

**Key differences:**
| Multiple Returns | Single Return |
|-------------------|----------------|
| `return` in each nested builder | Create parts first, return once at end |
| Hard to follow flow | Easy to see step-by-step |
| More common in Flutter | Easier for beginners |

---

### Step 3: Update Route Generator (15 min)
Edit `lib/app_routes.dart`:
- Import the new `ElmContentPage`
- Change each route to use generic widget with parameters

Before:
```dart
case RoutesConstant.elm1:
  return MaterialPageRoute(builder: (_) => const Elm1Page());
```

After:
```dart
case RoutesConstant.elm1:
  return MaterialPageRoute(
    builder: (_) => ElmContentPage(
      cubit: Elm1Cubit(),
      dataList: elmList1NewOrder,
      title: 'الخاطرة 1',
      backgroundImagePath: ImageLink.image12,
    ),
  );
```

Repeat for all 34 routes.

---

### Step 4: Test (10 min)
```bash
flutter analyze
flutter build apk --debug --android-skip-build-dependency-validation
```

---

### Step 5: Delete Old Pages (Optional)
After testing works, delete the 34 old files:
```bash
rm lib/view/pages/elm1.dart
rm lib/view/pages/elm2.dart
# ... repeat for all 34
```

---

## Files Changed

| File | Action |
|------|-------|
| `lib/view/pages/elm_content_page.dart` | CREATE new |
| `lib/app_routes.dart` | MODIFY |
| `lib/view/pages/elm1.dart` - `elm32.dart` | DELETE (optional) |
| `lib/view/pages/elmpre_page.dart` | DELETE (optional) |
| `lib/view/pages/elm_final.dart` | DELETE (optional) |

---

## Time Estimate

- Step 1: 5 min
- Step 2: 30 min
- Step 3: 20 min
- Step 4: 10 min
- Step 5: 10 min
- **Total: ~1.5 hours**

---

## Verification Commands

```bash
# Check for errors
flutter analyze

# Build debug APK
flutter build apk --debug --android-skip-build-dependency-validation

# Run tests
flutter test
```

---

## If Something Breaks

Don't panic! Here's how to fix common issues:

### "Method not found" error
- Missing import? Check imports at top of file

### "Widget not found" error  
- Make sure BlocProvider wraps your widget

### App crashes on launch
- Check that all required parameters are passed to ElmContentPage
- Verify dataList is not empty

### Tests fail
- Update test files to use new widget instead of old pages