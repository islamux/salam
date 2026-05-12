#!/usr/bin/env python3
"""Fix ayahHadith fields in ders 11-15: add ۝, Uthmani, surah names."""

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

# ===== DERS 11 =====
print("=== Ders 11 ===")
f11 = BASE + 'elm_text_ders_eleven.dart'

# ayahHadithElevenOne_1: 3 verses - add ۝ to v1 (7:96) and v3 (5:66)
replace_field(f11, 'ayahHadithElevenOne_1', """\
:قال تعالى 
وَلَوۡ أَنَّ أَهۡلَ ٱلۡقُرَىٰۤ ءَامَنُوا۟ وَٱتَّقَوۡا۟ لَفَتَحۡنَا عَلَیۡهِم بَرَكَـٰتࣲ مِّنَ ٱلسَّمَاۤءِ وَٱلۡأَرۡضِ ۝٩٦
سورة الأعراف 

:وقال تعالى 
 وَأَلَّوِ ٱسۡتَقَـٰمُوا۟ عَلَى ٱلطَّرِیقَةِ لَأَسۡقَیۡنَـٰهُم مَّاۤءً غَدَقࣰا ۝١٦ 
سورة الجن 

:وقال تعالى 
وَلَوۡ أَنَّهُمۡ أَقَامُوا۟ ٱلتَّوۡرَىٰةَ وَٱلۡإِنجِیلَ وَمَاۤ أُنزِلَ إِلَیۡهِم مِّن رَّبِّهِمۡ لَأَكَلُوا۟ مِن فَوۡقِهِمۡ وَمِن تَحۡتِ أَرۡجُلِهِمۚ ۝٦٦
سورة المائدة 
""")

# ayahHadithElevenTwo_1: already has ۝ - good

# ayahHadithElevenThree_1: 11:6 - add ۝
replace_field(f11, 'ayahHadithElevenThree_1', """\
:قال تعالى 
۞ وَمَا مِن دَاۤبَّةࣲ فِی ٱلۡأَرۡضِ إِلَّا عَلَى ٱللَّهِ رِزۡقُهَا ۝٦
سورة هود 
""")

# ayahHadithElevenSix_1: 19:25 partial - add ۝
replace_field(f11, 'ayahHadithElevenSix_1', """\
:قال تعالى 
  وَهُزِّیۤ إِلَیۡكِ بِجِذۡعِ ٱلنَّخۡلَةِ ۝٢٥
 سورة مريم 
""")

# ayahHadithElevenEight_1: already has ۝ - good

# ayahHadithElevenNine_1: already has ۝ - good

# ayahHadithElevenEleven_1: hadith - keep

# ayahHadithElevenEleven_2: already has ۝ - good

# ayahHadithElevenTherteen_1: 7:96 - add ۝
replace_field(f11, 'ayahHadithElevenTherteen_1', """\
:قال تعالى
 وَلَوۡ أَنَّ أَهۡلَ ٱلۡقُرَىٰۤ ءَامَنُوا۟ وَٱتَّقَوۡا۟ لَفَتَحۡنَا عَلَیۡهِم بَرَكَـٰتࣲ مِّنَ ٱلسَّمَاۤءِ وَٱلۡأَرۡضِ ۝٩٦
سورة الأعراف 
""")

# ayahHadithElevenTherteen_2: has ۝, add سورة before الجن
replace_field(f11, 'ayahHadithElevenTherteen_2', """\
:قال تعالى 
 وَأَلَّوِ ٱسۡتَقَـٰمُوا۟ عَلَى ٱلطَّرِیقَةِ لَأَسۡقَیۡنَـٰهُم مَّاۤءً غَدَقࣰا ۝١٦ 
سورة الجن 
""")

# ayahHadithElevenTherteen_3: 5:66 - add ۝ and سورة
replace_field(f11, 'ayahHadithElevenTherteen_3', """\
قال تعالى
 وَلَوۡ أَنَّهُمۡ أَقَامُوا۟ ٱلتَّوۡرَىٰةَ وَٱلۡإِنجِیلَ وَمَاۤ أُنزِلَ إِلَیۡهِم مِّن رَّبِّهِمۡ لَأَكَلُوا۟ مِن فَوۡقِهِمۡ وَمِن تَحۡتِ أَرۡجُلِهِمۚ ۝٦٦
سورة المائدة

""")

# ayahHadithElevenFourteen_1: already has ۝ on each ayah - good
# ayahHadithElevenFourteen_2: already has ۝ - good

# ayahHadithElevenFifteen_1: 2:276 - add ۝
replace_field(f11, 'ayahHadithElevenFifteen_1', """\
  یَمۡحَقُ ٱللَّهُ ٱلرِّبَوٰا۟ وَیُرۡبِی ٱلصَّدَقَـٰتِۗ ۝٢٧٦
 سورة البقرة 
""")

# ayahHadithElevenFifteen_2: hadith - keep

# ayahHadithElevenSixteen_1: hadith - keep
# ayahHadithElevenSixteen_2: hadith - keep

# ayahHadithElevenEighteen_1: 2:269 - add ۝
replace_field(f11, 'ayahHadithElevenEighteen_1', """\
:قال تعالى 
 یُؤۡتِی ٱلۡحِكۡمَةَ مَن یَشَاۤءُۚ وَمَن یُؤۡتَ ٱلۡحِكۡمَةَ فَقَدۡ أُوتِیَ خَیۡرࣰا كَثِیرࣰاۗ ۝٢٦٩
  سورة البقرة 
""")


# ===== DERS 12 =====
print("\n=== Ders 12 ===")
f12 = BASE + 'elm_text_ders_twelve.dart'

# ayahHadithTwelveOne_1: 68:4 partial - add ۝
replace_field(f12, 'ayahHadithTwelveOne_1', """\
وَإِنَّكَ لَعَلَىٰ خُلُقٍ عَظِیمࣲ ۝٤
-----------------
""")

# ayahHadithTwelveThree_1: fragment - keep
# ayahHadithTwelveThree_2: has ۝ - good but add سورة
replace_field(f12, 'ayahHadithTwelveThree_2', """\
 لَعَلَىٰ خُلُقٍ عَظِیمࣲ ۝٤
سورة القلم 
""")

# ayahHadithTwelveFour_1: has ۝ - good
# ayahHadithTwelveFour_2: has ۝ - good
# ayahHadithTwelveFive_1: hadith - keep
# ayahHadithTwelveFive_2: hadith - keep
# ayahHadithTwelveSix_1: hadith - keep
# ayahHadithTwelveSix_2: hadith - keep
# ayahHadithTwelveSeven_1: hadith/story - keep
# ayahHadithTwelveEight_1: story - keep
# ayahHadithTwelveEleven_1: has ۝ - good, add سورة
replace_field(f12, 'ayahHadithTwelveEleven_1', """\
     وَإِنَّكَ لَعَلَىٰ خُلُقٍ عَظِیمࣲ ۝٤ 
سورة القلم 
""")

# ayahHadithTwelveThirteen_1: 33:21 - add ۝
replace_field(f12, 'ayahHadithTwelveThirteen_1', """\
 قال:  لَّقَدۡ كَانَ لَكُمۡ فِی رَسُولِ ٱللَّهِ أُسۡوَةٌ حَسَنَةࣱ ۝٢١
سورة الأحزاب 
""")

# ayahHadithTwelveFourteen_1: hadith - keep
# ayahHadithTwelveFourteen_2: 3:31 - add ۝
replace_field(f12, 'ayahHadithTwelveFourteen_2', """\
    قُلۡ إِن كُنتُمۡ تُحِبُّونَ ٱللَّهَ فَٱتَّبِعُونِی یُحۡبِبۡكُمُ ٱللَّهُ وَیَغۡفِرۡ لَكُمۡ ذُنُوبَكُمۡۚ ۝٣١
سورة آل عمران 
""")

# ayahHadithTwelveFifteen_1: hadith - keep
# ayahHadithTwelveFifteen_2: hadith - keep
# ayahHadithTwelveSixteen_1: story - keep
# ayahHadithTwelveSixteen_2: story - keep
# ayahHadithTwelveSixteen_3: story - keep
# ayahHadithTwelveSixteen_4: has ۝ - good

# ayahHadithTwelveSeventeen_1: 8:33 - add ۝
replace_field(f12, 'ayahHadithTwelveSeventeen_1', """\
 وَمَا كَانَ ٱللَّهُ لِیُعَذِّبَهُمۡ وَأَنتَ فِیهِمۡۚ ۝٣٣
سورة الأنفال 
""")

# ayahHadithTwelveSeventeen_2: fragment - keep
# ayahHadithTwelveSeventeen_3: fragment - keep

# ayahHadithTwelveEighteen_1: 8:33 - add ۝
replace_field(f12, 'ayahHadithTwelveEighteen_1', """\
 وَمَا كَانَ ٱللَّهُ لِیُعَذِّبَهُمۡ وَأَنتَ فِیهِمۡۚ ۝٣٣
سورة الأنفال 
""")

# Ders 12 page 19 - Plain Arabic -> Uthmani
# TwelveNineteen_1: 33:21 - plain Arabic
replace_field(f12, 'ayahHadithTwelveNineteen_1', """\
لَّقَدۡ كَانَ لَكُمۡ فِی رَسُولِ ٱللَّهِ أُسۡوَةٌ حَسَنَةࣱ ۝٢١
سورة الأحزاب 
""")

# TwelveNineteen_2: 33:41 - plain Arabic
replace_field(f12, 'ayahHadithTwelveNineteen_2', """\
یَـٰۤأَیُّهَا ٱلَّذِینَ ءَامَنُوا۟ ٱذۡكُرُوا۟ ٱللَّهَ ذِكۡرࣰا كَثِیرࣰا ۝٤١
سورة الأحزاب 
""")

# TwelveNineteen_3: 9:128 - plain Arabic
replace_field(f12, 'ayahHadithTwelveNineteen_3', """\
لَقَدۡ جَاۤءَكُمۡ رَسُولࣱ مِّنۡ أَنفُسِكُمۡ عَزِیزٌ عَلَیۡهِ مَا عَنِتُّمۡ حَرِیصٌ عَلَیۡكُم بِٱلۡمُؤۡمِنِینَ رَءُوفࣱ رَّحِیمࣱ ۝١٢٨
سورة التوبة 
""")

# TwelveNineteen_4: 3:159 - plain Arabic
replace_field(f12, 'ayahHadithTwelveNineteen_4', """\
فَبِمَا رَحۡمَةࣲ مِّنَ ٱللَّهِ لِنتَ لَهُمۡۖ ۝١٥٩
سورة آل عمران 
""")

# TwelveNineteen_5: 15:72 - plain Arabic
replace_field(f12, 'ayahHadithTwelveNineteen_5', """\
لَعَمۡرُكَ إِنَّهُمۡ لَفِی سَكۡرَتِهِمۡ یَعۡمَهُونَ ۝٧٢
سورة الحجر 
""")

# TwelveNineteen_6: 68:4 - plain Arabic
replace_field(f12, 'ayahHadithTwelveNineteen_6', """\
وَإِنَّكَ لَعَلَىٰ خُلُقٍ عَظِیمࣲ ۝٤
سورة القلم 
""")


# ===== DERS 13 =====
print("\n=== Ders 13 ===")
f13 = BASE + 'elm_text_ders_therteen.dart'

# TherteenThree_2: 4:147 - add ۝
replace_field(f13, 'ayahHadithTherteenThree_2', """\

مَّا یَفۡعَلُ ٱللَّهُ بِعَذَابِكُمۡ إِن شَكَرۡتُمۡ وَءَامَنتُمۡۚ ۝١٤٧
سورة النساء 
""")

# TherteenFour_2: 16:97 - fix wrong ref (was الحج 40, should be النحل 97)
replace_field(f13, 'ayahHadithTherteenFour_2', """\

مَنۡ عَمِلَ صَـٰلِحࣰا مِّن ذَكَرٍ أَوۡ أُنثَىٰ وَهُوَ مُؤۡمِنࣱ فَلَنُحۡیِیَنَّهُۥ حَیَوٰةࣰ طَیِّبَةࣰۖ ۝٩٧
سورة النحل 
""")

# TherteenFive_1: 8:19 - plain Arabic -> Uthmani (وَأَنَّ اللَّهَ مَعَ الْمُؤْمِنِينَ)
replace_field(f13, 'ayahHadithTherteenFive_1', """\
وَأَنَّ ٱللَّهَ مَعَ ٱلۡمُؤۡمِنِینَ ۝١٩
سورة الأنفال 
""")

# TherteenFive_4: 13:11 - add ۝
replace_field(f13, 'ayahHadithTherteenFive_4', """\
إِنَّ ٱللَّهَ لَا یُغَیِّرُ مَا بِقَوۡمٍ حَتَّىٰ یُغَیِّرُوا۟ مَا بِأَنفُسِهِمۡۗ ۝١١
سورة الرعد 
""")

# TherteenSix_3: 64:11 - add ۝
replace_field(f13, 'ayahHadithTherteenSix_3', """\
 وَمَن یُؤۡمِنۢ بِٱللَّهِ یَهۡدِ قَلۡبَهُۥۚ ۝١١
سورة التغابن 
""")

# TherteenSeven_1: 64:11 - add ۝
replace_field(f13, 'ayahHadithTherteenSeven_1', """\
 وَمَن یُؤۡمِنۢ بِٱللَّهِ یَهۡدِ قَلۡبَهُۥۚ ۝١١
سورة التغابن 
""")

# TherteenTen_1: 16:97 - fix wrong ref (was الحج 97, should be النحل 97)
replace_field(f13, 'ayahHadithTherteenTen_1', """\
قال الله عز وجل 
مَنۡ عَمِلَ صَـٰلِحࣰا مِّن ذَكَرٍ أَوۡ أُنثَىٰ وَهُوَ مُؤۡمِنࣱ فَلَنُحۡیِیَنَّهُۥ حَیَوٰةࣰ طَیِّبَةࣰۖ ۝٩٧
سورة النحل 
""")

# TherteenTen_2: fix wrong ref (was النحل 97 but has الشورى 30 verse)
replace_field(f13, 'ayahHadithTherteenTen_2', """\
 وَمَاۤ أَصَـٰبَكُم مِّن مُّصِیبَةࣲ فَبِمَا كَسَبَتۡ أَیۡدِیكُمۡ وَیَعۡفُوا۟ عَن كَثِیرࣲ ۝٣٠ 
سورة الشورى 
""")


# ===== DERS 14 =====
print("\n=== Ders 14 ===")
f14 = BASE + 'elm_text_ders_fourteen.dart'

# FourteenThree_1: 2:25 partial - add ۝
replace_field(f14, 'ayahHadithFourteenThree_1', """\
 ٱلَّذِینَ ءَامَنُوا۟ وَعَمِلُوا۟ ٱلصَّـٰلِحَـٰتِ ۝٢٥
سورة البقرة 
""")

# FourteenSeven_2: 4:136 - plain Arabic -> Uthmani
replace_field(f14, 'ayahHadithFourteenSeven_2', """\
 یَـٰۤأَیُّهَا ٱلَّذِینَ ءَامَنُوۤا۟ ءَامِنُوا۟ بِٱللَّهِ وَرَسُولِهِۦ ۝١٣٦
سورة النساء 
""")

# FourteenEight_1: 16:44 - add ۝
replace_field(f14, 'ayahHadithFourteenEight_1', """\
 لِتُبَیِّنَ لِلنَّاسِ مَا نُزِّلَ إِلَیۡهِمۡ ۝٤٤
سورة النحل 
""")

# FourteenNine_1: 57:16 - plain Arabic -> Uthmani (no ۝, no sura ref)
replace_field(f14, 'ayahHadithFourteenNine_1', """\
 أَلَمۡ یَأۡنِ لِلَّذِینَ ءَامَنُوۤا۟ أَن تَخۡشَعَ قُلُوبُهُمۡ لِذِكۡرِ ٱللَّهِ وَمَا نَزَلَ مِنَ ٱلۡحَقِّ ۝١٦
سورة الحديد 
""")

# FourteenTen_3: 59:21 - plain Arabic -> Uthmani
replace_field(f14, 'ayahHadithFourteenTen_3', """\
لَوۡ أَنزَلۡنَا هَـٰذَا ٱلۡقُرۡءَانَ عَلَىٰ جَبَلࣲ لَّرَأَیۡتَهُۥ خَاشِعࣰا مُّتَصَدِّعࣰا مِّنۡ خَشۡیَةِ ٱللَّهِ ۝٢١
سورة الحشر 
""")


# ===== DERS 15 =====
print("\n=== Ders 15 ===")
f15 = BASE + 'elm_text_ders_fifteen.dart'

# FifteenOne_1: 35:10 - add ۝
replace_field(f15, 'ayahHadithFifteenOne_1', """\
 مَن كَانَ یُرِیدُ ٱلۡعِزَّةَ فَلِلَّهِ ٱلۡعِزَّةُ جَمِیعًاۚ إِلَیۡهِ یَصۡعَدُ ٱلۡكَلِمُ ٱلطَّیِّبُ وَٱلۡعَمَلُ ٱلصَّـٰلِحُ یَرۡفَعُهُۥۚ ۝١٠
سورة فاطر 
""")

# FifteenFive_1: 2:146 partial - add ۝
replace_field(f15, 'ayahHadithFifteenFive_1', """\
( یَعۡرِفُونَهُۥ كَمَا یَعۡرِفُونَ أَبۡنَاۤءَهُمۡۖ ۝١٤٦ ) 
سورة البقرة 
""")

# FifteenEight_1: 35:10 partial - add ۝
replace_field(f15, 'ayahHadithFifteenEight_1', """\
 مَن كَانَ یُرِیدُ ٱلۡعِزَّةَ فَلِلَّهِ ٱلۡعِزَّةُ جَمِیعًاۚ ۝١٠
سورة فاطر 
""")

# FifteenFourteen_1: 3:26 - fix wrong ref (was 126, should be 26)
replace_field(f15, 'ayahHadithFifteenFourteen_1', """\
 تُؤۡتِی ٱلۡمُلۡكَ مَن تَشَاۤءُ وَتَنزِعُ ٱلۡمُلۡكَ مِمَّن تَشَاۤءُ ۝٢٦
 سورة آل عمران 
""")

# FifteenFifteen_1: 3:26 - fix wrong ref (was 126, should be 26)
replace_field(f15, 'ayahHadithFifteenFifteen_1', """\
 وَتُعِزُّ مَن تَشَاۤءُ وَتُذِلُّ مَن تَشَاۤءُۖ ۝٢٦
 سورة آل عمران 
""")

# FifteenSixteen_1: 3:26 - fix wrong ref (was 126, should be 26)
replace_field(f15, 'ayahHadithFifteenSixteen_1', """\
قُلِ ٱللَّهُمَّ مَـٰلِكَ ٱلۡمُلۡكِ تُؤۡتِی ٱلۡمُلۡكَ مَن تَشَاۤءُ وَتَنزِعُ ٱلۡمُلۡكَ مِمَّن تَشَاۤءُ وَتُعِزُّ مَن تَشَاۤءُ وَتُذِلُّ مَن تَشَاۤءُۖ ۝٢٦
 سورة آل عمران 
""")

print("\nDone!")
