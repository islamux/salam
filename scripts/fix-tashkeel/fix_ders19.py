#!/usr/bin/env python3
"""Fix ayahHadith fields in ders 19: Uthmani tashkeel + ۝ numbering."""

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

f19 = BASE + 'elm_text_ders_nineteen.dart'

print("=== Ders 19 ===")

# 1. ayahHadithNineteenOne_1: 2:257
replace_field(f19, 'ayahHadithNineteenOne_1', """\
ٱللَّهُ وَلِیُّ ٱلَّذِینَ ءَامَنُوا۟ یُخۡرِجُهُم مِّنَ ٱلظُّلُمَـٰتِ إِلَى ٱلنُّورِ ۖ وَٱلَّذِینَ كَفَرُوٓا۟ أَوۡلِیَآؤُهُمُ ٱلطَّـٰغُوتُ یُخۡرِجُونَهُم مِّنَ ٱلنُّورِ إِلَى ٱلظُّلُمَـٰتِ ۗ أُو۟لَـٰۤئِكَ أَصۡحَـٰبُ ٱلنَّارِ ۖ هُمۡ فِیهَا خَـٰلِدُونَ ۝٢٥٧
سورة البقرة
""")

# 2. ayahHadithNineteenTwo_1: 10:62
replace_field(f19, 'ayahHadithNineteenTwo_1', """\
أَلَاۤ إِنَّ أَوۡلِیَآءَ ٱللَّهِ لَا خَوۡفٌ عَلَیۡهِمۡ وَلَا هُمۡ یَحۡزَنُونَ ۝٦٢
سورة يونس
""")

# 3. ayahHadithNineteenFour_2: 70:19-22
replace_field(f19, 'ayahHadithNineteenFour_2', """\
إِنَّ ٱلۡإِنسَـٰنَ خُلِقَ هَلُوعًا ۝١٩
إِذَا مَسَّهُ ٱلشَّرُّ جَزُوعࣰا ۝٢٠
وَإِذَا مَسَّهُ ٱلۡخَیۡرُ مَنُوعًا ۝٢١
إِلَّا ٱلۡمُصَلِّینَ ۝٢٢
سورة المعارج
""")

# 4. ayahHadithNineteenFive_1: 52:48 partial + 22:38 partial + 19:96 partial
replace_field(f19, 'ayahHadithNineteenFive_1', """\
( وَٱصۡبِرۡ لِحُكۡمِ رَبِّكَ فَإِنَّكَ بِأَعۡیُنِنَا ۖ )
( إِنَّ ٱللَّهَ یُدَٰفِعُ عَنِ ٱلَّذِینَ ءَامَنُوا۟ ۗ )
إِنَّ ٱلَّذِینَ ءَامَنُوا۟ وَعَمِلُوا۟ ٱلصَّـٰلِحَـٰتِ سَیَجۡعَلُ لَهُمُ ٱلرَّحۡمَـٰنُ وُدࣰّا
""")

# 5. ayahHadithNineteenFive_3: 10:62 fragment in parens
replace_field(f19, 'ayahHadithNineteenFive_3', """\
( أَلَاۤ إِنَّ أَوۡلِیَآءَ ٱللَّهِ لَا خَوۡفٌ عَلَیۡهِمۡ وَلَا هُمۡ یَحۡزَنُونَ )
""")

# 6. ayahHadithNineteenSix_1: 9:40 fragment + story
replace_field(f19, 'ayahHadithNineteenSix_1', """\
( لَا تَحۡزَنۡ إِنَّ ٱللَّهَ مَعَنَا )
قلت للنبي صل الله عليه وسلم وأنا في الغار
لو أن احدهم نظر تحت قدميه لأبصرنا ، فقال
(( ماظنك يا أبا بكر بأثنين الله ثالثهما ؟ ))
""")

# 7. ayahHadithNineteenSeven_1: 10:62 fragment
replace_field(f19, 'ayahHadithNineteenSeven_1', """\
( لَا خَوۡفٌ عَلَیۡهِمۡ وَلَا هُمۡ یَحۡزَنُونَ )
""")

# 8. ayahHadithNineteenSeven_2: 10:62 fragment
replace_field(f19, 'ayahHadithNineteenSeven_2', """\
( أَلَاۤ إِنَّ أَوۡلِیَآءَ ٱللَّهِ لَا خَوۡفٌ عَلَیۡهِمۡ وَلَا هُمۡ یَحۡزَنُونَ )
""")

# 9. ayahHadithNineteenSeven_3: 10:63 fragment
replace_field(f19, 'ayahHadithNineteenSeven_3', """\
( ٱلَّذِینَ ءَامَنُوا۟ وَكَانُوا۟ یَتَّقُونَ )
""")

# 10. ayahHadithNineteenEight_1: 10:63 fragment
replace_field(f19, 'ayahHadithNineteenEight_1', """\
( ٱلَّذِینَ ءَامَنُوا۟ وَكَانُوا۟ یَتَّقُونَ )
""")

# 11. ayahHadithNineteenEight_2: 32:16 fragment
replace_field(f19, 'ayahHadithNineteenEight_2', """\
( تَتَجَافَىٰ جُنُوبُهُمۡ عَنِ ٱلۡمَضَاجِعِ )
""")

# 12. ayahHadithNineteenTen_1: fragment - إنما وليكم الله
replace_field(f19, 'ayahHadithNineteenTen_1', """\
إِنَّمَا وَلِیُّكُمُ ٱللَّهُ
""")

# 13. ayahHadithNineteenTen_2: 5:55 fragment
replace_field(f19, 'ayahHadithNineteenTen_2', """\
إِنَّمَا وَلِیُّكُمُ ٱللَّهُ وَرَسُولُهُۥ
""")

# 14. ayahHadithNineteenEleven_1: fragment
replace_field(f19, 'ayahHadithNineteenEleven_1', """\
وَٱلَّذِینَ ءَامَنُوا۟
""")

# 15. ayahHadithNineteenEleven_2: 5:56
replace_field(f19, 'ayahHadithNineteenEleven_2', """\
وَمَن یَتَوَلَّ ٱللَّهَ وَرَسُولَهُۥ وَٱلَّذِینَ ءَامَنُوا۟ فَإِنَّ حِزۡبَ ٱللَّهِ هُمُ ٱلۡغَـٰلِبُونَ ۝٥٦
سورة المائدة
""")

# 16. ayahHadithNineteenTwelve_1: 5:56 partial + 40:51 partial
replace_field(f19, 'ayahHadithNineteenTwelve_1', """\
فَإِنَّ حِزۡبَ ٱللَّهِ هُمُ ٱلۡغَـٰلِبُونَ
إِنَّا لَنَنصُرُ رُسُلَنَا وَٱلَّذِینَ ءَامَنُوا۟ فِی ٱلۡحَیَوٰةِ ٱلدُّنۡیَا
""")

# 17. ayahHadithNineteenTwelve_2: 37:173 + 30:47 partial + 4:141 partial
replace_field(f19, 'ayahHadithNineteenTwelve_2', """\
وَإِنَّ جُندَنَا لَهُمُ ٱلۡغَـٰلِبُونَ

وَكَانَ حَقًّا عَلَیۡنَا نَصۡرُ ٱلۡمُؤۡمِنِینَ

وَلَن یَجۡعَلَ ٱللَّهُ لِلۡكَـٰفِرِینَ عَلَى ٱلۡمُؤۡمِنِینَ سَبِیلًا
""")

# 18. ayahHadithNineteenTwelve_3: 41:31 fragment
replace_field(f19, 'ayahHadithNineteenTwelve_3', """\
نَحۡنُ أَوۡلِیَآؤُكُمۡ فِی ٱلۡحَیَوٰةِ ٱلدُّنۡیَا وَفِی ٱلۡـَٔاخِرَةِ
""")

# 19. ayahHadithNineteenThreaten_1: 41:31 fragment
replace_field(f19, 'ayahHadithNineteenThreaten_1', """\
نَحۡنُ أَوۡلِیَآؤُكُمۡ
""")

# 20. ayahHadithNineteenThirteen_2: 41:31 fragment
replace_field(f19, 'ayahHadithNineteenThirteen_2', """\
نَحۡنُ أَوۡلِیَآؤُكُمۡ
""")

# 21. ayahHadithNineteenThirteen_3: 41:31 fragment
replace_field(f19, 'ayahHadithNineteenThirteen_3', """\
نَحۡنُ أَوۡلِیَآؤُكُمۡ فِی ٱلۡحَیَوٰةِ ٱلدُّنۡیَا
""")

# 22. ayahHadithNineteenThirteen_4: 23:115
replace_field(f19, 'ayahHadithNineteenThirteen_4', """\
أَفَحَسِبۡتُمۡ أَنَّمَا خَلَقۡنَـٰكُمۡ عَبَثࣰا وَأَنَّكُمۡ إِلَیۡنَا لَا تُرۡجَعُونَ ۝١١٥
سورة المؤمنون
""")

# 23. ayahHadithNineteenFourteen_1: 41:31 fragment
replace_field(f19, 'ayahHadithNineteenFourteen_1', """\
نَحۡنُ أَوۡلِیَآؤُكُمۡ فِی ٱلۡحَیَوٰةِ ٱلدُّنۡیَا وَفِی ٱلۡـَٔاخِرَةِ
""")

# 24. ayahHadithNineteenFourteen_2: 41:31 fragment (same)
replace_field(f19, 'ayahHadithNineteenFourteen_2', """\
نَحۡنُ أَوۡلِیَآؤُكُمۡ فِی ٱلۡحَیَوٰةِ ٱلدُّنۡیَا وَفِی ٱلۡـَٔاخِرَةِ
""")

# 25. ayahHadithNineteenFifteen_1: fragment
replace_field(f19, 'ayahHadithNineteenFifteen_1', """\
نَحۡنُ أَوۡلِیَآؤُكُمۡ
""")

# 26. ayahHadithNineteenFifteen_2: fragment
replace_field(f19, 'ayahHadithNineteenFifteen_2', """\
فِی ٱلۡحَیَوٰةِ ٱلدُّنۡیَا وَفِی ٱلۡـَٔاخِرَةِ
""")

# 27. ayahHadithNineteenSixteen_1: 41:31 fragment
replace_field(f19, 'ayahHadithNineteenSixteen_1', """\
نَحۡنُ أَوۡلِیَآؤُكُمۡ فِی ٱلۡحَیَوٰةِ ٱلدُّنۡیَا وَفِی ٱلۡـَٔاخِرَةِ
""")

# 28. ayahHadithNineteenSixteen_2: 47:11 fragment
replace_field(f19, 'ayahHadithNineteenSixteen_2', """\
ذَٰلِكَ بِأَنَّ ٱللَّهَ مَوۡلَى ٱلَّذِینَ ءَامَنُوا۟
""")

# 29. ayahHadithNineteenSixteen_3: 47:11 fragment (same)
replace_field(f19, 'ayahHadithNineteenSixteen_3', """\
ذَٰلِكَ بِأَنَّ ٱللَّهَ مَوۡلَى ٱلَّذِینَ ءَامَنُوا۟
""")

# 30. ayahHadithNineteenSixteen_4: 7:188 partial
replace_field(f19, 'ayahHadithNineteenSixteen_4', """\
قُل لَّآ أَمۡلِكُ لِنَفۡسِی نَفۡعࣰا وَلَا ضَرًّا إِلَّا مَا شَآءَ ٱللَّهُ ۚ وَلَوۡ كُنتُ أَعۡلَمُ ٱلۡغَیۡبَ لَٱسۡتَكۡثَرۡتُ مِنَ ٱلۡخَیۡرِ وَمَا مَسَّنِیَ ٱلسُّوٓءُ
""")

# 31. ayahHadithNineteenSixteen_5: 28:56
replace_field(f19, 'ayahHadithNineteenSixteen_5', """\
إِنَّكَ لَا تَهۡدِی مَنۡ أَحۡبَبۡتَ وَلَـٰكِنَّ ٱللَّهَ یَهۡدِی مَن یَشَآءُ ۚ وَهُوَ أَعۡلَمُ بِٱلۡمُهۡتَدِینَ ۝٥٦
سورة القصص
""")

# 32. ayahHadithNineteenSeventeen_1: 6:15
replace_field(f19, 'ayahHadithNineteenSeventeen_1', """\
قُلۡ إِنِّیٓ أَخَافُ إِنۡ عَصَیۡتُ رَبِّی عَذَابَ یَوۡمٍ عَظِیمࣲ ۝١٥
سورة الأنعام
""")

# 33. ayahHadithNineteenSeventeen_2: 6:50 partial
replace_field(f19, 'ayahHadithNineteenSeventeen_2', """\
قُل لَّآ أَقُولُ لَكُمۡ عِندِی خَزَاۤئِنُ ٱللَّهِ وَلَآ أَعۡلَمُ ٱلۡغَیۡبَ
""")

print("\nDone!")
