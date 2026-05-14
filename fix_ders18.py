#!/usr/bin/env python3
"""Fix ayahHadith fields in ders 18: Uthmani tashkeel + ۝ numbering."""

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

f18 = BASE + 'elm_text_ders_eighteen.dart'

print("=== Ders 18 ===")

# 1. ayahHadithEighteenTwo_1: 10:65
replace_field(f18, 'ayahHadithEighteenTwo_1', """\
وَلَا يَحۡزُنكَ قَوۡلُهُمۡ ۘ إِنَّ ٱلۡعِزَّةَ لِلَّهِ جَمِيعًا ۚ هُوَ ٱلسَّمِيعُ ٱلۡعَلِيمُ ۝٦٥
سورة يونس
""")

# 2. ayahHadithEighteenTwo_2: 35:10 partial
replace_field(f18, 'ayahHadithEighteenTwo_2', """\
مَن كَانَ يُرِيدُ ٱلۡعِزَّةَ فَلِلَّهِ ٱلۡعِزَّةُ جَمِيعًا ۚ إِلَيۡهِ يَصۡعَدُ ٱلۡكَلِمُ ٱلطَّيِّبُ وَٱلۡعَمَلُ ٱلصَّـٰلِحُ يَرۡفَعُهُۥ ۚ ۝١٠
سورة فاطر
""")

# 3. ayahHadithEighteenThree_1: 21:18 + 8:36
replace_field(f18, 'ayahHadithEighteenThree_1', """\
بَلۡ نَقۡذِفُ بِٱلۡحَقِّ عَلَى ٱلۡبَـٰطِلِ فَيَدۡمَغُهُۥ فَإِذَا هُوَ زَاهِقࣱ ۚ وَلَكُمُ ٱلۡوَيۡلُ مِمَّا تَصِفُونَ ۝١٨
سورة الأنبياء

صدق الله العظيم القائل ايضا

إِنَّ ٱلَّذِينَ كَفَرُوا۟ يُنفِقُونَ أَمۡوَ ٰلَهُمۡ لِيَصُدُّوا۟ عَن سَبِيلِ ٱللَّهِ ۚ فَسَيُنفِقُونَهَا ثُمَّ تَكُونُ عَلَيۡهِمۡ حَسۡرَةࣰ ثُمَّ يُغۡلَبُونَ ۗ وَٱلَّذِينَ كَفَرُوٓا۟ إِلَىٰ جَهَنَّمَ يُحۡشَرُونَ ۝٣٦
سورة الأنفال
""")

# 4. ayahHadithEighteenFour_1: 12:22
replace_field(f18, 'ayahHadithEighteenFour_1', """\
وَلَمَّا بَلَغَ أَشُدَّهُۥٓ ءَاتَيۡنَـٰهُ حُكۡمࣰا وَعِلۡمࣰا ۚ وَكَذَٰلِكَ نَجۡزِی ٱلۡمُحۡسِنِينَ ۝٢٢
سورة يوسف
""")

# 5. ayahHadithEighteenFour_2: 19:96
replace_field(f18, 'ayahHadithEighteenFour_2', """\
إِنَّ ٱلَّذِينَ ءَامَنُوا۟ وَعَمِلُوا۟ ٱلصَّـٰلِحَـٰتِ سَيَجۡعَلُ لَهُمُ ٱلرَّحۡمَـٰنُ وُدࣰّا ۝٩٦
سورة مريم
""")

# 6. ayahHadithEighteenSix_1: 16:97 partial
replace_field(f18, 'ayahHadithEighteenSix_1', """\
مَنۡ عَمِلَ صَـٰلِحࣰا مِّن ذَكَرٍ أَوۡ أُنثَىٰ وَهُوَ مُؤۡمِنࣱ فَلَنُحۡیِيَنَّهُۥ حَيَوٰةࣰ طَيِّبَةࣰ ۖ ۝٩٧
سورة النحل
""")

# 7. ayahHadithEighteenNine_1: 42:14 partial
replace_field(f18, 'ayahHadithEighteenNine_1', """\
وَمَا تَفَرَّقُوٓا۟ إِلَّا مِنۢ بَعۡدِ مَا جَآءَهُمُ ٱلۡعِلۡمُ بَغۡيَۢا بَيۡنَهُمۡ ۚ ۝١٤
سورة الشورى

        ( بَغۡيَۢا بَيۡنَهُمۡ )
""")

# 8. ayahHadithEighteenEleven_1: 37:99 fragment
replace_field(f18, 'ayahHadithEighteenEleven_1', """\
إِنِّی ذَاهِبٌ إِلَىٰ رَبِّی سَيَهۡدِينِ ۝٩٩
سورة الصافات
""")

# 9. ayahHadithEighteenEleven_2: 37:99 fragment
replace_field(f18, 'ayahHadithEighteenEleven_2', """\
إِنِّی ذَاهِبٌ إِلَىٰ رَبِّی ۝٩٩
سورة الصافات
""")

# 10. ayahHadithEighteenEleven_3: 37:99 fragment
replace_field(f18, 'ayahHadithEighteenEleven_3', """\
إِنِّی ذَاهِبٌ إِلَىٰ رَبِّی سَيَهۡدِينِ ۝٩٩
سورة الصافات
""")

# 11. ayahHadithEighteenTwelve_1: 14:5 fragment
replace_field(f18, 'ayahHadithEighteenTwelve_1', """\
وَذَكِّرۡهُم بِأَيَّىٰمِ ٱللَّهِ ۝٥
سورة إبراهيم
""")

# 12. ayahHadithEighteenFourteen_1: 18:103-104
replace_field(f18, 'ayahHadithEighteenFourteen_1', """\
قُلۡ هَلۡ نُنَبِّئُكُم بِٱلۡأَخۡسَرِينَ أَعۡمَـٰلًا ۝١٠٣
ٱلَّذِينَ ضَلَّ سَعۡيُهُمۡ فِی ٱلۡحَيَوٰةِ ٱلدُّنۡيَا وَهُمۡ يَحۡسَبُونَ أَنَّهُمۡ يُحۡسِنُونَ صُنۡعًا ۝١٠٤
سورة الكهف
""")

# 13. ayahHadithEighteenFourteen_2: 35:8 partial
replace_field(f18, 'ayahHadithEighteenFourteen_2', """\
أَفَمَن زُيِّنَ لَهُۥ سُوٓءُ عَمَلِهِۦ فَرَءَاهُ حَسَنࣰا ۖ ۝٨
سورة فاطر
""")

# 14. ayahHadithEighteenFifteen_1: 35:8 partial (same)
replace_field(f18, 'ayahHadithEighteenFifteen_1', """\
أَفَمَن زُيِّنَ لَهُۥ سُوٓءُ عَمَلِهِۦ فَرَءَاهُ حَسَنࣰا ۖ ۝٨
سورة فاطر
""")

# 15. ayahHadithEighteenTwentySix_1: 8:24 partial
replace_field(f18, 'ayahHadithEighteenTwentySix_1', """\
يَـٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُوا۟ ٱسۡتَجِيبُوا۟ لِلَّهِ وَلِلرَّسُولِ إِذَا دَعَاكُمۡ لِمَا يُحۡيِيكُمۡ ۖ ۝٢٤
سورة الأنفال
""")

# 16. ayahHadithEighteenTwentySix_2: 32:21
replace_field(f18, 'ayahHadithEighteenTwentySix_2', """\
وَلَنُذِيقَنَّهُم مِّنَ ٱلۡعَذَابِ ٱلۡأَدۡنَىٰ دُونَ ٱلۡعَذَابِ ٱلۡأَكۡبَرِ لَعَلَّهُمۡ يَرۡجِعُونَ ۝٢١
سورة السجدة
""")

# 17. ayahHadithEighteenTwentySeven_1: 33:33 fragment
replace_field(f18, 'ayahHadithEighteenTwentySeven_1', """\
وَلَا تَبَرَّجۡنَ تَبَرُّجَ ٱلۡجَـٰهِلِيَّةِ ٱلۡأُولَىٰ ۖ ۝٣٣
سورة الأحزاب
""")

# 18. ayahHadithEighteenTwentySeven_2: 4:7
replace_field(f18, 'ayahHadithEighteenTwentySeven_2', """\
لِّلرِّجَالِ نَصِيبࣱ مِّمَّا تَرَكَ ٱلۡوَ ٰلِدَانِ وَٱلۡأَقۡرَبُونَ وَلِلنِّسَآءِ نَصِيبࣱ مِّمَّا تَرَكَ ٱلۡوَ ٰلِدَانِ وَٱلۡأَقۡرَبُونَ مِمَّا قَلَّ مِنۡهُ أَوۡ كَثُرَ ۚ نَصِيبࣰا مَّفۡرُوضࣰا ۝٧
سورة النساء
""")

print("\nDone!")
