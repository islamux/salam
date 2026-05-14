#!/usr/bin/env python3
"""Fix 36 ayahHadith fields in elm_text_ders_final.dart: Uthmani tashkeel."""

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

f = BASE + 'elm_text_ders_final.dart'

print("=== Final ===")

# 1. ayahHadithFInalPageTwo_1: 3:185 fragment
replace_field(f, 'ayahHadithFInalPageTwo_1', """\
كُلُّ نَفْسٍۢ ذَآئِقَةُ ٱلْمَوْتِ
""")

# 2. ayahHadithFInalPageTwo_2: 67:2 fragment
replace_field(f, 'ayahHadithFInalPageTwo_2', """\
ٱلَّذِى خَلَقَ ٱلْمَوْتَ وَٱلْحَيَوٰةَ
""")

# 3. ayahHadithFInalPageTwo_3: fragment
replace_field(f, 'ayahHadithFInalPageTwo_3', """\
حَتَّىٰٓ إِذَا جَآءَ أَحَدَهُمُ ٱلْمَوْتُ
""")

# 4. ayahHadithFInalPageThree_1: fragments + 62:8 full
replace_field(f, 'ayahHadithFInalPageThree_1', """\
حَتَّىٰٓ إِذَا جَآءَ أَحَدَهُمُ ٱلْمَوْتُ
قُلْ إِنَّ ٱلْمَوْتَ ٱلَّذِى تَفِرُّونَ مِنْهُ فَإِنَّهُۥ مُلَٰقِيكُمْ ۝٨
سورة الجمعة
""")

# 5. ayahHadithFInalPageFour_1: prefix + 15:99
replace_field(f, 'ayahHadithFInalPageFour_1', """\
قال ربنا عز وجل
وَٱعْبُدْ رَبَّكَ حَتَّىٰ يَأْتِيَكَ ٱلْيَقِينُ ۝٩٩
سورة الحجر
""")

# 6. ayahHadithFInalPageFour_2: 15:99 full
replace_field(f, 'ayahHadithFInalPageFour_2', """\
وَٱعْبُدْ رَبَّكَ حَتَّىٰ يَأْتِيَكَ ٱلْيَقِينُ ۝٩٩
سورة الحجر
""")

# 7. ayahHadithFInalPageFive_1: multi-line fragments
replace_field(f, 'ayahHadithFInalPageFive_1', """\
ٱقْرَأْ كِتَٰبَكَ كَفَىٰ بِنَفْسِكَ ٱلْيَوْمَ عَلَيْكَ حَسِيبًۭا
لَقَدْ كُنتَ فِى غَفْلَةٍۢ مِّنْ هَٰذَا فَكَشَفْنَا عَنكَ غِطَآءَكَ فَبَصَرُكَ ٱلْيَوْمَ حَدِيدٌۭ
حَتَّىٰٓ إِذَا جَآءَ أَحَدَهُمُ ٱلْمَوْتُ قَالَ رَبِّ ٱرْجِعُونِ
تَقُولُ نَفْسٌۭ يَٰحَسْرَتَىٰ عَلَىٰ مَا فَرَّطتُ فِى جَنۢبِ ٱللَّهِ
""")

# 8. ayahHadithFInalPageFive_2: 23:99 fragment
replace_field(f, 'ayahHadithFInalPageFive_2', """\
حَتَّىٰٓ إِذَا جَآءَ أَحَدَهُمُ ٱلْمَوْتُ قَالَ رَبِّ ٱرْجِعُونِ
""")

# 9. ayahHadithFInalPageSix_1: 23:100 fragment
replace_field(f, 'ayahHadithFInalPageSix_1', """\
لَعَلِّىٓ أَعْمَلُ صَٰلِحًۭا فِيمَا تَرَكْتُ
""")

# 10. ayahHadithFInalPageSix_2: 23:100 fragment
replace_field(f, 'ayahHadithFInalPageSix_2', """\
كَلَّآ إِنَّهَا كَلِمَةٌ هُوَ قَآئِلُهَا
""")

# 11. ayahHadithFInalPageSix_3: 23:100 fragment
replace_field(f, 'ayahHadithFInalPageSix_3', """\
كَلَّآ إِنَّهَا كَلِمَةٌ هُوَ قَآئِلُهَا
""")

# 12. ayahHadithFInalPageSeven_1: 50:19 fragment
replace_field(f, 'ayahHadithFInalPageSeven_1', """\
وَجَآءَتْ سَكْرَةُ ٱلْمَوْتِ بِٱلْحَقِّ
""")

# 13. ayahHadithFInalPageSeven_2: hadith - keep as-is with tashkeel
replace_field(f, 'ayahHadithFInalPageSeven_2', """\
{لَا إِلَـٰهَ إِلَّا ٱللَّهُ، إِنَّ لِلْمَوْتِ لَسَكَرَٰتٍ}
""")

# 14. ayahHadithFInalPageEight_1: 23:99-100 fragment
replace_field(f, 'ayahHadithFInalPageEight_1', """\
رَبِّ ٱرْجِعُونِ لَعَلِّىٓ أَعْمَلُ صَٰلِحًۭا فِيمَا تَرَكْتُ
""")

# 15. ayahHadithFInalPageEight_2: 89:24 fragment
replace_field(f, 'ayahHadithFInalPageEight_2', """\
يَٰلَيْتَنِى قَدَّمْتُ لِحَيَاتِى
""")

# 16. ayahHadithFInalPageEight_3: 25:27 fragment
replace_field(f, 'ayahHadithFInalPageEight_3', """\
يَٰلَيْتَنِى ٱتَّخَذْتُ مَعَ ٱلرَّسُولِ سَبِيلًۭا
""")

# 17. ayahHadithFInalPageEight_4: 25:28
replace_field(f, 'ayahHadithFInalPageEight_4', """\
يَٰوَيْلَتَىٰ لَيْتَنِى لَمْ أَتَّخِذْ فُلَانًا خَلِيلًۭا ۝٢٨
سورة الفرقان
""")

# 18. ayahHadithFInalPageEight_5: 25:27 fragment
replace_field(f, 'ayahHadithFInalPageEight_5', """\
وَيَوْمَ يَعَضُّ ٱلظَّالِمُ عَلَىٰ يَدَيْهِ
""")

# 19. ayahHadithFInalPageNine_1: 50:19
replace_field(f, 'ayahHadithFInalPageNine_1', """\
وَجَآءَتْ سَكْرَةُ ٱلْمَوْتِ بِٱلْحَقِّ ۖ ذَٰلِكَ مَا كُنتَ مِنْهُ تَحِيدُ ۝١٩
سورة ق
""")

# 20. ayahHadithFInalPageNine_2: 39:30 full
replace_field(f, 'ayahHadithFInalPageNine_2', """\
إِنَّكَ مَيِّتٌۭ وَإِنَّهُم مَّيِّتُونَ ۝٣٠
سورة الزمر
""")

# 21. ayahHadithFInalPageNine_3: 39:30 fragment
replace_field(f, 'ayahHadithFInalPageNine_3', """\
إِنَّكَ مَيِّتٌۭ
""")

# 22. ayahHadithFInalPageNine_4: 39:30 full
replace_field(f, 'ayahHadithFInalPageNine_4', """\
إِنَّكَ مَيِّتٌۭ وَإِنَّهُم مَّيِّتُونَ ۝٣٠
سورة الزمر
""")

# 23. ayahHadithFInalPageNine_5: 39:30 full
replace_field(f, 'ayahHadithFInalPageNine_5', """\
إِنَّكَ مَيِّتٌۭ وَإِنَّهُم مَّيِّتُونَ ۝٣٠
سورة الزمر
""")

# 24. ayahHadithFInalPageTen_1: 39:30-31
replace_field(f, 'ayahHadithFInalPageTen_1', """\
إِنَّكَ مَيِّتٌۭ وَإِنَّهُم مَّيِّتُونَ ۝٣٠
ثُمَّ إِنَّكُمْ يَوْمَ ٱلْقِيَٰمَةِ عِندَ رَبِّكُمْ تَخْتَصِمُونَ ۝٣١
سورة الزمر
""")

# 25. ayahHadithFInalPageTen_2: 30:32 fragment
replace_field(f, 'ayahHadithFInalPageTen_2', """\
كُلُّ حِزْبٍۭ بِمَا لَدَيْهِمْ فَرِحُونَ
""")

# 26. ayahHdithFInalPageTen_3: 27:79 fragment (note: field name has typo "Hdith")
replace_field(f, 'ayahHdithFInalPageTen_3', """\
فَتَوَكَّلْ عَلَى ٱللَّهِ ۖ إِنَّكَ عَلَى ٱلْحَقِّ ٱلْمُبِينِ
""")

# 27. ayahHadithFInalPageEleven_1: 17:81 fragment
replace_field(f, 'ayahHadithFInalPageEleven_1', """\
إِنَّ ٱلْبَٰطِلَ كَانَ زَهُوقًۭا
""")

# 28. ayahHadithFInalPageEleven_2: 36:65 fragment
replace_field(f, 'ayahHadithFInalPageEleven_2', """\
ٱلْيَوْمَ نَخْتِمُ عَلَىٰٓ أَفْوَٰهِهِمْ وَتُكَلِّمُنَآ أَيْدِيهِمْ وَتَشْهَدُ أَرْجُلُهُم
""")

# 29. ayahHadithFInalPageEleven_3: multi-line fragments
replace_field(f, 'ayahHadithFInalPageEleven_3', """\
يُنَبَّؤُا۟ ٱلْإِنسَٰنُ يَوْمَئِذٍۭ بِمَا قَدَّمَ وَأَخَّرَ
كُلُّ نَفْسٍۭ بِمَا كَسَبَتْ رَهِينَةٌ
""")

# 30. ayahHadithFInalPageTwelve_1: 39:30
replace_field(f, 'ayahHadithFInalPageTwelve_1', """\
إِنَّكَ مَيِّتٌۭ وَإِنَّهُم مَّيِّتُونَ ۝٣٠
سورة الزمر
""")

# 31. ayahHadithFInalPageThirteen_1: 50:19
replace_field(f, 'ayahHadithFInalPageThirteen_1', """\
وَجَآءَتْ سَكْرَةُ ٱلْمَوْتِ بِٱلْحَقِّ ۖ ذَٰلِكَ مَا كُنتَ مِنْهُ تَحِيدُ ۝١٩
سورة ق
""")

# 32. ayahHadithFInalPageFourteen_1: 62:8
replace_field(f, 'ayahHadithFInalPageFourteen_1', """\
قُلْ إِنَّ ٱلْمَوْتَ ٱلَّذِى تَفِرُّونَ مِنْهُ فَإِنَّهُۥ مُلَٰقِيكُمْ ۝٨
سورة الجمعة
""")

# 33. ayahHadithFInalPageFourteen_4: 62:8 (note: this is the 4th field on page 14)
replace_field(f, 'ayahHadithFInalPageFourteen_4', """\
قُلْ إِنَّ ٱلْمَوْتَ ٱلَّذِى تَفِرُّونَ مِنْهُ فَإِنَّهُۥ مُلَٰقِيكُمْ ۝٨
سورة الجمعة
""")

# 34. ayahHadithFInalPageFifteen_1: 39:56 fragment
replace_field(f, 'ayahHadithFInalPageFifteen_1', """\
يَٰحَسْرَتَىٰ عَلَىٰ مَا فَرَّطتُ فِى جَنۢبِ ٱللَّهِ
""")

# 35. ayahHadithFInalPageSixteen_1: hadith + quote
replace_field(f, 'ayahHadithFInalPageSixteen_1', """\
النبي الكريم قال {أَكْثِرُوا۟ ذِكْرَ هَٰذِمِ ٱللَّذَّاتِ}
	عِشْ مَا شِئْتَ فَإِنَّكَ مَيِّتٌۭ، وَأَحْبِبْ مَا شِئْتَ فَإِنَّكَ مُجْزًۭى بِهِۦ
""")

# 36. ayahHadithFInalPageSixteen_2: hadith
replace_field(f, 'ayahHadithFInalPageSixteen_2', """\
{لَآ أَجْمَعُ عَلَىٰ عَبْدِىٓ أَمْنَيْنِ وَخَوْفَيْنِ، إِنْ أَمِنَنِى فِى ٱلدُّنْيَا أَخَفْتُهُۥ يَوْمَ ٱلْقِيَٰمَةِ، وَإِنْ خَافَنِى فِى ٱلدُّنْيَا أَمَّنْتُهُۥ يَوْمَ ٱلْقِيَٰمَةِ}
""")

print("\nDone!")
