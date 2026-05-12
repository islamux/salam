#!/usr/bin/env python3
"""Fix ayahHadith fields in ders 20: Uthmani tashkeel + ۝ numbering."""

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

f20 = BASE + 'elm_text_ders_twenty.dart'

print("=== Ders 20 ===")

# 1. ayahHadithTwentyOne1: 2:21
replace_field(f20, 'ayahHadithTwentyOne1', """\
يَـٰٓأَيُّهَا ٱلنَّاسُ ٱعۡبُدُوا۟ رَبَّكُمُ ٱلَّذِی خَلَقَكُمۡ وَٱلَّذِینَ مِن قَبۡلِكُمۡ لَعَلَّكُمۡ تَتَّقُونَ ۝٢١
سورة البقرة
""")

# 2. ayahHadithTwentyOne_2: 2:21
replace_field(f20, 'ayahHadithTwentyOne_2', """\
يَـٰٓأَيُّهَا ٱلنَّاسُ ٱعۡبُدُوا۟ رَبَّكُمُ ٱلَّذِی خَلَقَكُمۡ وَٱلَّذِینَ مِن قَبۡلِكُمۡ لَعَلَّكُمۡ تَتَّقُونَ ۝٢١
سورة البقرة
""")

# 3. ayahHadithTwentyTwo_1: 2:21
replace_field(f20, 'ayahHadithTwentyTwo_1', """\
يَـٰٓأَيُّهَا ٱلنَّاسُ ٱعۡبُدُوا۟ رَبَّكُمُ ٱلَّذِی خَلَقَكُمۡ وَٱلَّذِینَ مِن قَبۡلِكُمۡ لَعَلَّكُمۡ تَتَّقُونَ ۝٢١
سورة البقرة
""")

# 4. ayahHadithTwentyThree_1: 9:109 fragment
replace_field(f20, 'ayahHadithTwentyThree_1', """\
أَفَمَنۡ أَسَّسَ بُنۡيَـٰنَهُۥ
""")

# 5. ayahHadithTwentyFour_1: 2:255 fragment
replace_field(f20, 'ayahHadithTwentyFour_1', """\
ٱللَّهُ لَآ إِلَـٰهَ إِلَّا هُوَ ٱلۡحَیُّ ٱلۡقَیُّومُ
""")

# 6. ayahHadithTwentyFive_1: 16:52 partial + 68:36 partial
replace_field(f20, 'ayahHadithTwentyFive_1', """\
أَفَغَیۡرَ ٱللَّهِ تَتَّقُونَ
فَمَا لَكُمۡ كَیۡفَ تَحۡكُمُونَ
""")

# 7. ayahHadithTwentyFive_2: 11:55-56 partial
replace_field(f20, 'ayahHadithTwentyFive_2', """\
فَكِیدُونِی جَمِیعࣰا ثُمَّ لَا تُنظِرُونِ
إِنِّی تَوَكَّلۡتُ عَلَى ٱللَّهِ رَبِّی وَرَبِّكُم ۚ مَّا مِن دَاۤبَّةٍ إِلَّا هُوَ ءَاخِذُۢ بِنَاصِیَتِهَاۤ
""")

# 8. ayahHadithTwentyFive_3: 11:123 fragment
replace_field(f20, 'ayahHadithTwentyFive_3', """\
وَإِلَیۡهِ یُرۡجَعُ ٱلۡأَمۡرُ كُلُّهُۥ
""")

# 9. ayahHadithTwentyFive_4: 35:2 fragment
replace_field(f20, 'ayahHadithTwentyFive_4', """\
مَا یَفۡتَحِ ٱللَّهُ لِلنَّاسِ مِن رَّحۡمَةࣲ فَلَا مُمۡسِكَ لَهَا
""")

# 10. ayahHadithTwentySix_1: 7:54 fragment
replace_field(f20, 'ayahHadithTwentySix_1', """\
أَلَا لَهُ ٱلۡخَلۡقُ وَٱلۡأَمۡرُ
""")

# 11. ayahHadithTwentySix_2: 48:10 fragment
replace_field(f20, 'ayahHadithTwentySix_2', """\
یَدُ ٱللَّهِ فَوۡقَ أَیۡدِیهِمۡ
""")

# 12. ayahHadithTwentySix_3: 16:52 fragment
replace_field(f20, 'ayahHadithTwentySix_3', """\
أَفَغَیۡرَ ٱللَّهِ تَتَّقُونَ
""")

# 13. ayahHadithTwentySeven_1: 2:194 partial
replace_field(f20, 'ayahHadithTwentySeven_1', """\
وَٱتَّقُوا۟ ٱللَّهَ وَٱعۡلَمُوٓا۟ أَنَّ ٱللَّهَ مَعَ ٱلۡمُتَّقِینَ ۝١٩٤
سورة البقرة
""")

# 14. ayahHadithTwentySeven_2: 2:231 + 5:4 + 2:203
replace_field(f20, 'ayahHadithTwentySeven_2', """\
وَٱتَّقُوا۟ ٱللَّهَ وَٱعۡلَمُوٓا۟ أَنَّ ٱللَّهَ بِكُلِّ شَیۡءٍ عَلِیمࣱ ۝٢٣١
سورة البقرة

وَٱتَّقُوا۟ ٱللَّهَ ۚ إِنَّ ٱللَّهَ سَرِیعُ ٱلۡحِسَابِ ۝٤
سورة المائدة

وَٱتَّقُوا۟ ٱللَّهَ وَٱعۡلَمُوٓا۟ أَنَّكُمۡ إِلَیۡهِ تُحۡشَرُونَ ۝٢٠٣
سورة البقرة
""")

# 15. ayahHadithTwentySeven_3: 6:11
replace_field(f20, 'ayahHadithTwentySeven_3', """\
قُلۡ سِیرُوا۟ فِی ٱلۡأَرۡضِ ثُمَّ ٱنظُرُوا۟ كَیۡفَ كَانَ عَـٰقِبَةُ ٱلۡمُكَذِّبِینَ ۝١١
سورة الأنعام
""")

# 16. ayahHadithTwentyNine_1: 2:282
replace_field(f20, 'ayahHadithTwentyNine_1', """\
وَٱتَّقُوا۟ ٱللَّهَ ۖ وَیُعَلِّمُكُمُ ٱللَّهُ ۝٢٨٢
سورة البقرة
""")

# 17. ayahHadithTwentyNine_2: 16:52 fragment
replace_field(f20, 'ayahHadithTwentyNine_2', """\
أَفَغَیۡرَ ٱللَّهِ تَتَّقُونَ
""")

# 18. ayahHadithTwentyEleven_1: 9:4 fragment
replace_field(f20, 'ayahHadithTwentyEleven_1', """\
إِنَّ ٱللَّهَ یُحِبُّ ٱلۡمُتَّقِینَ
""")

# 19. ayahHadithTwentyTwelve_1: same
replace_field(f20, 'ayahHadithTwentyTwelve_1', """\
إِنَّ ٱللَّهَ یُحِبُّ ٱلۡمُتَّقِینَ
""")

# 20. ayahHadithTwentyThirteen_1: 57:4 fragment
replace_field(f20, 'ayahHadithTwentyThirteen_1', """\
وَهُوَ مَعَكُمۡ أَیۡنَ مَا كُنتُمۡ
""")

# 21. ayahHadithTwentyFourteen_1: 2:194 fragment
replace_field(f20, 'ayahHadithTwentyFourteen_1', """\
إِنَّ ٱللَّهَ مَعَ ٱلۡمُتَّقِینَ
""")

# 22. ayahHadithTwentyFourteen_2: 45:19 + repeats
replace_field(f20, 'ayahHadithTwentyFourteen_2', """\
وَٱللَّهُ وَلِیُّ ٱلۡمُتَّقِینَ
إِنَّ ٱللَّهَ یُحِبُّ ٱلۡمُتَّقِینَ
إِنَّ ٱللَّهَ مَعَ ٱلۡمُتَّقِینَ
وَٱللَّهُ وَلِیُّ ٱلۡمُتَّقِینَ
""")

# 23. ayahHadithTwentyFifteen_1: 38:28 partial
replace_field(f20, 'ayahHadithTwentyFifteen_1', """\
أَمۡ نَجۡعَلُ ٱلۡمُتَّقِینَ كَٱلۡفُجَّارِ ۝٢٨
سورة ص
""")

# 24. ayahHadithTwentySeventeen_1: 8:29 partial
replace_field(f20, 'ayahHadithTwentySeventeen_1', """\
یَـٰٓأَیُّهَا ٱلَّذِینَ ءَامَنُوٓا۟ إِن تَتَّقُوا۟ ٱللَّهَ یَجۡعَل لَّكُمۡ فُرۡقَانࣰا ۝٢٩
سورة الأنفال
""")

# 25. ayahHadithTwentyTwenty_1: 17:17 partial
replace_field(f20, 'ayahHadithTwentyTwenty_1', """\
وَكَفَىٰ بِرَبِّكَ بِذُنُوبِ عِبَادِهِۦ خَبِیرَۢا بَصِیرࣰا ۝١٧
سورة الإسراء
""")

# 26. ayahHadithTwentyTwenty_2: 53:32 partial
replace_field(f20, 'ayahHadithTwentyTwenty_2', """\
فَلَا تُزَكُّوٓا۟ أَنفُسَكُمۡ ۖ هُوَ أَعۡلَمُ بِمَنِ ٱتَّقَىٰ ۝٣٢
سورة النجم
""")

# 27. ayahHadithTwentyTwenty_3: 2:197 partial
replace_field(f20, 'ayahHadithTwentyTwenty_3', """\
وَتَزَوَّدُوا۟ فَإِنَّ خَیۡرَ ٱلزَّادِ ٱلتَّقۡوَىٰ ۚ ۝١٩٧
سورة البقرة
""")

# 28. ayahHadithTwentyTwentyThree_1: 7:26 fragment
replace_field(f20, 'ayahHadithTwentyTwentyThree_1', """\
وَلِبَاسُ ٱلتَّقۡوَىٰ ذَٰلِكَ خَیۡرࣱ
""")

# 29. ayahHadithTwentyTwentyThree_2: same
replace_field(f20, 'ayahHadithTwentyTwentyThree_2', """\
وَلِبَاسُ ٱلتَّقۡوَىٰ ذَٰلِكَ خَیۡرࣱ
""")

# 30. ayahHadithTwentyTwentyFour_2: 7:26 + 2:197 fragments
replace_field(f20, 'ayahHadithTwentyTwentyFour_2', """\
وَلِبَاسُ ٱلتَّقۡوَىٰ ذَٰلِكَ خَیۡرࣱ
وَتَزَوَّدُوا۟ فَإِنَّ خَیۡرَ ٱلزَّادِ ٱلتَّقۡوَىٰ ۚ
""")

# 31. ayahHadithTwentyTwentySix_1: 3:142
replace_field(f20, 'ayahHadithTwentyTwentySix_1', """\
أَمۡ حَسِبۡتُمۡ أَن تَدۡخُلُوا۟ ٱلۡجَنَّةَ وَلَمَّا یَعۡلَمِ ٱللَّهُ ٱلَّذِینَ جَـٰهَدُوا۟ مِنكُمۡ وَیَعۡلَمَ ٱلصَّـٰبِرِینَ ۝١٤٢
سورة آل عمران
""")

# 32. ayahHadithTwentyTwentySeven_1: 92:17
replace_field(f20, 'ayahHadithTwentyTwentySeven_1', """\
وَسَیُجَنَّبُهَا ٱلۡأَتۡقَى ۝١٧
سورة الليل
""")

# 33. ayahHadithTwentyTwentySeven_2: 92:18
replace_field(f20, 'ayahHadithTwentyTwentySeven_2', """\
ٱلَّذِی یُؤۡتِی مَالَهُۥ یَتَزَكَّىٰ ۝١٨
سورة الليل
""")

# 34. ayahHadithTwentyTwentySeven_3: 92:17-18
replace_field(f20, 'ayahHadithTwentyTwentySeven_3', """\
وَسَیُجَنَّبُهَا ٱلۡأَتۡقَى ۝١٧
ٱلَّذِی یُؤۡتِی مَالَهُۥ یَتَزَكَّىٰ ۝١٨
سورة الليل
""")

# 35. ayahHadithTwentyTwentyEight_1: 2:179
replace_field(f20, 'ayahHadithTwentyTwentyEight_1', """\
وَلَكُمۡ فِی ٱلۡقِصَاصِ حَیَوٰةࣱ یَـٰٓأُو۟لِی ٱلۡأَلۡبَـٰبِ لَعَلَّكُمۡ تَتَّقُونَ ۝١٧٩
سورة البقرة
""")

# 36. ayahHadithTwentyTwentyEight_2: 39:61
replace_field(f20, 'ayahHadithTwentyTwentyEight_2', """\
وَیُنَجِّی ٱللَّهُ ٱلَّذِینَ ٱتَّقَوۡا۟ بِمَفَازَتِهِمۡ لَا یَمَسُّهُمُ ٱلسُّوٓءُ وَلَا هُمۡ یَحۡزَنُونَ ۝٦١
سورة الزمر
""")

# 37. ayahHadithTwentyTwentyEight_3: fragment
replace_field(f20, 'ayahHadithTwentyTwentyEight_3', """\
لَا یَمَسُّهُمُ
""")

# 38. ayahHadithTwentyTwentyNine_1: 51:15-16
replace_field(f20, 'ayahHadithTwentyTwentyNine_1', """\
إِنَّ ٱلۡمُتَّقِینَ فِی جَنَّـٰتࣲ وَعُیُونٍ ۝١٥
ءَاخِذِینَ مَاۤ ءَاتَىٰهُمۡ رَبُّهُمۡ ۚ إِنَّهُمۡ كَانُوا۟ قَبۡلَ ذَٰلِكَ مُحۡسِنِینَ ۝١٦
سورة الذاريات
""")

# 39. ayahHadithTwentyTwentyNine_2: 54:54
replace_field(f20, 'ayahHadithTwentyTwentyNine_2', """\
إِنَّ ٱلۡمُتَّقِینَ فِی جَنَّـٰتࣲ وَنَهَرࣲ ۝٥٤
سورة القمر
""")

# 40. ayahHadithTwentyTwentyNine_3: 52:17
replace_field(f20, 'ayahHadithTwentyTwentyNine_3', """\
إِنَّ ٱلۡمُتَّقِینَ فِی جَنَّـٰتࣲ وَنَعِیمٍ ۝١٧
سورة الطور
""")

# 41. ayahHadithTwentyTwentyNine_4: 77:41
replace_field(f20, 'ayahHadithTwentyTwentyNine_4', """\
إِنَّ ٱلۡمُتَّقِینَ فِی ظِلَـٰلࣲ وَعُیُونٍ ۝٤١
سورة المرسلات
""")

# 42. ayahHadithTwentyTwentyNine_5: 51:15
replace_field(f20, 'ayahHadithTwentyTwentyNine_5', """\
إِنَّ ٱلۡمُتَّقِینَ فِی جَنَّـٰتࣲ وَعُیُونٍ ۝١٥
سورة الذاريات
""")

# 43. ayahHadithTwentyTwentyNine_6: 52:17
replace_field(f20, 'ayahHadithTwentyTwentyNine_6', """\
إِنَّ ٱلۡمُتَّقِینَ فِی جَنَّـٰتࣲ وَنَعِیمٍ ۝١٧
سورة الطور
""")

# 44. ayahHadithTwentyTwentyNine_7: 7:128 fragment
replace_field(f20, 'ayahHadithTwentyTwentyNine_7', """\
وَٱلۡعَـٰقِبَةُ لِلۡمُتَّقِینَ
""")

# 45. ayahHadithTwentyTwentyNine_8: 20:132 fragment
replace_field(f20, 'ayahHadithTwentyTwentyNine_8', """\
وَٱلۡعَـٰقِبَةُ لِلتَّقۡوَىٰ
""")

# 46. ayahHadithTwentyThirty_1: 7:128 + 20:132 fragments
replace_field(f20, 'ayahHadithTwentyThirty_1', """\
وَٱلۡعَـٰقِبَةُ لِلۡمُتَّقِینَ
وَٱلۡعَـٰقِبَةُ لِلتَّقۡوَىٰ
""")

# 47. ayahHadithTwentyThirty_2: 2:63 fragment
replace_field(f20, 'ayahHadithTwentyThirty_2', """\
خُذُوا۟ مَاۤ ءَاتَیۡنَـٰكُم بِقُوَّةࣲ
""")

# 48. ayahHadithTwentyThirtyOne_1: 65:2 fragment
replace_field(f20, 'ayahHadithTwentyThirtyOne_1', """\
وَمَن یَتَّقِ ٱللَّهَ یَجۡعَل لَّهُۥ مَخۡرَجࣰا
""")

# 49. ayahHadithTwentyThirtyOne_2: same
replace_field(f20, 'ayahHadithTwentyThirtyOne_2', """\
وَمَن یَتَّقِ ٱللَّهَ یَجۡعَل لَّهُۥ مَخۡرَجࣰا
""")

# 50. ayahHadithTwentyThirtyOne_3: same
replace_field(f20, 'ayahHadithTwentyThirtyOne_3', """\
وَمَن یَتَّقِ ٱللَّهَ یَجۡعَل لَّهُۥ مَخۡرَجࣰا
""")

# 51. ayahHadithTwentyThirtyThree_1: same
replace_field(f20, 'ayahHadithTwentyThirtyThree_1', """\
وَمَن یَتَّقِ ٱللَّهَ یَجۡعَل لَّهُۥ مَخۡرَجࣰا
""")

# 52. ayahHadithTwentyThirtyThree_2: 65:2-3 partial
replace_field(f20, 'ayahHadithTwentyThirtyThree_2', """\
وَمَن یَتَّقِ ٱللَّهَ یَجۡعَل لَّهُۥ مَخۡرَجࣰا وَیَرۡزُقۡهُ مِنۡ حَیۡثُ لَا یَحۡتَسِبُ
""")

# 53. ayahHadithTwentyThirtyFour_1: same
replace_field(f20, 'ayahHadithTwentyThirtyFour_1', """\
وَمَن یَتَّقِ ٱللَّهَ یَجۡعَل لَّهُۥ مَخۡرَجࣰا وَیَرۡزُقۡهُ مِنۡ حَیۡثُ لَا یَحۡتَسِبُ
""")

# 54. ayahHadithTwentyThirtyFour_2: 9:28
replace_field(f20, 'ayahHadithTwentyThirtyFour_2', """\
یَـٰٓأَیُّهَا ٱلَّذِینَ ءَامَنُوٓا۟ إِنَّمَا ٱلۡمُشۡرِكُونَ نَجَسࣱ فَلَا یَقۡرَبُوا۟ ٱلۡمَسۡجِدَ ٱلۡحَرَامَ بَعۡدَ عَامِهِمۡ هَـٰذَا ۚ ۝٢٨
سورة التوبة
""")

# 55. ayahHadithTwentyThirtyFour_3: 9:28 fragment
replace_field(f20, 'ayahHadithTwentyThirtyFour_3', """\
یَـٰٓأَیُّهَا ٱلَّذِینَ ءَامَنُوٓا۟ إِنَّمَا ٱلۡمُشۡرِكُونَ نَجَسࣱ
""")

# 56. ayahHadithTwentyThirtyFive_1: 9:28 fragment
replace_field(f20, 'ayahHadithTwentyThirtyFive_1', """\
وَإِنۡ خِفۡتُمۡ عَیۡلَةࣰ
""")

# 57. ayahHadithTwentyThirtyFive_2: 9:28 fragment
replace_field(f20, 'ayahHadithTwentyThirtyFive_2', """\
فَسَوۡفَ یُغۡنِیكُمُ ٱللَّهُ مِن فَضۡلِهِۦۤ
""")

print("\nDone!")
