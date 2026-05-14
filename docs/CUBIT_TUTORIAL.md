# Flutter Cubit Tutorial for Beginners
## Based on khatir (خواطر إيمانية) Project

---

## What is Cubit?

**Cubit** is a way to manage app state in Flutter. Think of it as the "brain" for each screen:

| What is Cubit? | Real Example (khatir app) |
|--------------|-------------------|
| Holds data | Current page number (0, 1, 2...) |
| Handles actions | User clicks + button to increase font |
| Updates screen | Font gets bigger/smaller |

---

## Your Project's Cubit Structure

```
lib/cubit/
├── base_cubit/           # Template for all pages
│   ├── base_page_cubit.dart    # The main logic
│   └── base_page_state.dart   # What page looks like
├── elm_cubits/          # 34 specific cubits
│   ├── elm_1_cubit.dart   # Page 1 "brain"
│   ├── elm_2_cubit.dart   # Page 2 "brain"
│   └── ... (up to 32 + pre + final)
└── share/             # Share helper
```

---

## Step 1: BasePageState
### "What the page looks like"

File: `lib/cubit/base_cubit/base_page_state.dart`

```dart
import 'package:khatir/core/data/model/elm_model_new_order.dart';

// Base state - parent of all states
abstract class BasePageState {}

// Initial state - when page first loads
class PageInitial extends BasePageState {}

// User changed font size (+ or -)
class PageFontSizeChanged extends BasePageState {
  final double fontSize;
  PageFontSizeChanged(this.fontSize);
}

// User swiped to different page
class PageChanged extends BasePageState {
  final int pageIndex;
  PageChanged(this.pageIndex);
}

// User tapped reset button
class PageUpdated extends BasePageState {
  final int updatedCounter;
  PageUpdated({required this.updatedCounter});
}

// Share success
class PageShareSuccess extends BasePageState {
  final String message = "Shared!";
}

// Share failed
class PageShareFailure extends BasePageState {
  final String errorMessage;
  PageShareFailure({required this.errorMessage});
}

// Search results
class PageSearchResults extends BasePageState {
  final List<ElmModelNewOrder> results;
  PageSearchResults(this.results);
}
```

**Simple explanation:** Each class = one situation the page can be in.

---

## Step 2: BasePageCubit
### "The brain" - all logic in one place

File: `lib/cubit/base_cubit/base_page_cubit.dart`

```dart
import 'package:khatir/core/data/model/elm_model_new_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import 'package:khatir/cubit/base_cubit/base_page_state.dart';

// BaseCubit: Contains all the core logic
abstract class BasePageCubit extends Cubit<BasePageState> {
  
  // Variables this cubit manages
  int currentPageIndex = 0;
  PageController pageController = PageController();
  double fontSize = 21.0;
  late List<ElmModelNewOrder> elmList;

  BasePageCubit() : super(PageInitial()); // Initial state

  // Method: Increase font size
  void increaseFontSize() {
    if (fontSize < 37.0) {
      fontSize += 2.0;
      emit(PageFontSizeChanged(fontSize)); // Tell screen to update
    }
  }

  // Method: Decrease font size
  void decreaseFontSize() {
    if (fontSize > 21.0) {
      fontSize -= 2.0;
      emit(PageFontSizeChanged(fontSize));
    }
  }

  // Method: User swiped to new page
  void onPageChanged(int index) {
    currentPageIndex = index;
    emit(PageChanged(index));
  }

  // Method: Jump to specific page
  void goToPage(int index) {
    pageController.jumpToPage(index);
    currentPageIndex = index;
    emit(PageChanged(index));
  }

  // Method: Reset counter
  void resetCounter() {
    emit(PageUpdated(updatedCounter: 0));
  }

  // Method: Search content
  List<ElmModelNewOrder> searchContent(String query) {
    final results = elmList.where((item) {
      // Search in titles, texts, ayahs, footer
      bool inTitles = item.titles?.any((t) => t.contains(query)) ?? false;
      bool inTexts = item.texts?.any((t) => t.contains(query)) ?? false;
      bool inAyahs = item.ayahs?.any((t) => t.contains(query)) ?? false;
      return inTitles || inTexts || inAyahs;
    }).toList();
    
    emit(PageSearchResults(results));
    return results;
  }

  // Method: Share content (must be implemented by subclass)
  List<Text> getShareText(int index, List<ElmModelNewOrder> list);

  void customShareContent(int index, List<ElmModelNewOrder> list) {
    try {
      final texts = getShareText(index, list);
      final joined = texts.map((t) => t.data).join('\n');
      SharePlus.instance.share(ShareParams(text: joined));
      emit(PageShareSuccess());
    } catch (e) {
      emit(PageShareFailure(errorMessage: "Failed to share!"));
    }
  }
}
```

**Key methods:**
- `increaseFontSize()` - Add 2 to font (max 37)
- `decreaseFontSize()` - Subtract 2 from font (min 21)
- `onPageChanged()` - Track current page
- `searchContent()` - Find text in data
- `customShareContent()` - Share to other apps

---

## Step 3: Specific Cubit (Elm1Cubit)
### "Brain for page 1"

File: `lib/cubit/elm_cubits/elm_1_cubit.dart`

```dart
import 'package:khatir/core/data/model/elm_model_new_order.dart';
import 'package:khatir/cubit/base_cubit/base_page_cubit.dart';
import 'package:khatir/cubit/share/get_page_text_for_sharing.dart';
import 'package:flutter/material.dart';

// Elm1Cubit REUSES all logic from BasePageCubit
// Only adds: how to get share text for this specific page
class Elm1Cubit extends BasePageCubit {
  
  @override
  List<Text> getShareText(int currentPageIndex, List<ElmModelNewOrder> elmList) {
    // Use helper to get text for sharing
    return getPageTextsForSharing(currentPageIndex, elmList);
  }
}
```

**That's it!** Just one method unique to this page.
All other methods (increaseFontSize, decreaseFontSize, etc.) come from BasePageCubit.

---

## Step 4: Using Cubit in a Page

File: `lib/view/pages/elm1.dart` (simplified)

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatir/cubit/elm_cubits/elm_1_cubit.dart';
import 'package:khatir/core/data/model/elm_lists/elm_list_1_new_order.dart';

class Elm1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Elm1Cubit(), // Create the cubit
      
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                // Button to increase font
                IconButton(
                  onPressed: () {
                    context.read<Elm1Cubit>().increaseFontSize();
                  },
                  icon: Icon(Icons.add),
                ),
                // Button to decrease font
                IconButton(
                  onPressed: () {
                    context.read<Elm1Cubit>().decreaseFontSize();
                  },
                  icon: Icon(Icons.remove),
                ),
              ],
            ),
            body: BlocBuilder<Elm1Cubit, BasePageState>(
              builder: (context, state) {
                // Get current font size from cubit
                final cubit = context.read<Elm1Cubit>();
                
                return Text(
                  'Current font: ${cubit.fontSize}',
                  style: TextStyle(fontSize: cubit.fontSize),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
```

**How it works:**
1. `BlocProvider` creates `Elm1Cubit`
2. `BlocBuilder` listens to state changes
3. Buttons call cubit methods
4. UI rebuilds when state changes

---

## Step 5: The State Flow

```
User clicks + button
       ↓
Elm1Cubit.increaseFontSize()
       ↓
fontSize: 21.0 → 23.0
       ↓
emit(PageFontSizeChanged(23.0))
       ↓
BlocBuilder detects change
       ↓
UI rebuilds with new font size!
```

---

## Quick Reference

| Term | What it means |
|------|---------------|
| `Cubit` | "Brain" that manages state |
| `State` | What the screen looks like |
| `emit()` | Tell the screen to update |
| `BlocProvider` | Creates the cubit |
| `BlocBuilder` | Listens for changes |
| `context.read<T>()` | Get the cubit from anywhere |

---

## Testing Cubit

File: `test/unit/base_page_cubit_test.dart`

```dart
void main() {
  group('BasePageCubit', () {
    late TestPageCubit cubit;

    setUp(() {
      cubit = TestPageCubit();
    });

    test('increaseFontSize works', () {
      expect(cubit.fontSize, 21.0);
      cubit.increaseFontSize();
      expect(cubit.fontSize, 23.0);
    });

    test('decreaseFontSize works', () {
      cubit.fontSize = 25.0;
      cubit.decreaseFontSize();
      expect(cubit.fontSize, 23.0);
    });

    test('max font is 37', () {
      cubit.fontSize = 37.0;
      cubit.increaseFontSize();
      expect(cubit.fontSize, 37.0); // Stays same
    });

    test('min font is 21', () {
      cubit.fontSize = 21.0;
      cubit.decreaseFontSize();
      expect(cubit.fontSize, 21.0); // Stays same
    });
  });
}
```

Run tests:
```bash
flutter test test/unit/base_page_cubit_test.dart
```

---

## Summary

```
BasePageCubit (template)
    ↓ extends
Elm1Cubit, Elm2Cubit, ... Elm32Cubit (specific pages)
    ↓ used in
Elm1Page, Elm2Page, ... Elm32Page (UI)
    ↓ managed by
BlocProvider + BlocBuilder (glue)
```

**Key insight:** All 34 pages share the same font/size methods from BasePageCubit - no duplicate code!