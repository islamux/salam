#!/usr/bin/env python3
"""Fix 54 ayahHadith fields in elm_text_ders_twenty_five.dart: Uthmani tashkeel."""

import re

BASE = '/media/islamux/Variety/Flutter_Projects/salam/lib/core/data/static/text/'

def replace_field(filepath, field_name, new_content):
    with open(filepath, 'r', encoding='utf-8') as f:
        text = f.read()
    # Match field declaration (with or without String type)
    pattern = re.compile(
        rf'(static const\s+(?:String\s+)?{re.escape(field_name)}\s*=\s*""").*?(""";)',
        re.DOTALL
    )
    replacement = rf'\1\n{new_content}\2'
    new_text = pattern.sub(replacement, text)
    if new_text == text:
        print(f"  ⚠ No match: {field_name}")
    else:
        print(f"  ✓ {field_name}")
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_text)


f = BASE + 'elm_text_ders_twenty_five.dart'

print("=== Page One ===")
# Hadith: اللهم لا عيش إلا عيش الآخرة + متفق عليه عن أنس
replace_field(f, 'ayahHadithTwentyFivePageOne_1', """\
ٱللَّهُمَّ لَا عَيْشَ إِلَّا عَيْشُ ٱلْآخِرَةِ
مُتَّفَقٌ عَلَيْهِ عَنْ أَنَسٍ""")

print("\n=== Page Two ===")
# 23:1 fragments
replace_field(f, 'ayahHadithTwentyFivePageTwo_1', """\
قَدْ أَفْلَحَ ٱلْمُؤْمِنُونَ""")
replace_field(f, 'ayahHadithTwentyFivePageTwo_2', """\
قَدْ أَفْلَحَ ٱلْمُؤْمِنُونَ""")
replace_field(f, 'ayahHadithTwentyFivePageTwo_3', """\
قَدْ أَفْلَحَ ٱلْمُؤْمِنُونَ""")

print("\n=== Page Three ===")
# 91:9 fragment
replace_field(f, 'ayahHadithTwentyFivePageThree_1', """\
قَدْ أَفْلَحَ مَن زَكَّىٰهَا""")
# 87:14 fragment
replace_field(f, 'ayahHadithTwentyFivePageThree_2', """\
قَدْ أَفْلَحَ مَن تَزَكَّىٰ""")
# 23:1 fragment
replace_field(f, 'ayahHadithTwentyFivePageThree_3', """\
قَدْ أَفْلَحَ ٱلْمُؤْمِنُونَ""")
replace_field(f, 'ayahHadithTwentyFivePageThree_4', """\
قَدْ أَفْلَحَ ٱلْمُؤْمِنُونَ""")
# 3:185 fragment (end portion)
replace_field(f, 'ayahHadithTwentyFivePageThree_5', """\
وَمَا ٱلْحَيَوٰةُ ٱلدُّنْيَآ إِلَّا مَتَٰعُ ٱلْغُرُورِ""")

print("\n=== Page Four ===")
# Narration/saying
replace_field(f, 'ayahHadithTwentyFivePageFour_1', """\
ٱلدُّنْيَا دَارُ بَلَاءٍ وَٱنْقِطَاعٍ
{وَرَدَ فِي الْأَثَرِ}""")
# Saying of Umar
replace_field(f, 'ayahHadithTwentyFivePageFour_2', """\
:يَقُولُ سَيِّدُنَا عُمَرُ رَضِيَ ٱللَّهُ عَنْهُ
كَفَىٰ بِٱلْمَوْتِ وَاعِظًا""")

print("\n=== Page Five ===")
# 12:23 fragment
for i in ['1', '2', '3']:
    replace_field(f, f'ayahHadithTwentyFivePageFive_{i}', """\
إِنَّهُۥ لَا يُفْلِحُ ٱلظَّٰلِمُونَ""")
# 23:117 fragment
for i in ['4', '5']:
    replace_field(f, f'ayahHadithTwentyFivePageFive_{i}', """\
إِنَّهُۥ لَا يُفْلِحُ ٱلْكَٰفِرُونَ""")

print("\n=== Page Six ===")
# Fragment from 3:200
replace_field(f, 'ayahHadithTwentyFivePageSix_1', """\
وَٱتَّقُوا۟ ٱللَّهَ لَعَلَّكُمْ تُفْلِحُونَ""")
# Full 5:35
replace_field(f, 'ayahHadithTwentyFivePageSix_2', """\
يَٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُوا۟ ٱتَّقُوا۟ ٱللَّهَ وَٱبْتَغُوٓا۟ إِلَيْهِ ٱلْوَسِيلَةَ وَجَٰهِدُوا۟ فِى سَبِيلِهِۦ لَعَلَّكُمْ تُفْلِحُونَ ۝٣٥
سورة المائدة""")
# 22:77 fragment
replace_field(f, 'ayahHadithTwentyFivePageSix_3', """\
وَٱعْبُدُوا۟ رَبَّكُمْ وَٱفْعَلُوا۟ ٱلْخَيْرَ لَعَلَّكُمْ تُفْلِحُونَ""")
# 7:69 fragment
replace_field(f, 'ayahHadithTwentyFivePageSix_4', """\
فَٱذْكُرُوٓا۟ ءَالَآءَ ٱللَّهِ لَعَلَّكُمْ تُفْلِحُونَ""")
# 58:22 fragment
replace_field(f, 'ayahHadithTwentyFivePageSix_5', """\
أَلَآ إِنَّ حِزْبَ ٱللَّهِ هُمُ ٱلْمُفْلِحُونَ""")

print("\n=== Page Seven ===")
# Prefix + 87:14-15
replace_field(f, 'ayahHadithTwentyFivePageSeven_1', """\
رَبُّنَا عَزَّ وَجَلَّ يَقُولُ
قَدْ أَفْلَحَ مَن تَزَكَّىٰ وَذَكَرَ ٱسْمَ رَبِّهِۦ فَصَلَّىٰ""")
# 36:58 + 15:46 + 69:19 fragments
replace_field(f, 'ayahHadithTwentyFivePageSeven_2', """\
سَلَٰمٌۭ قَوْلًۭا مِّن رَّبٍّۢ رَّحِيمٍۢ

ٱدْخُلُوهَا بِسَلَٰمٍ ءَامِنِينَ

فَأَمَّا مَنْ أُوتِىَ كِتَٰبَهُۥ بِيَمِينِهِۦ فَيَقُولُ هَآؤُمُ ٱقْرَءُوا۟ كِتَٰبِيَهْ""")

print("\n=== Page Eight ===")
# 51:17 fragment
replace_field(f, 'ayahHadithTwentyFivePageEight_1', """\
كَانُوا۟ قَلِيلًۭا مِّنَ ٱلَّيْلِ مَا يَهْجَعُونَ""")
# 28:79 fragment
replace_field(f, 'ayahHadithTwentyFivePageEight_2', """\
فَخَرَجَ عَلَىٰ قَوْمِهِۦ فِى زِينَتِهِۦ ۖ قَالَ ٱلَّذِينَ يُرِيدُونَ ٱلْحَيَوٰةَ ٱلدُّنْيَا يَٰلَيْتَ لَنَا مِثْلَ مَآ أُوتِىَ قَارُونُ إِنَّهُۥ لَذُو حَظٍّ عَظِيمٍۢ""")

print("\n=== Page Nine ===")
# 91:9 fragments
replace_field(f, 'ayahHadithTwentyFivePageNine_1', """\
قَدْ أَفْلَحَ مَن زَكَّىٰهَا""")
replace_field(f, 'ayahHadithTwentyFivePageNine_2', """\
مَن زَكَّىٰهَا""")

print("\n=== Page Ten ===")
for i in ['1', '2']:
    replace_field(f, f'ayahHadithTwentyFivePageTen_{i}', """\
قَدْ أَفْلَحَ مَن زَكَّىٰهَا""")

print("\n=== Page Eleven ===")
for i in ['1', '2']:
    replace_field(f, f'ayahHadithTwentyFivePageEleven_{i}', """\
قَدْ أَفْلَحَ مَن زَكَّىٰهَا""")

print("\n=== Page Therteen ===")
# 87:14 fragments
replace_field(f, 'ayahHadithTwentyFivePageTherteen_1', """\
قَدْ أَفْلَحَ مَن تَزَكَّىٰ""")
replace_field(f, 'ayahHadithTwentyFivePageTherteen_2', """\
قَدْ أَفْلَحَ مَن تَزَكَّىٰ""")
# 23:1-2 full ayahs
replace_field(f, 'ayahHadithTwentyFivePageTherteen_3', """\
قَدْ أَفْلَحَ ٱلْمُؤْمِنُونَ ۝١
ٱلَّذِينَ هُمْ فِى صَلَاتِهِمْ خَٰشِعُونَ ۝٢
سورة المؤمنون""")
# 91:9-10 full ayahs
replace_field(f, 'ayahHadithTwentyFivePageTherteen_4', """\
قَدْ أَفْلَحَ مَن زَكَّىٰهَا ۝٩
وَقَدْ خَابَ مَن دَسَّىٰهَا ۝١٠
سورة الشمس""")
# 91:1-8 full ayahs (without basmalah)
replace_field(f, 'ayahHadithTwentyFivePageTherteen_5', """\
وَٱلشَّمْسِ وَضُحَىٰهَا ۝١
وَٱلْقَمَرِ إِذَا تَلَىٰهَا ۝٢
وَٱلنَّهَارِ إِذَا جَلَّىٰهَا ۝٣
وَٱلَّيْلِ إِذَا يَغْشَىٰهَا ۝٤
وَٱلسَّمَآءِ وَمَا بَنَىٰهَا ۝٥
وَٱلْأَرْضِ وَمَا طَحَىٰهَا ۝٦
وَنَفْسٍۢ وَمَا سَوَّىٰهَا ۝٧
فَأَلْهَمَهَا فُجُورَهَا وَتَقْوَىٰهَا ۝٨
سورة الشمس""")

print("\n=== Page Fourteen ===")
# 23:1 fragment
replace_field(f, 'ayahHadithTwentyFivePageFourteen_1', """\
قَدْ أَفْلَحَ ٱلْمُؤْمِنُونَ""")
# 23:2 fragment
replace_field(f, 'ayahHadithTwentyFivePageFourteen_2', """\
ٱلَّذِينَ هُمْ فِى صَلَاتِهِمْ خَٰشِعُونَ""")
# 23:3 fragment
replace_field(f, 'ayahHadithTwentyFivePageFourteen_3', """\
وَٱلَّذِينَ هُمْ عَنِ ٱللَّغْوِ مُعْرِضُونَ""")

print("\n=== Page Fifteen ===")
# Full 9:88
replace_field(f, 'ayahHadithTwentyFivePageFifteen_1', """\
لَٰكِنِ ٱلرَّسُولُ وَٱلَّذِينَ ءَامَنُوا۟ مَعَهُۥ جَٰهَدُوا۟ بِأَمْوَٰلِهِمْ وَأَنفُسِهِمْ ۚ وَأُو۟لَٰٓئِكَ لَهُمُ ٱلْخَيْرَٰتُ ۖ وَأُو۟لَٰٓئِكَ هُمُ ٱلْمُفْلِحُونَ ۝٨٨
سورة التوبة""")
# 9:88 fragment
replace_field(f, 'ayahHadithTwentyFivePageFifteen_2', """\
لَهُمُ ٱلْخَيْرَٰتُ""")
# 55:46 fragment
replace_field(f, 'ayahHadithTwentyFivePageFifteen_3', """\
وَلِمَنْ خَافَ مَقَامَ رَبِّهِۦ جَنَّتَانِ""")
# Generic fragment
replace_field(f, 'ayahHadithTwentyFivePageFifteen_4', """\
وَأُو۟لَٰٓئِكَ هُمُ ٱلْمُفْلِحُونَ""")

print("\n=== Page Sixteen ===")
# 23:102 fragment
replace_field(f, 'ayahHadithTwentyFivePageSixteen_1', """\
فَمَن ثَقُلَتْ مَوَٰزِينُهُۥ فَأُو۟لَٰٓئِكَ هُمُ ٱلْمُفْلِحُونَ""")
# 30:38 + 2:5/31:5 full ayahs
replace_field(f, 'ayahHadithTwentyFivePageSixteen_2', """\
فَـَٔاتِ ذَا ٱلْقُرْبَىٰ حَقَّهُۥ وَٱلْمِسْكِينَ وَٱبْنَ ٱلسَّبِيلِ ۚ ذَٰلِكَ خَيْرٌۭ لِّلَّذِينَ يُرِيدُونَ وَجْهَ ٱللَّهِ ۖ وَأُو۟لَٰٓئِكَ هُمُ ٱلْمُفْلِحُونَ ۝٣٨
سورة الروم

أُو۟لَٰٓئِكَ عَلَىٰ هُدًۭى مِّن رَّبِّهِمْ ۖ وَأُو۟لَٰٓئِكَ هُمُ ٱلْمُفْلِحُونَ ۝٥
سورة البقرة""")

print("\n=== Page Seventeen ===")
# 2:5 fragment + 20:69 fragment
replace_field(f, 'ayahHadithTwentyFivePageSeventeen_1', """\
أُو۟لَٰٓئِكَ عَلَىٰ هُدًۭى مِّن رَّبِّهِمْ

وَلَا يُفْلِحُ ٱلسَّاحِرُ حَيْثُ أَتَىٰ""")
# Full 5:100
replace_field(f, 'ayahHadithTwentyFivePageSeventeen_2', """\
قُل لَّا يَسْتَوِى ٱلْخَبِيثُ وَٱلطَّيِّبُ وَلَوْ أَعْجَبَكَ كَثْرَةُ ٱلْخَبِيثِ ۚ فَٱتَّقُوا۟ ٱللَّهَ يَٰٓأُو۟لِى ٱلْأَلْبَٰبِ لَعَلَّكُمْ تُفْلِحُونَ ۝١٠٠
سورة المائدة""")
# Full 5:35 (same as six_2)
replace_field(f, 'ayahHadithTwentyFivePageSeventeen_3', """\
يَٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُوا۟ ٱتَّقُوا۟ ٱللَّهَ وَٱبْتَغُوٓا۟ إِلَيْهِ ٱلْوَسِيلَةَ وَجَٰهِدُوا۟ فِى سَبِيلِهِۦ لَعَلَّكُمْ تُفْلِحُونَ ۝٣٥
سورة المائدة""")

print("\n=== Page Eighteen ===")
# 59:9 fragments
for i in ['1', '2']:
    replace_field(f, f'ayahHadithTwentyFivePageEighteen_{i}', """\
وَمَن يُوقَ شُحَّ نَفْسِهِۦ فَأُو۟لَٰٓئِكَ هُمُ ٱلْمُفْلِحُونَ""")

print("\n=== Page Nineteen ===")
# 59:9 fragment
replace_field(f, 'ayahHadithTwentyFivePageNineteen_1', """\
وَمَن يُوقَ شُحَّ نَفْسِهِۦ فَأُو۟لَٰٓئِكَ هُمُ ٱلْمُفْلِحُونَ""")
# 22:77 fragment
replace_field(f, 'ayahHadithTwentyFivePageNineteen_2', """\
يَٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُوا۟ ٱرْكَعُوا۟ وَٱسْجُدُوا۟ وَٱعْبُدُوا۟ رَبَّكُمْ""")
# 22:77 fragment
replace_field(f, 'ayahHadithTwentyFivePageNineteen_3', """\
وَٱفْعَلُوا۟ ٱلْخَيْرَ لَعَلَّكُمْ تُفْلِحُونَ""")
# 28:67 fragment
replace_field(f, 'ayahHadithTwentyFivePageNineteen_4', """\
فَأَمَّا مَن تَابَ وَءَامَنَ وَعَمِلَ صَٰلِحًۭا فَعَسَىٰٓ أَن يَكُونَ مِنَ ٱلْمُفْلِحِينَ""")

print("\nDone!")
