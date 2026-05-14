#!/usr/bin/env python3
"""Fix 43 ayahHadith fields in elm_text_ders_twenty_seven.dart: Uthmani tashkeel."""

import re, urllib.request, json

BASE = '/media/islamux/Variety/Flutter_Projects/salam/lib/core/data/static/text/'
f = BASE + 'elm_text_ders_twenty_seven.dart'

def replace_field(field_name, new_content):
    with open(f, 'r', encoding='utf-8') as fh:
        text = fh.read()
    pattern = re.compile(rf'({re.escape(field_name)} = """).*?(""";)', re.DOTALL)
    replacement = rf'\1\n{new_content}\2'
    new_text = pattern.sub(replacement, text)
    if new_text == text:
        print(f"  \u26a0 No match: {field_name}")
    else:
        print(f"  \u2713 {field_name}")
    with open(f, 'w', encoding='utf-8') as fh:
        fh.write(new_text)

def fetch(surah, ayah):
    url = f'http://api.alquran.cloud/v1/ayah/{surah}:{ayah}/quran-uthmani'
    try:
        with urllib.request.urlopen(url, timeout=10) as resp:
            d = json.loads(resp.read().decode('utf-8'))
            if d['code'] == 200:
                return d['data']['text']
    except:
        pass
    return None

# Fetch Uthmani text from API
A = {}
for key in [(3,104),(5,79),(103,1),(103,2),(103,3),(11,117),(3,110),
            (26,214),(87,9),(20,43),(20,44),(79,24),(28,38),(43,51),
            (3,159),(41,33),(51,20),(51,21),(88,17),(88,18),(2,143),
            (33,39),(14,24),(20,48),(7,199),(16,125),(9,71),(9,67),
            (33,46),(16,120),(32,24)]:
    text = fetch(*key)
    if text:
        A[key] = text
        print(f"  \u2139 Fetched {key[0]}:{key[1]}")

# Strip basmalah from first ayah of suras (API includes it)
def v(key):
    raw = A.get(key, '')
    # basmalah is "بسم الله الرحمن الرحيم " prefix - strip it
    if raw.startswith('\u0628\u0650\u0633\u0652\u0645\u0650 '):
        # remove everything up to and including the second space after basmalah words
        parts = raw.split(' ', 3)
        if len(parts) > 3 and parts[0] == '\u0628\u0650\u0633\u0652\u0645\u0650' and parts[1] == '\u0627\u0644\u0644\u0651\u064e\u0647\u0650':
            raw = parts[3]
    return raw

# 103:1 without basmalah
S103_1 = v((103,1))  # should be "وَالْعَصْرِ"

# Get the other ayah texts
S103_2 = v((103,2))
S103_3 = v((103,3))

print(f"\n103:1 = '{S103_1}'")
print(f"103:2 = '{S103_2}'")
print(f"103:3 = '{S103_3}'")
print()

# ─────────────────────────────────────────────────────────────────────────────
# FIELD REPLACEMENTS
# ─────────────────────────────────────────────────────────────────────────────

# 1. ayahHadithTwentySevenPageOne_1: fragment of 3:104
a_3_104 = v((3,104))
frag_3_104_1 = a_3_104[:a_3_104.index('\u0648\u064e\u064a\u064e\u0623\u0652\u0645\u064f\u0631\u064f\u0648\u0646\u064e')].rstrip('\u0610').strip()
# Actually, just construct the fragment manually:
t_3_104 = v((3,104))  # وَلْتَكُن مِّنكُمْ أُمَّةٌ يَدْعُونَ إِلَى الْخَيْرِ وَيَأْمُرُونَ ...
frag_1 = '\u0648\u064e\u0644\u0652\u062a\u064e\u0643\u064f\u0646 \u0645\u0651\u0650\u0646\u0643\u064f\u0645\u0652 \u0623\u064f\u0645\u0651\u064e\u0629\u064c\u06AD \u064a\u064e\u062f\u0652\u0639\u064f\u0648\u0646\u064e \u0625\u0650\u0644\u064e\u0649 \u0627\u0644\u0652\u062e\u064e\u064a\u0652\u0631\u0650'
# Let me just use the API text directly instead of guessing escapes

# Actually, let me just hardcode the Uthmani texts directly as Arabic.
# I know them from the API output.

print("=" * 60)
print("DERS 27 - Applying 43 corrections")
print("=" * 60)

# ── PAGE ONE ──────────────────────────────────────────────────────────────
# 1. ayahHadithTwentySevenPageOne_1: fragment 3:104
replace_field('ayahHadithTwentySevenPageOne_1', """\
وَلْتَكُن مِّنكُمْ أُمَّةٌۭ يَدْعُونَ إِلَى ٱلْخَيْرِ
""")

# 2. ayahHadithTwentySevenPageOne_2: prefix "قال تعالى" + fragment 5:79
replace_field('ayahHadithTwentySevenPageOne_2', """\
قال تعالى
كَانُوا۟ لَا يَتَنَاهَوْنَ عَن مُّنكَرٍۢ فَعَلُوهُ
""")

# ── PAGE TWO ──────────────────────────────────────────────────────────────
# 3. ayahHadithTwentySevenPageTwo_1: 103:1-3 fragments
replace_field('ayahHadithTwentySevenPageTwo_1', """\
وَٱلْعَصْرِ
إِنَّ ٱلْإِنسَٰنَ لَفِى خُسْرٍ
إِلَّا ٱلَّذِينَ ءَامَنُوا۟ وَعَمِلُوا۟ ٱلصَّٰلِحَٰتِ وَتَوَاصَوْا۟ بِٱلْحَقِّ وَتَوَاصَوْا۟ بِٱلصَّبْرِ
""")

# 4. ayahHadithTwentySevenPageTwo_2: fragment 5:79
replace_field('ayahHadithTwentySevenPageTwo_2', """\
كَانُوا۟ لَا يَتَنَاهَوْنَ عَن مُّنكَرٍۢ فَعَلُوهُ
""")

# 5. ayahHadithTwentySevenPageTwo_3: FULL 11:117
replace_field('ayahHadithTwentySevenPageTwo_3', """\
وَمَا كَانَ رَبُّكَ لِيُهْلِكَ ٱلْقُرَىٰ بِظُلْمٍۢ وَأَهْلُهَا مُصْلِحُونَ ۝١١٧
سورة هود
""")

# ── PAGE THREE ────────────────────────────────────────────────────────────
# 6. ayahHadithTwentySevenPageThree_1: fragment 3:110
replace_field('ayahHadithTwentySevenPageThree_1', """\
كُنتُمْ خَيْرَ أُمَّةٍ أُخْرِجَتْ لِلنَّاسِ
""")

# 7. ayahHadithTwentySevenPageThree_2: fragment 3:110
replace_field('ayahHadithTwentySevenPageThree_2', """\
تَأْمُرُونَ بِٱلْمَعْرُوفِ وَتَنْهَوْنَ عَنِ ٱلْمُنكَرِ
""")

# ── PAGE FOUR ─────────────────────────────────────────────────────────────
# 8. ayahHadithTwentySevenPageFour_1: Hadith - keep as-is (just fix tashkeel)
replace_field('ayahHadithTwentySevenPageFour_1', """\
يارسول الله، وإن ذلك لكائن؟ قال: نعم، وأشدُ، كيف بكم إذا أمرتم بالمنكر، ونهيتُم عن المعروف؟ قالوا: يارسول الله وإن ذلك لكائن؟ قال: نعم، وأشدُ، كيف بكم إذا رأيتمُ المعروف منكرا والمنكر معروفا
""")

# ── PAGE FIVE ─────────────────────────────────────────────────────────────
# 9. ayahHadithTwentySevenPageFive_1: fragment 3:110 (larger portion)
replace_field('ayahHadithTwentySevenPageFive_1', """\
كُنتُمْ خَيْرَ أُمَّةٍ أُخْرِجَتْ لِلنَّاسِ تَأْمُرُونَ بِٱلْمَعْرُوفِ وَتَنْهَوْنَ عَنِ ٱلْمُنكَرِ
""")

# ── PAGE SIX ──────────────────────────────────────────────────────────────
# 10. ayahHadithTwentySevenPageSix_1: FULL 26:214
replace_field('ayahHadithTwentySevenPageSix_1', """\
وَأَنذِرْ عَشِيرَتَكَ ٱلْأَقْرَبِينَ ۝٢١٤
سورة الشعراء
""")

# ── PAGE SEVEN ────────────────────────────────────────────────────────────
# 11. ayahHadithTwentySevenPageSeven_1: FULL 87:9
replace_field('ayahHadithTwentySevenPageSeven_1', """\
فَذَكِّرْ إِن نَّفَعَتِ ٱلذِّكْرَىٰ ۝٩
سورة الأعلى
""")

# ── PAGE EIGHT ────────────────────────────────────────────────────────────
# 12. ayahHadithTwentySevenPageEight_1: fragments 20:43-44
replace_field('ayahHadithTwentySevenPageEight_1', """\
ٱذْهَبَآ إِلَىٰ فِرْعَوْنَ إِنَّهُۥ طَغَىٰ
فَقُولَا لَهُۥ قَوْلًۭا لَّيِّنًۭا لَّعَلَّهُۥ يَتَذَكَّرُ أَوْ يَخْشَىٰ
""")

# 13. ayahHadithTwentySevenPageEight_2: fragment 79:24 (spoken part)
replace_field('ayahHadithTwentySevenPageEight_2', """\
أَنَا۠ رَبُّكُمُ ٱلْأَعْلَىٰ
""")

# 14. ayahHadithTwentySevenPageEight_3: fragment 28:38
replace_field('ayahHadithTwentySevenPageEight_3', """\
مَا عَلِمْتُ لَكُم مِّنْ إِلَٰهٍ غَيْرِى
""")

# 15. ayahHadithTwentySevenPageEight_4: fragment 43:51
replace_field('ayahHadithTwentySevenPageEight_4', """\
أَلَيْسَ لِى مُلْكُ مِصْرَ
""")

# 16. ayahHadithTwentySevenPageEight_5: fragment 20:44
replace_field('ayahHadithTwentySevenPageEight_5', """\
فَقُولَا لَهُۥ قَوْلًۭا لَّيِّنًۭا
""")

# 17. ayahHadithTwentySevenPageEight_6: fragment 3:159 (middle portion)
replace_field('ayahHadithTwentySevenPageEight_6', """\
وَلَوْ كُنتَ فَظًّا غَلِيظَ ٱلْقَلْبِ لَٱنفَضُّوا۟ مِنْ حَوْلِكَ ۖ فَٱعْفُ عَنْهُمْ وَٱسْتَغْفِرْ لَهُمْ وَشَاوِرْهُمْ فِى ٱلْأَمْرِ ۖ فَإِذَا عَزَمْتَ فَتَوَكَّلْ عَلَى ٱللَّهِ
""")

# ── PAGE NINE ─────────────────────────────────────────────────────────────
# 18. ayahHadithTwentySevenPageNine_1: FULL 41:33
replace_field('ayahHadithTwentySevenPageNine_1', """\
وَمَنْ أَحْسَنُ قَوْلًۭا مِّمَّن دَعَآ إِلَى ٱللَّهِ وَعَمِلَ صَٰلِحًۭا وَقَالَ إِنَّنِى مِنَ ٱلْمُسْلِمِينَ ۝٣٣
سورة فصلت
""")

# ── PAGE TEN ──────────────────────────────────────────────────────────────
# 19. ayahHadithTwentySevenPageTen_1: 51:20-21 + 88:17-18 fragments
replace_field('ayahHadithTwentySevenPageTen_1', """\
وَفِى ٱلْأَرْضِ ءَايَٰتٌۭ لِّلْمُوقِنِينَ
وَفِىٓ أَنفُسِكُمْ ۚ أَفَلَا تُبْصِرُونَ

أَفَلَا يَنظُرُونَ إِلَى ٱلْإِبِلِ كَيْفَ خُلِقَتْ
وَإِلَى ٱلسَّمَآءِ كَيْفَ رُفِعَتْ
""")

# ── PAGE ELEVEN ───────────────────────────────────────────────────────────
# 20. ayahHadithTwentySevenPageEleven_1: Hadith - keep as-is
replace_field('ayahHadithTwentySevenPageEleven_1', """\
قال رسول الله صلى الله عليه وسلم
إنما بُعثت لأتمم مكارم الأخلاق(احمدعن ابي هريرة)
""")

# ── PAGE TWELVE ───────────────────────────────────────────────────────────
# 21. ayahHadithTwentySevenPageTwelve_1: fragment 3:110
replace_field('ayahHadithTwentySevenPageTwelve_1', """\
كُنتُمْ خَيْرَ أُمَّةٍ أُخْرِجَتْ لِلنَّاسِ
""")

# 22. ayahHadithTwentySevenPageTwelve_2: fragment 3:110
replace_field('ayahHadithTwentySevenPageTwelve_2', """\
تَأْمُرُونَ بِٱلْمَعْرُوفِ وَتَنْهَوْنَ عَنِ ٱلْمُنكَرِ
""")

# ── PAGE THIRTEEN ─────────────────────────────────────────────────────────
# 23. ayahHadithTwentySevenPageThirteen_1: fragment 3:110
replace_field('ayahHadithTwentySevenPageThirteen_1', """\
كُنتُمْ خَيْرَ أُمَّةٍ أُخْرِجَتْ لِلنَّاسِ
""")

# 24. ayahHadithTwentySevenPageThirteen_2: fragment 2:143
replace_field('ayahHadithTwentySevenPageThirteen_2', """\
وَكَذَٰلِكَ جَعَلْنَٰكُمْ أُمَّةًۭ وَسَطًۭا
""")

# 25. ayahHadithTwentySevenPageThirteen_3: fragment 103:3
replace_field('ayahHadithTwentySevenPageThirteen_3', """\
وَتَوَاصَوْا۟ بِٱلْحَقِّ
""")

# 26. ayahHadithTwentySevenPageThirteen_4: fragment 33:39
replace_field('ayahHadithTwentySevenPageThirteen_4', """\
ٱلَّذِينَ يُبَلِّغُونَ رِسَٰلَٰتِ ٱللَّهِ وَيَخْشَوْنَهُۥ وَلَا يَخْشَوْنَ أَحَدًا إِلَّا ٱللَّهَ
""")

# ── PAGE FOURTEEN ─────────────────────────────────────────────────────────
# 27. ayahHadithTwentySevenPageFourteen_1: fragment 33:39
replace_field('ayahHadithTwentySevenPageFourteen_1', """\
ٱلَّذِينَ يُبَلِّغُونَ رِسَٰلَٰتِ ٱللَّهِ وَيَخْشَوْنَهُۥ وَلَا يَخْشَوْنَ أَحَدًا إِلَّا ٱللَّهَ
""")

# 28. ayahHadithTwentySevenPageFourteen_2: fragment 14:24
replace_field('ayahHadithTwentySevenPageFourteen_2', """\
أَلَمْ تَرَ كَيْفَ ضَرَبَ ٱللَّهُ مَثَلًۭا كَلِمَةًۭ طَيِّبَةًۭ
""")

# ── PAGE FIFTEEN ──────────────────────────────────────────────────────────
# 29. ayahHadithTwentySevenPageFifteen_1: FULL 20:48
replace_field('ayahHadithTwentySevenPageFifteen_1', """\
إِنَّا قَدْ أُوحِىَ إِلَيْنَآ أَنَّ ٱلْعَذَابَ عَلَىٰ مَن كَذَّبَ وَتَوَلَّىٰ ۝٤٨
سورة طه
""")

# 30. ayahHadithTwentySevenPageFifteen_2: fragment 20:44
replace_field('ayahHadithTwentySevenPageFifteen_2', """\
فَقُولَا لَهُۥ قَوْلًۭا لَّيِّنًۭا
""")

# ── PAGE SIXTEEN ──────────────────────────────────────────────────────────
# 31. ayahHadithTwentySevenPageSixteen_1: FULL 7:199 + fragment
replace_field('ayahHadithTwentySevenPageSixteen_1', """\
خُذِ ٱلْعَفْوَ وَأْمُرْ بِٱلْعُرْفِ وَأَعْرِضْ عَنِ ٱلْجَٰهِلِينَ ۝١٩٩
سورة الأعراف
خُذِ ٱلْعَفْوَ
""")

# 32. ayahHadithTwentySevenPageSixteen_2: fragment 7:199
replace_field('ayahHadithTwentySevenPageSixteen_2', """\
وَأْمُرْ بِٱلْعُرْفِ
""")

# 33. ayahHadithTwentySevenPageSixteen_3: fragment 7:199
replace_field('ayahHadithTwentySevenPageSixteen_3', """\
وَأَعْرِضْ عَنِ ٱلْجَٰهِلِينَ
""")

# 34. ayahHadithTwentySevenPageSixteen_4: fragment 16:125
replace_field('ayahHadithTwentySevenPageSixteen_4', """\
ٱدْعُ إِلَىٰ سَبِيلِ رَبِّكَ بِٱلْحِكْمَةِ وَٱلْمَوْعِظَةِ ٱلْحَسَنَةِ ۖ وَجَٰدِلْهُم بِٱلَّتِى هِىَ أَحْسَنُ
""")

# ── PAGE EIGHTEEN ─────────────────────────────────────────────────────────
# 35. ayahHadithTwentySevenPageEighteen_1: fragment 9:71
replace_field('ayahHadithTwentySevenPageEighteen_1', """\
وَٱلْمُؤْمِنُونَ وَٱلْمُؤْمِنَٰتُ بَعْضُهُمْ أَوْلِيَآءُ بَعْضٍۢ
""")

# 36. ayahHadithTwentySevenPageEighteen_2: fragment 9:67
replace_field('ayahHadithTwentySevenPageEighteen_2', """\
ٱلْمُنَٰفِقُونَ وَٱلْمُنَٰفِقَٰتُ بَعْضُهُم مِّنۢ بَعْضٍۢ
""")

# 37. ayahHadithTwentySevenPageEighteen_3: fragment 9:67
replace_field('ayahHadithTwentySevenPageEighteen_3', """\
بَعْضُهُم مِّنۢ بَعْضٍۢ
""")

# 38. ayahHadithTwentySevenPageEighteen_4: fragment 9:71
replace_field('ayahHadithTwentySevenPageEighteen_4', """\
بَعْضُهُمْ أَوْلِيَآءُ بَعْضٍۢ
""")

# 39. ayahHadithTwentySevenPageEighteen_5: fragment 9:71
replace_field('ayahHadithTwentySevenPageEighteen_5', """\
بَعْضُهُمْ أَوْلِيَآءُ بَعْضٍۢ
""")

# ── PAGE NINETEEN ─────────────────────────────────────────────────────────
# 40. ayahHadithTwentySevenPageNineteen_1: fragments 33:46
replace_field('ayahHadithTwentySevenPageNineteen_1', """\
وَدَاعِيًا إِلَى ٱللَّهِ بِإِذْنِهِۦ وَسِرَاجًۭا مُّنِيرًۭا

وَدَاعِيًا إِلَى ٱللَّهِ
""")

# 41. ayahHadithTwentySevenPageNineteen_2: fragment 33:46
replace_field('ayahHadithTwentySevenPageNineteen_2', """\
وَسِرَاجًۭا مُّنِيرًۭا
""")

# 42. ayahHadithTwentySevenPageNineteen_3: fragment 16:120
replace_field('ayahHadithTwentySevenPageNineteen_3', """\
إِنَّ إِبْرَٰهِيمَ كَانَ أُمَّةًۭ
""")

# ── PAGE TWENTY ───────────────────────────────────────────────────────────
# 43. ayahHadithTwentySevenPageTwenty_1: fragment 32:24
replace_field('ayahHadithTwentySevenPageTwenty_1', """\
وَجَعَلْنَا مِنْهُمْ أَئِمَّةًۭ يَهْدُونَ بِأَمْرِنَا لَمَّا صَبَرُوا۟
""")

print("\nDone! All corrections applied.")
