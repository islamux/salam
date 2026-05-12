#!/usr/bin/env python3
"""Fix ayahHadith fields in ders 17: Uthmani tashkeel + ۝ numbering."""

import re

BASE = '/media/islamux/Variety/Flutter_Projects/salam/lib/core/data/static/text/'

def replace_field(filepath, field_name, new_content):
    with open(filepath, 'r', encoding='utf-8') as f:
        text = f.read()
    pattern = re.compile(rf'({re.escape(field_name)} = """).*?(""";)', re.DOTALL)
    replacement = rf'\1\n{new_content}\2'
    new_text = pattern.sub(replacement, text)
    if new_text == text:
        print(f"  ⚠ No match: {field_name}")
    else:
        print(f"  ✓ {field_name}")
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_text)

f17 = BASE + 'elm_text_ders_seventeen.dart'

print("=== Ders 17 ===")

# 1. ayahHadithSeventeenOne_1: 10:88 + 10:89 - already has ۝٨٨ on first, add ۝٨٩ on second + surah
replace_field(f17, 'ayahHadithSeventeenOne_1', """\
رَبَّنَا ٱطۡمِسۡ عَلَىٰۤ أَمۡوَ ٰلِهِمۡ وَٱشۡدُدۡ عَلَىٰ قُلُوبِهِمۡ فَلَا یُؤۡمِنُوا۟ حَتَّىٰ یَرَوُا۟ ٱلۡعَذَابَ ٱلۡأَلِیمَ ۝٨٨
سورة يونس

قال الله عز وجل
قَدۡ أُجِیبَت دَّعۡوَتُكُمَا ۝٨٩
سورة يونس
""")

# 2. ayahHadithSeventeenOne_2: 10:89 partial
replace_field(f17, 'ayahHadithSeventeenOne_2', """\
قَدۡ أُجِیبَت دَّعۡوَتُكُمَا ۝٨٩
سورة يونس
""")

# 3. ayahHadithSeventeenTwo_1: has ۝٨٩, fix يونس reference
replace_field(f17, 'ayahHadithSeventeenTwo_1', """\
قَالَ قَدۡ أُجِیبَت دَّعۡوَتُكُمَا فَٱسۡتَقِیمَا وَلَا تَتَّبِعَاۤنِّ سَبِیلَ ٱلَّذِینَ لَا یَعۡلَمُونَ ۝٨٩
سورة يونس
""")

# 4. ayahHadithSeventeenThree_2: has ۝٨٩, add surah name
replace_field(f17, 'ayahHadithSeventeenThree_2', """\
وَلَا تَتَّبِعَاۤنِّ سَبِیلَ ٱلَّذِینَ لَا یَعۡلَمُونَ ۝٨٩
سورة يونس
""")

# 5. ayahHadithSeventeenFour_1: 40:60 - plain Arabic -> Uthmani
replace_field(f17, 'ayahHadithSeventeenFour_1', """\
ٱدۡعُونِیٓ أَسۡتَجِبۡ لَكُمۡ ۚ إِنَّ ٱلَّذِینَ یَسۡتَكۡبِرُونَ عَنۡ عِبَادَتِی سَیَدۡخُلُونَ جَهَنَّمَ دَاخِرِینَ ۝٦٠
سورة غافر
""")

# 6. ayahHadithSeventeenSeven_1: 25:77 - fix plain Arabic
replace_field(f17, 'ayahHadithSeventeenSeven_1', """\
قُلۡ مَا یَعۡبَؤُا۟ بِكُمۡ رَبِّی لَوۡلَا دُعَاۤؤُكُمۡ ۖ ۝٧٧
سورة الفرقان
""")

# 7. ayahHadithSeventeenSeven_2: 4:28 fragment
replace_field(f17, 'ayahHadithSeventeenSeven_2', """\
( وَخُلِقَ ٱلۡإِنسَـٰنُ ضَعِیفࣰا )
""")

# 8. ayahHadithSeventeenSeven_3: has ۝, fix * المعارج -> سورة المعارج
replace_field(f17, 'ayahHadithSeventeenSeven_3', """\
۞ إِنَّ ٱلۡإِنسَـٰنَ خُلِقَ هَلُوعًا ۝١٩
إِذَا مَسَّهُ ٱلشَّرُّ جَزُوعࣰا ۝٢٠
وَإِذَا مَسَّهُ ٱلۡخَیۡرُ مَنُوعًا ۝٢١
إِلَّا ٱلۡمُصَلِّینَ ۝٢٢
سورة المعارج
""")

# 9. ayahHadithSeventeenNine_1: 4:28 fragment (same as Seven_2)
replace_field(f17, 'ayahHadithSeventeenNine_1', """\
( وَخُلِقَ ٱلۡإِنسَـٰنُ ضَعِیفࣰا )
""")

# 10. ayahHadithSeventeenTen_1: 20:45 + 20:46 + 26:61-62
replace_field(f17, 'ayahHadithSeventeenTen_1', """\
قَالَا رَبَّنَاۤ إِنَّنَا نَخَافُ أَن یَفۡرُطَ عَلَیۡنَاۤ أَوۡ أَن یَطۡغَىٰ ۝٤٥
سورة طه

قَالَ لَا تَخَافَاۤ ۖ إِنَّنِی مَعَكُمَاۤ أَسۡمَعُ وَأَرَىٰ ۝٤٦
سورة طه

فَلَمَّا تَرَٰٓءَا ٱلۡجَمۡعَانِ قَالَ أَصۡحَـٰبُ مُوسَىٰۤ إِنَّا لَمُدۡرَكُونَ ۝٦١
قَالَ كَلَّاۤ ۖ إِنَّ مَعِیَ رَبِّی سَیَهۡدِینِ ۝٦٢
سورة الشعراء
""")

# 11. ayahHadithSeventeenThirteen_1: 2:186
replace_field(f17, 'ayahHadithSeventeenThirteen_1', """\
وَإِذَا سَأَلَكَ عِبَادِی عَنِّی فَإِنِّی قَرِیبࣱ ۖ أُجِیبُ دَعۡوَةَ ٱلدَّاعِ إِذَا دَعَانِ ۖ فَلۡیَسۡتَجِیبُوا۟ لِی وَلۡیُؤۡمِنُوا۟ بِی لَعَلَّهُمۡ یَرۡشُدُونَ ۝١٨٦
سورة البقرة
""")

# 12. ayahHadithSeventeenFifteen_1: 19:4 fragment
replace_field(f17, 'ayahHadithSeventeenFifteen_1', """\
وَلَمۡ أَكُنۢ بِدُعَآئِكَ رَبِّ شَقِیࣰّا ۝٤
سورة مريم
""")

# 13. ayahHadithSeventeenEighteen_1: 25:77
replace_field(f17, 'ayahHadithSeventeenEighteen_1', """\
قُلۡ مَا یَعۡبَؤُا۟ بِكُمۡ رَبِّی لَوۡلَا دُعَاۤؤُكُمۡ ۖ ۝٧٧
سورة الفرقان
""")

# 14. ayahHadithSeventeenTwenty_1: 54:10
replace_field(f17, 'ayahHadithSeventeenTwenty_1', """\
فَدَعَا رَبَّهُۥۤ أَنِّی مَغۡلُوبࣱ فَٱنتَصِرۡ ۝١٠
سورة القمر
""")

# 15. ayahHadithSeventeenTwenty_2: 70:23
replace_field(f17, 'ayahHadithSeventeenTwenty_2', """\
ٱلَّذِینَ هُمۡ عَلَىٰ صَلَاتِهِمۡ دَاۤئِمُونَ ۝٢٣
سورة المعارج
""")

print("\nDone!")
