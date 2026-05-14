#!/usr/bin/env python3
"""
Fix ayahHadith fields in ders 8 and 9:
- Add ۝ numbering with Arabic-Indic digits
- Standardize surah names on their own line
- Replace plain Arabic with Tanzil.net Uthmani script
"""

import re

DERS8 = '/media/islamux/Variety/Flutter_Projects/salam/lib/core/data/static/text/elm_text_ders_eight.dart'
DERS9 = '/media/islamux/Variety/Flutter_Projects/salam/lib/core/data/static/text/elm_text_ders_nine.dart'


def replace_field_content(filepath, field_name, new_content):
    """Replace content between triple quotes for a given field."""
    with open(filepath, 'r', encoding='utf-8') as f:
        text = f.read()

    # Match: field_name = """ ... """;
    pattern = re.compile(
        rf'({re.escape(field_name)} = """)'
        r'.*?'
        r'(""";)',
        re.DOTALL
    )

    replacement = rf'\1\n{new_content}\2'
    new_text = pattern.sub(replacement, text)

    if new_text == text:
        print(f"  ⚠ WARNING: No match for {field_name}!")
    else:
        print(f"  ✓ Replaced {field_name}")

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_text)


# ========== DERS 8 ==========

print("=== Ders 8 ===")

# ayahHadithOne_1: 57:4 - add ۝٤ and surah name
replace_field_content(DERS8, 'ayahHadithOne_1', """\
قال تعالى 
وَهُوَ مَعَكُمۡ أَیۡنَ مَا كُنتُمۡۚ ۝٤
سورة الحديد
""")

# ayahHadithTwo_1: Multiple verses - fix ۝ numbers and surah names
replace_field_content(DERS8, 'ayahHadithTwo_1', """\
قال تعالى 
وَٱعۡلَمُوۤا۟ أَنَّ ٱللَّهَ مَعَ ٱلۡمُتَّقِینَ ۝١٩٤
سورة البقرة

قال تعالى 
وَٱللَّهُ مَعَ ٱلصَّـٰبِرِینَ ۝١٥٣
سورة البقرة

قال تعالى 
إِنَّ ٱللَّهَ مَعَ ٱلَّذِینَ ٱتَّقَوا۟ وَّٱلَّذِینَ هُم مُّحۡسِنُونَ ۝١٢٨
سورة النحل

وَإِنَّ ٱللَّهَ لَمَعَ ٱلۡمُحۡسِنِينَ ۝٦٩
سورة العنكبوت
""")

# ayahHadithThree_1: 28:7 - add ۝٧ and surah name
replace_field_content(DERS8, 'ayahHadithThree_1', """\
 قال تعالى 
فَإِذَا خِفۡتِ عَلَیۡهِ فَأَلۡقِیهِ فِی ٱلۡیَمِّ ۝٧
 سورة القصص 
""")

# ayahHadithFour_1: partial 28:7 - add Uthmani tashkeel
replace_field_content(DERS8, 'ayahHadithFour_1', """\
  فَإِذَا خِفۡتِ عَلَیۡهِ 
""")

# ayahHadithFour_2: 9:40 - add ۝٤٠ and surah name
replace_field_content(DERS8, 'ayahHadithFour_2', """\
 لَا تَحۡزَنۡ إِنَّ ٱللَّهَ مَعَنَاۖ ۝٤٠
سورة التوبة 
""")

# ayahHadithEightEight_1: 21:69 - plain Arabic -> Uthmani
replace_field_content(DERS8, 'ayahHadithEightEight_1', """\
   قُلۡنَا يَٰنَارُ كُونِى بَرۡدًۭا وَسَلَٰمًا عَلَىٰٓ إِبۡرَٰهِيمَ ۝٦٩
سورة الأنبياء
""")

# ayahHadithEightEight_2: 21:69 - plain Arabic -> Uthmani
replace_field_content(DERS8, 'ayahHadithEightEight_2', """\
  ( قُلۡنَا يَٰنَارُ كُونِى بَرۡدًۭا وَسَلَٰمًا عَلَىٰٓ إِبۡرَٰهِيمَ ۝٦٩ ) 
""")

# ayahHadithEightNine_1: 14:5 - plain Arabic -> Uthmani
replace_field_content(DERS8, 'ayahHadithEightNine_1', """\
  ( وَذَكِّرۡهُم بِأَيَّىٰمِ ٱللَّهِ ۝٥ ) 
""")

# ayahHadithEightNine_2: 65:2-3 - plain Arabic -> Uthmani
replace_field_content(DERS8, 'ayahHadithEightNine_2', """\
  ( وَمَن يَتَّقِ ٱللَّهَ يَجۡعَل لَّهُۥ مَخۡرَجࣰا ۝٢ ) 
""")

# ayahHadithEightTen_1: 21:87-88 - plain Arabic -> Uthmani
replace_field_content(DERS8, 'ayahHadithEightTen_1', """\
   فَنَادَىٰ فِى ٱلظُّلُمَٰتِ أَن لَّآ إِلَٰهَ إِلَّآ أَنتَ سُبۡحَٰنَكَ إِنِّى كُنتُ مِنَ ٱلظَّـٰلِمِينَ ۝٨٧فَٱسۡتَجَبۡنَا لَهُۥ وَنَجَّيۡنَٰهُ مِنَ ٱلۡغَمِّ ۝٨٨
سورة الأنبياء
""")

# ayahHadithEightTen_2: 21:88 partial - plain Arabic -> Uthmani
replace_field_content(DERS8, 'ayahHadithEightTen_2', """\
  ( وَكَذَٰلِكَ نُۨجِى ٱلۡمُؤۡمِنِينَ ۝٨٨ ) 
""")


# ========== DERS 9 ==========

print("\n=== Ders 9 ===")

# ayahHadithNineOne_1: 93:9-10 - has Uthmani but needs ۝ and surah name
# Current: فَأَمَّا ٱلۡیَتِیمَ فَلَا تَقۡهَرۡ  with ---- separator
replace_field_content(DERS9, 'ayahHadithNineOne_1', """\
فَأَمَّا ٱلۡیَتِیمَ فَلَا تَقۡهَرۡ ۝٩
سورة الضحى
""")

# ayahHadithNineOne_2: 93:9-10 - already good, keep as-is
# (already has ۝٩, ۝١٠, and سورة الضحى)

# ayahHadithNineTwo_1: 107:1-2 - already good, keep as-is

# ayahHadithNineThree_1: 4:5 - partial, add ۝ and surah name
replace_field_content(DERS9, 'ayahHadithNineThree_1', """\
قال تعالى 
  وَٱرۡزُقُوهُمۡ فِیهَا ۝٥
سورة النساء 
""")

# ayahHadithNineFour_1: 4:2 - partial, add ۝ and surah name
replace_field_content(DERS9, 'ayahHadithNineFour_1', """\
 يقول الله عز وجل 
وَءَاتُوا۟ ٱلۡیَتَـٰمَىٰۤ أَمۡوَ ٰلَهُمۡ ۝٢
سورة النساء 
""")

# ayahHadithNineFive_1: 4:6 - add ۝ number and surah name
replace_field_content(DERS9, 'ayahHadithNineFive_1', """\
قال تعالى
  فَإِنۡ ءَانَسۡتُم مِّنۡهُمۡ رُشۡدࣰا فَٱدۡفَعُوۤا۟ إِلَیۡهِمۡ أَمۡوَ ٰلَهُمۡۖ ۝٦
 سورة النساء 
""")

# ayahHadithNineSix_1: 4:2 partial - plain Arabic -> Uthmani
replace_field_content(DERS9, 'ayahHadithNineSix_1', """\
وَلَا تَتَبَدَّلُوا۟ ٱلۡخَبِيثَ بِٱلطَّيِّبِ ۝٢
سورة النساء 
""")

# ayahHadithNineSix_2: 2:188 - plain Arabic -> Uthmani
replace_field_content(DERS9, 'ayahHadithNineSix_2', """\
وَلَا تَأۡكُلُوٓا۟ أَمۡوَٰلَكُم بَيۡنَكُم بِٱلۡبَٰطِلِ ۝١٨٨
سورة البقرة
""")

# ayahHadithNineSeven_1: 4:2 partial - add ۝ and surah name
replace_field_content(DERS9, 'ayahHadithNineSeven_1', """\
 وَلَا تَأۡكُلُوۤا۟ أَمۡوَ ٰلَهُمۡ إِلَىٰۤ أَمۡوَ ٰلِكُمۡۚ ۝٢
سورة النساء 
""")

# ayahHadithNineSeven_2: 4:2 - already has ۝٢, fix surah name format
replace_field_content(DERS9, 'ayahHadithNineSeven_2', """\
قال تعالى 
 وَلَا تَأۡكُلُوۤا۟ أَمۡوَ ٰلَهُمۡ إِلَىٰۤ أَمۡوَ ٰلِكُمۡۚ إِنَّهُۥ كَانَ حُوبࣰا كَبِیرࣰا ۝٢ 
 سورة النساء 
""")

# ayahHadithNineEight_1: 2:220 partial - plain Arabic -> Uthmani
replace_field_content(DERS9, 'ayahHadithNineEight_1', """\
 وَيَسۡـَٔلُونَكَ عَنِ ٱلۡيَتَٰمَىٰ ۝٢٢٠
سورة البقرة
""")

# ayahHadithNineNine_1: 2:220 partial - add ۝ and surah name
replace_field_content(DERS9, 'ayahHadithNineNine_1', """\
 قال تعالى
    وَیَسۡءَلُونَكَ عَنِ ٱلۡیَتَـٰمَىٰۖ قُلۡ إِصۡلَاحࣱ لَّهُمۡ خَیۡرࣱۖ ۝٢٢٠
 سورة البقرة 
""")

# ayahHadithNineNine_2: Hadith - add tashkeel, no ۝/surah
replace_field_content(DERS9, 'ayahHadithNineNine_2', """\
أحد الصحابة *
سأل النبي صلى الله عليه وسلم
 عندي يتيم أفأضربه؟ فقال عليه الصلاة والسلام: «مما تضرب منه ولدك» 
""")

# ayahHadithNineTen_1: 4:10 - already has ۝١٠, fix surah name
replace_field_content(DERS9, 'ayahHadithNineTen_1', """\
قال تعالى 
إِنَّ ٱلَّذِینَ یَأۡكُلُونَ أَمۡوَ ٰلَ ٱلۡیَتَـٰمَىٰ ظُلۡمًا إِنَّمَا یَأۡكُلُونَ فِی بُطُونِهِمۡ نَارࣰاۖ وَسَیَصۡلَوۡنَ سَعِیرࣰا ۝١٠
 سورة النساء 
""")

# ayahHadithNineTen_2: 6:152 - add ۝١٥٢ and surah name
replace_field_content(DERS9, 'ayahHadithNineTen_2', """\
قال تعالى 
وَلَا تَقۡرَبُوا۟ مَالَ ٱلۡیَتِیمِ ۝١٥٢
   سورة الأنعام
""")

print("\nDone!")
