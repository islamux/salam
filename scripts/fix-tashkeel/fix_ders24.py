#!/usr/bin/env python3
"""Fix 34 ayahHadith fields in elm_text_ders_twenty_four.dart: Uthmani tashkeel."""

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

f = BASE + 'elm_text_ders_twenty_four.dart'

print("=== Ders 24 ===")

# 1. ayahHadithTwentyFourOne_1: 2:172 FULL
replace_field(f, 'ayahHadithTwentyFourOne_1', """\
يَٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُوا۟ كُلُوا۟ مِن طَيِّبَٰتِ مَا رَزَقْنَٰكُمْ وَٱشْكُرُوا۟ لِلَّهِ إِن كُنتُمْ إِيَّاهُ تَعْبُدُونَ ۝١٧٢
سورة البقرة
""")

# 2. ayahHadithTwentyFourOne_2: 2:172 fragment
replace_field(f, 'ayahHadithTwentyFourOne_2', """\
كُلُوا۟ مِن طَيِّبَٰتِ مَا رَزَقْنَٰكُمْ وَٱشْكُرُوا۟ لِلَّهِ
""")

# 3. ayahHadithTwentyFourThree_1: 2:172 FULL
replace_field(f, 'ayahHadithTwentyFourThree_1', """\
يَٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُوا۟ كُلُوا۟ مِن طَيِّبَٰتِ مَا رَزَقْنَٰكُمْ وَٱشْكُرُوا۟ لِلَّهِ إِن كُنتُمْ إِيَّاهُ تَعْبُدُونَ ۝١٧٢
سورة البقرة
""")

# 4. ayahHadithTwentyFourThree_2: 34:13 fragment
replace_field(f, 'ayahHadithTwentyFourThree_2', """\
ٱعْمَلُوٓا۟ ءَالَ دَاوُۥدَ شُكْرًۭا
""")

# 5. ayahHadithTwentyFourFour_1: 34:13 fragment
replace_field(f, 'ayahHadithTwentyFourFour_1', """\
ٱعْمَلُوٓا۟ ءَالَ دَاوُۥدَ شُكْرًۭا
""")

# 6. ayahHadithTwentyFourFour_2: 34:13 fragment
replace_field(f, 'ayahHadithTwentyFourFour_2', """\
ٱعْمَلُوٓا۟ ءَالَ دَاوُۥدَ شُكْرًۭا
""")

# 7. ayahHadithTwentyFourSix_1: 76:3 FULL
replace_field(f, 'ayahHadithTwentyFourSix_1', """\
إِنَّا هَدَيْنَٰهُ ٱلسَّبِيلَ إِمَّا شَاكِرًۭا وَإِمَّا كَفُورًۭا ۝٣
سورة الإنسان
""")

# 8. ayahHadithTwentyFourSix_2: 76:3 fragment
replace_field(f, 'ayahHadithTwentyFourSix_2', """\
إِنَّا هَدَيْنَٰهُ ٱلسَّبِيلَ
""")

# 9. ayahHadithTwentyFourSix_3: 92:12 fragment
replace_field(f, 'ayahHadithTwentyFourSix_3', """\
إِنَّ عَلَيْنَا لَلْهُدَىٰ
""")

# 10. ayahHadithTwentyFourSix_4: 76:3 fragment
replace_field(f, 'ayahHadithTwentyFourSix_4', """\
إِمَّا شَاكِرًۭا وَإِمَّا كَفُورًۭا
""")

# 11. ayahHadithTwentyFourSix_5: 76:3 fragments (two lines)
replace_field(f, 'ayahHadithTwentyFourSix_5', """\
إِنَّا هَدَيْنَٰهُ ٱلسَّبِيلَ
إِمَّا شَاكِرًۭا وَإِمَّا كَفُورًۭا
""")

# 12. ayahHadithTwentyFourEight_1: 34:13 fragment (second part of 34:13)
replace_field(f, 'ayahHadithTwentyFourEight_1', """\
وَقَلِيلٌۭ مِّنْ عِبَادِىَ ٱلشَّكُورُ
""")

# 13. ayahHadithTwentyFourNine_1: 4:147 FULL
replace_field(f, 'ayahHadithTwentyFourNine_1', """\
مَّا يَفْعَلُ ٱللَّهُ بِعَذَابِكُمْ إِن شَكَرْتُمْ وَءَامَنتُمْ ۚ وَكَانَ ٱللَّهُ شَاكِرًا عَلِيمًا ۝١٤٧
سورة النساء
""")

# 14. ayahHadithTwentyFourNine_2: 75:36 FULL
replace_field(f, 'ayahHadithTwentyFourNine_2', """\
أَيَحْسَبُ ٱلْإِنسَٰنُ أَن يُتْرَكَ سُدًى ۝٣٦
سورة القيامة
""")

# 15. ayahHadithTwentyFourNine_3: 23:115 FULL
replace_field(f, 'ayahHadithTwentyFourNine_3', """\
أَفَحَسِبْتُمْ أَنَّمَا خَلَقْنَٰكُمْ عَبَثًۭا وَأَنَّكُمْ إِلَيْنَا لَا تُرْجَعُونَ ۝١١٥
سورة المؤمنون
""")

# 16. ayahHadithTwentyFourTen_1: 75:36 FULL
replace_field(f, 'ayahHadithTwentyFourTen_1', """\
أَيَحْسَبُ ٱلْإِنسَٰنُ أَن يُتْرَكَ سُدًى ۝٣٦
سورة القيامة
""")

# 17. ayahHadithTwentyFourEleven_1: 76:1 fragment + 95:4 fragment
replace_field(f, 'ayahHadithTwentyFourEleven_1', """\
هَلْ أَتَىٰ عَلَى ٱلْإِنسَٰنِ حِينٌۭ مِّنَ ٱلدَّهْرِ لَمْ يَكُن شَيْـًۭٔا مَّذْكُورًۭا
لَقَدْ خَلَقْنَا ٱلْإِنسَٰنَ فِىٓ أَحْسَنِ تَقْوِيمٍۢ
""")

# 18. ayahHadithTwentyFourEleven_2: 90:8 FULL
replace_field(f, 'ayahHadithTwentyFourEleven_2', """\
أَلَمْ نَجْعَل لَّهُۥ عَيْنَيْنِ ۝٨
سورة البلد
""")

# 19. ayahHadithTwentyFourTwelve_1: 27:73 FULL
replace_field(f, 'ayahHadithTwentyFourTwelve_1', """\
وَإِنَّ رَبَّكَ لَذُو فَضْلٍ عَلَى ٱلنَّاسِ وَلَٰكِنَّ أَكْثَرَهُمْ لَا يَشْكُرُونَ ۝٧٣
سورة النمل
""")

# 20. ayahHadithTwentyFourTwelve_2: HADITH - apply Uthmani-style tashkeel
replace_field(f, 'ayahHadithTwentyFourTwelve_2', """\
{إِنَّ ٱلْعَارَ لَيَلْزَمُ ٱلْمَرْءَ يَوْمَ ٱلْقِيَٰمَةِ حَتَّىٰ يَقُولَ يَٰرَبِّ لِإِرْسَالِكَ بِىٓ إِلَى ٱلنَّارِ أَيْسَرُ عَلَىَّ مِمَّآ أَلْقَىٰ، وَإِنَّهُۥ لَيَعْلَمُ مَا فِيهَا مِن شِدَّةِ ٱلْعَذَابِ}
""")

# 21. ayahHadithTwentyFourTherteen_1: 27:73 fragment
replace_field(f, 'ayahHadithTwentyFourTherteen_1', """\
وَإِنَّ رَبَّكَ لَذُو فَضْلٍ عَلَى ٱلنَّاسِ
""")

# 22. ayahHadithTwentyFourFourteen_1: 75:36 FULL + "وقال تعالى:" + 23:115 FULL
replace_field(f, 'ayahHadithTwentyFourFourteen_1', """\
أَيَحْسَبُ ٱلْإِنسَٰنُ أَن يُتْرَكَ سُدًى ۝٣٦
سورة القيامة
وَقَالَ تَعَالَى:
أَفَحَسِبْتُمْ أَنَّمَا خَلَقْنَٰكُمْ عَبَثًۭا وَأَنَّكُمْ إِلَيْنَا لَا تُرْجَعُونَ ۝١١٥
سورة المؤمنون
""")

# 23. ayahHadithTwentyFourFifteen_1: 27:73 fragment
replace_field(f, 'ayahHadithTwentyFourFifteen_1', """\
وَإِنَّ رَبَّكَ لَذُو فَضْلٍ عَلَى ٱلنَّاسِ
""")

# 24. ayahHadithTwentyFourFifteen_2: 27:73 fragment (rest of the ayah)
replace_field(f, 'ayahHadithTwentyFourFifteen_2', """\
وَلَٰكِنَّ أَكْثَرَهُمْ لَا يَشْكُرُونَ
""")

# 25. ayahHadithTwentyFourFifteen_3: 14:7 fragment
replace_field(f, 'ayahHadithTwentyFourFifteen_3', """\
لَئِن شَكَرْتُمْ لَأَزِيدَنَّكُمْ
""")

# 26. ayahHadithTwentyFourFifteen_4: 13:11 fragment
replace_field(f, 'ayahHadithTwentyFourFifteen_4', """\
إِنَّ ٱللَّهَ لَا يُغَيِّرُ مَا بِقَوْمٍ حَتَّىٰ يُغَيِّرُوا۟ مَا بِأَنفُسِهِمْ
""")

# 27. ayahHadithTwentyFourSeventeen_1: 28:78 fragment (long fragment)
replace_field(f, 'ayahHadithTwentyFourSeventeen_1', """\
قَالَ إِنَّمَآ أُوتِيتُهُۥ عَلَىٰ عِلْمٍ عِندِىٓ ۚ أَوَلَمْ يَعْلَمْ أَنَّ ٱللَّهَ قَدْ أَهْلَكَ مِن قَبْلِهِۦ مِنَ ٱلْقُرُونِ مَنْ هُوَ أَشَدُّ مِنْهُ قُوَّةًۭ وَأَكْثَرُ جَمْعًۭا ۚ وَلَا يُسْـَٔلُ عَن ذُنُوبِهِمُ ٱلْمُجْرِمُونَ
""")

# 28. ayahHadithTwentyFourNineteen_1: 34:13 fragment + fragment
replace_field(f, 'ayahHadithTwentyFourNineteen_1', """\
ٱعْمَلُوٓا۟ ءَالَ دَاوُۥدَ شُكْرًۭا
وَقَلِيلٌۭ مِّنْ عِبَادِىَ ٱلشَّكُورُ
""")

# 29. ayahHadithTwentyFourTwenty_1: 14:7 fragment
replace_field(f, 'ayahHadithTwentyFourTwenty_1', """\
لَئِن شَكَرْتُمْ لَأَزِيدَنَّكُمْ
""")

# 30. ayahHadithTwentyFourTwenty_2: 16:121 fragment + 53:37 fragment
replace_field(f, 'ayahHadithTwentyFourTwenty_2', """\
شَاكِرًۭا لِّأَنْعُمِهِ ۚ ٱجْتَبَىٰهُ وَهَدَىٰهُ إِلَىٰ صِرَٰطٍۢ مُّسْتَقِيمٍۢ
وَإِبْرَٰهِيمَ ٱلَّذِى وَفَّىٰٓ
""")

# 31. ayahHadithTwentyFourTwentyOne_1: 14:7 fragment
replace_field(f, 'ayahHadithTwentyFourTwentyOne_1', """\
وَإِذْ تَأَذَّنَ رَبُّكُمْ
""")

# 32. ayahHadithTwentyFourTwentyOne_2: 14:7 fragment
replace_field(f, 'ayahHadithTwentyFourTwentyOne_2', """\
لَئِن شَكَرْتُمْ لَأَزِيدَنَّكُمْ
""")

# 33. ayahHadithTwentyFourTwentyOne_3: ATHAR/hadith with tashkeel
replace_field(f, 'ayahHadithTwentyFourTwentyOne_3', """\
ٱلْحَمْدُ لِلَّهِ ٱلَّذِىٓ أَذْهَبَ عَنِّى مَا يُؤْذِينِى (وَرَدَ فِى ٱلْأَثَرِ)
""")

# 34. ayahHadithTwentyFourTwentyTwo_1: 14:34 fragment
replace_field(f, 'ayahHadithTwentyFourTwentyTwo_1', """\
وَإِن تَعُدُّوا۟ نِعْمَتَ ٱللَّهِ لَا تُحْصُوهَآ
""")

print("\nDone!")
