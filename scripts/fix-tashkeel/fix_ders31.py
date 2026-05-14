#!/usr/bin/env python3
"""Fix ayahHadith fields in ders 31: Uthmani tashkeel."""

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

f31 = BASE + 'elm_text_ders_thirty_one.dart'

print("=== Ders 31 ===")

# 1. ayahHadithThirtyOnePageFour_1: 10:71 (full ayah)
replace_field(f31, 'ayahHadithThirtyOnePageFour_1', """\
۞ وَٱتْلُ عَلَيْهِمْ نَبَأَ نُوحٍ إِذْ قَالَ لِقَوْمِهِۦ يَٰقَوْمِ إِن كَانَ كَبُرَ عَلَيْكُم مَّقَامِى وَتَذْكِيرِى بِـَٔايَٰتِ ٱللَّهِ فَعَلَى ٱللَّهِ تَوَكَّلْتُ فَأَجْمِعُوٓا۟ أَمْرَكُمْ وَشُرَكَآءَكُمْ ثُمَّ لَا يَكُنْ أَمْرُكُمْ عَلَيْكُمْ غُمَّةًۭ ثُمَّ ٱقْضُوٓا۟ إِلَىَّ وَلَا تُنظِرُونِ ۝٧١
سورة يونس
""")

# 2. ayahHadithThirtyOnePageSix_1: 54:10 (full ayah)
replace_field(f31, 'ayahHadithThirtyOnePageSix_1', """\
فَدَعَا رَبَّهُۥٓ أَنِّى مَغْلُوبٌۭ فَٱنتَصِرْ ۝١٠
سورة القمر
""")

# 3. ayahHadithThirtyOnePageNine_1: 11:42 fragment - no surah/۝
replace_field(f31, 'ayahHadithThirtyOnePageNine_1', """\
يَٰبُنَىَّ ٱرْكَب مَّعَنَا وَلَا تَكُن مَّعَ ٱلْكَٰفِرِينَ
""")

print("\nDone!")
