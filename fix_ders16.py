#!/usr/bin/env python3
"""Fix ayahHadith fields in ders 16: Uthmani tashkeel + ۝ numbering."""

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

f16 = BASE + 'elm_text_ders_sixteen.dart'

print("=== Ders 16 ===")

# 1. ayahHadithSixteenOne_1: 9:30 partial - ذَٰلِكَ قَوْلُهُم بِأَفْوَٰهِهِمْ ۖ
replace_field(f16, 'ayahHadithSixteenOne_1', """\
 ذَٰلِكَ قَوْلُهُم بِأَفْوَٰهِهِمْ ۖ ۝٣٠
سورة التوبة
""")

# 2. ayahHadithSixteenThree_1: 57:12 partial - يَوْمَ تَرَى ٱلْمُؤْمِنِينَ وَٱلْمُؤْمِنَٰتِ يَسْعَىٰ نُورُهُم بَيْنَ أَيْدِيهِمْ
replace_field(f16, 'ayahHadithSixteenThree_1', """\
يَوْمَ تَرَى ٱلْمُؤْمِنِينَ وَٱلْمُؤْمِنَٰتِ يَسْعَىٰ نُورُهُم بَيْنَ أَيْدِيهِمْ ۝١٢
سورة الحديد
""")

# 3. ayahHadithSixteenThree_2: 57:12 partial + 3:193 + 3:194 + 3:195 partial
replace_field(f16, 'ayahHadithSixteenThree_2', """\
يَوْمَ تَرَى ٱلْمُؤْمِنِينَ وَٱلْمُؤْمِنَٰتِ ۝١٢
سورة الحديد

وقال تعالى
رَّبَّنَآ إِنَّنَا سَمِعْنَا مُنَادِيࣰا يُنَادِی لِلۡإِيمَـٰنِ أَنۡ ءَامِنُوا۟ بِرَبِّكُمۡ فَـَٔامَنَّا ۚ رَبَّنَا فَٱغۡفِرۡ لَنَا ذُنُوبَنَا وَكَفِّرۡ عَنَّا سَيِّـَٔاتِنَا وَتَوَفَّنَا مَعَ ٱلۡأَبۡرَارِ ۝١٩٣
رَبَّنَا وَءَاتِنَا مَا وَعَدتَّنَا عَلَىٰ رُسُلِكَ وَلَا تُخۡزِنَا يَوۡمَ ٱلۡقِيَـٰمَةِ ۗ إِنَّكَ لَا تُخۡلِفُ ٱلۡمِيعَادَ ۝١٩٤
فَٱسۡتَجَابَ لَهُمۡ رَبُّهُمۡ أَنِّی لَآ أُضِيعُ عَمَلَ عَـٰمِلࣲ مِّنكُم مِّن ذَكَرٍ أَوۡ أُنثَىٰ ۖ بَعۡضُكُم مِّنۢ بَعۡضࣲ ۖ ۝١٩٥
سورة آل عمران
""")

# 4. ayahHadithSixteenFour_1: 33:35 full
replace_field(f16, 'ayahHadithSixteenFour_1', """\
إِنَّ ٱلۡمُسۡلِمِينَ وَٱلۡمُسۡلِمَـٰتِ وَٱلۡمُؤۡمِنِينَ وَٱلۡمُؤۡمِنَـٰتِ وَٱلۡقَـٰنِتِينَ وَٱلۡقَـٰنِتَـٰتِ وَٱلصَّـٰدِقِينَ وَٱلصَّـٰدِقَـٰتِ وَٱلصَّـٰبِرِينَ وَٱلصَّـٰبِرَٲتِ وَٱلۡخَـٰشِعِينَ وَٱلۡخَـٰشِعَـٰتِ وَٱلۡمُتَصَدِّقِينَ وَٱلۡمُتَصَدِّقَـٰتِ وَٱلصَّـٰٓئِمِينَ وَٱلصَّـٰٓئِمَـٰتِ وَٱلۡحَـٰفِظِينَ فُرُوجَهُمۡ وَٱلۡحَـٰفِظَـٰتِ وَٱلذَّٰكِرِينَ ٱللَّهَ كَثِيرࣰا وَٱلذَّٰكِرَٲتِ أَعَدَّ ٱللَّهُ لَهُم مَّغۡفِرَةࣰ وَأَجۡرًا عَظِيمࣰا ۝٣٥
سورة الأحزاب
""")

# 5. ayahHadithSixteenFive_1: 16:97 partial
replace_field(f16, 'ayahHadithSixteenFive_1', """\
مَنۡ عَمِلَ صَـٰلِحࣰا مِّن ذَكَرٍ أَوۡ أُنثَىٰ وَهُوَ مُؤۡمِنࣱ فَلَنُحۡیِيَنَّهُۥ حَيَوٰةࣰ طَيِّبَةࣰ ۖ ۝٩٧
سورة النحل
""")

# 6. ayahHadithSixteenSix_1: 3:36 partial
replace_field(f16, 'ayahHadithSixteenSix_1', """\
وَلَيْسَ ٱلذَّكَرُ كَٱلۡأُنثَىٰ ۖ ۝٣٦
سورة آل عمران
""")

# 7. ayahHadithSixteenSeven_1: 3:36 partial (same)
replace_field(f16, 'ayahHadithSixteenSeven_1', """\
وَلَيْسَ ٱلذَّكَرُ كَٱلۡأُنثَىٰ ۖ ۝٣٦
سورة آل عمران
""")

# 8. ayahHadithSixteenTen_1: 4:34 partial
replace_field(f16, 'ayahHadithSixteenTen_1', """\
فَٱلصَّـٰلِحَـٰتُ قَـٰنِتَـٰتٌ حَـٰفِظَـٰتࣱ لِّلۡغَيۡبِ بِمَا حَفِظَ ٱللَّهُ ۚ ۝٣٤
سورة النساء
""")

# 9. ayahHadithSixteenEleven_1: 3:14 partial
replace_field(f16, 'ayahHadithSixteenEleven_1', """\
زُيِّنَ لِلنَّاسِ حُبُّ ٱلشَّهَوَٰتِ مِنَ ٱلنِّسَآءِ ۗ ۝١٤
سورة آل عمران
""")

# 10. ayahHadithSixteenThirteen_1: 33:33 partial
replace_field(f16, 'ayahHadithSixteenThirteen_1', """\
وَقَرْنَ فِی بُيُوتِكُنَّ ۝٣٣
سورة الأحزاب
""")

# 11. ayahHadithSixteenThirteen_2: 28:23
replace_field(f16, 'ayahHadithSixteenThirteen_2', """\
قَالَ مَا خَطۡبُكُمَا ۖ قَالَتَا لَا نَسۡقِی حَتَّىٰ يُصۡدِرَ ٱلرِّعَآءُ ۖ وَأَبُونَا شَيۡخࣱ كَبِيرࣱ ۝٢٣
سورة القصص
""")

# 12. ayahHadithSixteenFifteen_1: 33:33 partial
replace_field(f16, 'ayahHadithSixteenFifteen_1', """\
وَلَا تَبَرَّجْنَ تَبَرُّجَ ٱلۡجَـٰهِلِيَّةِ ٱلۡأُولَىٰ ۖ ۝٣٣
سورة الأحزاب
""")

# 13. ayahHadithSixteenSeventeen_1: 33:59 partial
replace_field(f16, 'ayahHadithSixteenSeventeen_1', """\
يَـٰٓأَيُّهَا ٱلنَّبِیُّ قُل لِّأَزۡوَٰجِكَ وَبَنَاتِكَ وَنِسَآءِ ٱلۡمُؤۡمِنِينَ يُدۡنِينَ عَلَيۡهِنَّ مِن جَلَـٰبِيبِهِنَّ ۚ ۝٥٩
سورة الأحزاب
""")

# 14. ayahHadithSixteenEighteen_1: 33:32 partial
replace_field(f16, 'ayahHadithSixteenEighteen_1', """\
فَلَا تَخۡضَعۡنَ بِٱلۡقَوۡلِ فَيَطۡمَعَ ٱلَّذِی فِی قَلۡبِهِۦ مَرَضࣱ ۚ ۝٣٢
سورة الأحزاب
""")

# 15. ayahHadithSixteenTwenty_1: fragment (parentheses, keep as ref)
replace_field(f16, 'ayahHadithSixteenTwenty_1', """\
( وَقَرْنَ فِی بُيُوتِكُنَّ )
""")

# 16. ayahHadithSixteenTwenty_2: fragment (same)
replace_field(f16, 'ayahHadithSixteenTwenty_2', """\
( وَقَرْنَ فِی بُيُوتِكُنَّ )
""")

# 17. ayahHadithSixteenTwentyOne_1: 28:25 partial
replace_field(f16, 'ayahHadithSixteenTwentyOne_1', """\
قَالَتۡ إِنَّ أَبِی يَدۡعُوكَ لِيَجۡزِيَكَ أَجۡرَ مَا سَقَيۡتَ لَنَا ۚ ۝٢٥
سورة القصص
""")

# 18. ayahHadithSixteenTwentyTwo_1: 9:71 partial
replace_field(f16, 'ayahHadithSixteenTwentyTwo_1', """\
وَٱلۡمُؤۡمِنُونَ وَٱلۡمُؤۡمِنَـٰتُ بَعۡضُهُمۡ أَوۡلِيَآءُ بَعۡضࣲ ۚ ۝٧١
سورة التوبة
""")

# 19. ayahHadithSixteenTwentyThree_1: 3:195 partial
replace_field(f16, 'ayahHadithSixteenTwentyThree_1', """\
فَٱسۡتَجَابَ لَهُمۡ رَبُّهُمۡ أَنِّی لَآ أُضِيعُ عَمَلَ عَـٰمِلࣲ مِّنكُم مِّن ذَكَرٍ أَوۡ أُنثَىٰ ۖ بَعۡضُكُم مِّنۢ بَعۡضࣲ ۖ ۝١٩٥
سورة آل عمران
""")

# 20. ayahHadithSixteenTwentyThree_2: 16:97 partial
replace_field(f16, 'ayahHadithSixteenTwentyThree_2', """\
مَنۡ عَمِلَ صَـٰلِحࣰا مِّن ذَكَرٍ أَوۡ أُنثَىٰ وَهُوَ مُؤۡمِنࣱ فَلَنُحۡیِيَنَّهُۥ حَيَوٰةࣰ طَيِّبَةࣰ ۖ ۝٩٧
سورة النحل
""")

print("\nDone!")
