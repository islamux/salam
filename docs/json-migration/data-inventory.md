# Data Inventory - Elm Application

**Generated**: 2025-10-31
**Status**: ✅ COMPLETE - Phase 1.1

---

## Overview

This document provides a complete inventory of all data files in the Elm Flutter application that will be migrated from Dart class files to JSON format.

---

## Data File Count

| Category | Count | Pattern |
|----------|-------|---------|
| **Elm List Files** | 29 | `elm_list_*_new_order.dart` |
| **Text Class Files** | 28 | `elm_text_ders_*.dart` |
| **Model Files** | 2 | `elm_model_new_order.dart`, `enum_order.dart` |
| **Total Files** | **59** | |

---

## Elm List Files (29 files)

### Core List Files (1-27)

```
lib/core/data/model/elm_lists/
├── elm_list_1_new_order.dart      ✅ Contains 29 ElmModelNewOrder items
├── elm_list_2_new_order.dart      ✅
├── elm_list_3_new_order.dart      ✅
├── elm_list_4_new_order.dart      ✅
├── elm_list_5_new_order.dart      ✅
├── elm_list_6_new_order.dart      ✅
├── elm_list_7_new_order.dart      ✅
├── elm_list_8_new_order.dart      ✅
├── elm_list_9_new_order.dart      ✅
├── elm_list_10_new_order.dart     ✅
├── elm_list_11_new_order.dart     ✅
├── elm_list_12_new_order.dart     ✅
├── elm_list_13_new_order.dart     ✅
├── elm_list_14_new_order.dart     ✅
├── elm_list_15_new_order.dart     ✅
├── elm_list_16_new_order.dart     ✅
├── elm_list_17_new_order.dart     ✅
├── elm_list_18_new_order.dart     ✅
├── elm_list_19_new_order.dart     ✅
├── elm_list_20_new_order.dart     ✅
├── elm_list_21_new_order.dart     ✅
├── elm_list_22_new_order.dart     ✅
├── elm_list_23_new_order.dart     ✅
├── elm_list_24_new_order.dart     ✅
├── elm_list_25_new_order.dart     ✅
├── elm_list_26_new_order.dart     ✅
├── elm_list_27_new_order.dart     ✅
```

### Special List Files

```
├── elm_list_pre_new_order.dart    ✅ Intro/preparation page
└── elm_list_final_new_order.dart  ✅ Final page
```

---

## Text Class Files (28 files)

```
lib/core/data/static/text/
├── elm_text_ders_pre.dart         ✅
├── elm_text_ders_one.dart         ✅ Linked to elm_list_1
├── elm_text_ders_two.dart         ✅ Linked to elm_list_2
├── elm_text_ders_three.dart       ✅ Linked to elm_list_3
├── elm_text_ders_four.dart        ✅ Linked to elm_list_4
├── elm_text_ders_five.dart        ✅ Linked to elm_list_5
├── elm_text_ders_six.dart         ✅ Linked to elm_list_6
├── elm_text_ders_seven.dart       ✅ Linked to elm_list_7
├── elm_text_ders_eight.dart       ✅ Linked to elm_list_8
├── elm_text_ders_nine.dart        ✅ Linked to elm_list_9
├── elm_text_ders_ten.dart         ✅ Linked to elm_list_10
├── elm_text_ders_eleven.dart      ✅ Linked to elm_list_11
├── elm_text_ders_twelve.dart      ✅ Linked to elm_list_12
├── elm_text_ders_therteen.dart    ✅ Linked to elm_list_13
├── elm_text_ders_fourteen.dart    ✅ Linked to elm_list_14
├── elm_text_ders_fifteen.dart     ✅ Linked to elm_list_15
├── elm_text_ders_sixteen.dart     ✅ Linked to elm_list_16
├── elm_text_ders_seventeen.dart   ✅ Linked to elm_list_17
├── elm_text_ders_eighteen.dart    ✅ Linked to elm_list_18
├── elm_text_ders_nineteen.dart    ✅ Linked to elm_list_19
├── elm_text_ders_twenty.dart      ✅ Linked to elm_list_20
├── elm_text_ders_twenty_one.dart  ✅ Linked to elm_list_21
├── elm_text_ders_twenty_two.dart  ✅ Linked to elm_list_22
├── elm_text_ders_twenty_three.dart ✅ Linked to elm_list_23
├── elm_text_ders_twenty_four.dart ✅ Linked to elm_list_24
├── elm_text_ders_twenty_five.dart ✅ Linked to elm_list_25
├── elm_text_ders_twenty_six.dart  ✅ Linked to elm_list_26
├── elm_text_ders_twenty_seven.dart ✅ Linked to elm_list_27
└── elm_text_ders_final.dart       ✅ Linked to final page
```

---

## Data Model Structure

### ElmModelNewOrder Class

**File**: `lib/core/data/model/elm_model_new_order.dart`

```dart
class ElmModelNewOrder {
  final List<String>? titles;
  final List<String>? subtitles;
  final List<String>? texts;
  final List<String>? ayahs;
  final String? footer;
  final List<EnOrder> order;

  ElmModelNewOrder({
    this.titles,
    this.subtitles,
    this.texts,
    this.ayahs,
    this.footer,
    required this.order,
  });
}
```

### EnOrder Enum

**File**: `lib/core/data/model/enum_order.dart`

```dart
enum EnOrder { titles, subtitles, texts, ayahs, footer }
```

---

## Sample Data Structure

### Example: elm_list_1_new_order.dart

```dart
List<ElmModelNewOrder> elmList1NewOrder = [
  // Item 1
  ElmModelNewOrder(
    titles: [ElmTextDersOne.titleOneOne],
    texts: [
      ElmTextDersOne.elmTextOneOne_1,
      ElmTextDersOne.elmTextOneOne_2,
      ElmTextDersOne.elmTextOneOne_3,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),
  // ... 28 more items
];
```

### Field Usage Patterns

- **titles**: Optional, used for section headers
- **subtitles**: Optional, used for sub-headers
- **texts**: Main content, typically 1-5 items per list item
- **ayahs**: Quranic verses or hadith, often paired with texts
- **footer**: Optional, used for closing remarks
- **order**: **REQUIRED** - Defines rendering sequence

---

## Content Volume Estimation

| List Number | Estimated Items | Content Type |
|-------------|----------------|--------------|
| 1-5 | 20-29 each | Early chapters with more detail |
| 6-15 | 15-25 each | Mid-range content |
| 16-27 | 10-20 each | Later chapters |
| Pre | ~10 items | Introduction |
| Final | ~15 items | Conclusion |
| **Total** | **~400-500 items** | **Complete Elm content** |

---

## File Dependencies

### Each Elm List File Imports:

1. **Core Models**:
   - `package:elm/core/data/model/elm_model_new_order.dart`
   - `package:elm/core/data/model/enum_order.dart`

2. **Corresponding Text Class**:
   - `package:elm/core/data/static/text/elm_text_ders_[number].dart`

### Text Class Structure

Each text class contains:
- String constants for all content
- Field naming pattern: `[field][itemNumber]_[subNumber]`
- Examples:
  - `titleOneOne` (list 1, item 1, title)
  - `elmTextOneFive_2` (list 1, item 5, text #2)
  - `ayahHadithOneTwentyOne_3` (list 1, item 21, ayah #3)

---

## Notes

✅ **All 29 elm_list files found and verified**
✅ **All 28 text class files identified**
✅ **Model structure documented**
✅ **Sample data structure analyzed**

---

## Next Steps

- [ ] Phase 1.2: Analyze how data is accessed in the application
- [ ] Phase 1.3: Document current data access patterns
- [ ] Phase 1.4: Identify all pages consuming data
- [ ] Phase 1.5: Review BLoC cubits using the data

---

**Migration Impact**: Converting 59 files to JSON format will significantly improve content maintainability and enable future features like multi-language support.
