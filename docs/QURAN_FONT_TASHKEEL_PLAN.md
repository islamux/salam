# Quranic Verses Font Unification & Tashkeel Correction Plan

## Branch
`fix/unified-quran-font-tashkeel` (from `feat/project-improvements`)

## Tracker Milestone
`MS-QF` in `command-center/project-tracker.json`

## Current State

| Aspect | Status | Problem |
|--------|--------|---------|
| Font files | Amiri (Regular+Bold), Cairo (Regular+Bold), Tajawal (unused) | Tajawal in assets but not in pubspec.yaml |
| Default font | `fontFamily: "AmiriQ"` in `generic_custom_text_slider.dart:65` | "AmiriQ" NOT declared in pubspec.yaml - only "Amiri" |
| Ayah style | `AppTheme.customTextStyleHadith` - color+bold only, NO fontFamily | Ayahs inherit parent font, no dedicated Quran font |
| Ayah data | 766 `ayahHadith*` strings across 34 files | Mixed: some full tashkeel, some partial, some none |
| Previous attempt | Commit `d1bcb86` "To corrent ayash from net" | Only added ayahs.md tracking file, no .dart changes |

## Constraints

- **DO NOT** change order of texts, ayahs, or any `order` arrays
- **DO NOT** change `titles`, `subtitles`, `texts`, `footer` fields
- **DO NOT** standardize prefix text (قال تعالى, اقرأ قوله تعالى, etc.) - keep as-is
- Only modify `ayahHadith*` strings and font infrastructure

## Transformation Rules

### Rule 1: Quranic Verse Text
- Replace with Tanzil.net Uthmanic script with **full tashkeel**
- Partial verses: keep the fragment, add proper tashkeel to it

### Rule 2: Ayah Numbering - Standardize to ۝ format

| Before | After |
|--------|-------|
| `۝٢٤` | `۝٢٤` (already correct) |
| `(24)` | `۝٢٤` |
| `24` (standalone) | `۝٢٤` |
| `الاسراء 27` | verse text `۝٢٧` on first line, `الاسراء` on next line |

### Rule 3: Surah Names - Standardize format
- Always on its **own line** below the verse
- No trailing spaces
- Consistent Arabic naming

### Rule 4: Prefix Text - KEEP AS-IS
- "قال تعالى", "اقرأ قوله تعالى", "وبقوله سبحانه وتعالى" etc. - all preserved exactly
- No standardization of prefix text

### Rule 5: What NOT to touch
- `titles` / `subtitles` / `texts` / `footer` fields
- `order` arrays
- Variable names, code structure
- Hadiths/quotes: add tashkeel if missing, but no ۝ number or surah name changes

## Execution Steps

### Step 0: Create Branch
```bash
git checkout -b fix/unified-quran-font-tashkeel
```

### Step 1: Fix Font Infrastructure (2 edits)

| File | Change |
|------|--------|
| `lib/view/widget/custom_text_slider/generic_custom_text_slider.dart:65` | `"AmiriQ"` -> `"Amiri"` |
| `lib/core/data/static/theme/app_them.dart:12` | Add `fontFamily: "Amiri"` to `customTextStyleHadith` |

**Commit**: `fix: unify font to Amiri - fix AmiriQ mismatch, add explicit ayah font`

### Step 2: Tashkeel Audit & Correction (4 batches, 34 files)

**Batch 1** (ders 1-10): `elm_text_ders_one.dart` through `elm_text_ders_ten.dart`
**Batch 2** (ders 11-20): `elm_text_ders_eleven.dart` through `elm_text_ders_twenty.dart`
**Batch 3** (ders 21-32): `elm_text_ders_twenty_one.dart` through `elm_text_ders_thirty_two.dart`
**Batch 4** (pre + final): `elm_text_ders_pre.dart` + `elm_text_ders_final.dart`

Per batch commit: `fix(ders-N): correct quranic verse tashkeel from Tanzil.net`

### Step 3: Verify
```bash
flutter analyze
flutter build apk --release --android-skip-build-dependency-validation
```

## Example Transformations

### Example 1: Verse with full tashkeel, surah name standardized
**Before:**
```
وَلَا تَنَـٰزَعُوا۟ فَتَفۡشَلُوا۟ وَتَذۡهَبَ رِیحُكُمۡۖ وَٱصۡبِرُوۤا۟ۚ إِنَّ ٱللَّهَ مَعَ ٱلصَّـٰبِرِینَ ۝٤٦
الانفال  
```
**After:**
```
وَلَا تَنَـٰزَعُوا۟ فَتَفۡشَلُوا۟ وَتَذۡهَبَ رِیحُكُمۡۖ وَٱصۡبِرُوۤا۟ۚ إِنَّ ٱللَّهَ مَعَ ٱلصَّـٰبِرِینَ ۝٤٦
الأنفال
```

### Example 2: Plain Arabic without tashkeel
**Before:**
```
إذ قالوا ليوسف وأخوه أحب إلى أبينا منا ونحن عصبة إن أبانا لفي ضلالٍ مُبين
```
**After:**
```
إِذۡ قَالُوا۟ لَيُوسُفَ وَأَخُوهُ أَحَبُّ إِلَىٰٓ أَبِينَا مِنَّا وَنَحۡنُ عُصۡبَةٌ إِنَّ أَبَانَا لَفِی ضَلَـٰلࣲ مُّبِینٍ ۝٨
يوسف
```

### Example 3: Partial verse, prefix kept
**Before:**
```
إِنَّ بَعۡضَ ٱلظَّنِّ إِثۡمࣱۖ 
الحجرات  
```
**After:**
```
إِنَّ بَعۡضَ ٱلظَّنِّ إِثۡمࣱۖ ۝١٢
الحجرات
```

## Files Affected

### Font Infrastructure (Step 1)
- `lib/view/widget/custom_text_slider/generic_custom_text_slider.dart`
- `lib/core/data/static/theme/app_them.dart`

### Tashkeel Data Files (Step 2)
- `lib/core/data/static/text/elm_text_ders_one.dart`
- `lib/core/data/static/text/elm_text_ders_two.dart`
- `lib/core/data/static/text/elm_text_ders_three.dart`
- `lib/core/data/static/text/elm_text_ders_four.dart`
- `lib/core/data/static/text/elm_text_ders_five.dart`
- `lib/core/data/static/text/elm_text_ders_six.dart`
- `lib/core/data/static/text/elm_text_ders_seven.dart`
- `lib/core/data/static/text/elm_text_ders_eight.dart`
- `lib/core/data/static/text/elm_text_ders_nine.dart`
- `lib/core/data/static/text/elm_text_ders_ten.dart`
- `lib/core/data/static/text/elm_text_ders_eleven.dart`
- `lib/core/data/static/text/elm_text_ders_twelve.dart`
- `lib/core/data/static/text/elm_text_ders_therteen.dart`
- `lib/core/data/static/text/elm_text_ders_fourteen.dart`
- `lib/core/data/static/text/elm_text_ders_fifteen.dart`
- `lib/core/data/static/text/elm_text_ders_sixteen.dart`
- `lib/core/data/static/text/elm_text_ders_seventeen.dart`
- `lib/core/data/static/text/elm_text_ders_eighteen.dart`
- `lib/core/data/static/text/elm_text_ders_nineteen.dart`
- `lib/core/data/static/text/elm_text_ders_twenty.dart`
- `lib/core/data/static/text/elm_text_ders_twenty_one.dart`
- `lib/core/data/static/text/elm_text_ders_twenty_two.dart`
- `lib/core/data/static/text/elm_text_ders_twenty_three.dart`
- `lib/core/data/static/text/elm_text_ders_twenty_four.dart`
- `lib/core/data/static/text/elm_text_ders_twenty_five.dart`
- `lib/core/data/static/text/elm_text_ders_twenty_six.dart`
- `lib/core/data/static/text/elm_text_ders_twenty_seven.dart`
- `lib/core/data/static/text/elm_text_ders_twenty_eight.dart`
- `lib/core/data/static/text/elm_text_ders_twenty_nine.dart`
- `lib/core/data/static/text/elm_text_ders_thirty.dart`
- `lib/core/data/static/text/elm_text_ders_thirty_one.dart`
- `lib/core/data/static/text/elm_text_ders_thirty_two.dart`
- `lib/core/data/static/text/elm_text_ders_pre.dart`
- `lib/core/data/static/text/elm_text_ders_final.dart`

## Tracker Reference
- Milestone ID: `MS-QF`
- Subtasks: MS-QF.1 (font fix), MS-QF.2-5 (batches 1-4), MS-QF.6 (verify)
