#!/usr/bin/env python3
"""Fix ayahHadith fields in elm_text_ders_pre.dart: Uthmani tashkeel."""

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

f = BASE + 'elm_text_ders_pre.dart'

print("=== Pre ===")

# 1. ayahHadithPreOne_1: 51:55 - standardize format
replace_field(f, 'ayahHadithPreOne_1', """\
وَذَكِّرْ فَإِنَّ ٱلذِّكْرَىٰ تَنفَعُ ٱلْمُؤْمِنِينَ ۝٥٥
سورة الذاريات
""")

# 2. ayahHadithPreThree_1: 2:208 full
replace_field(f, 'ayahHadithPreThree_1', """\
يَـٰٓأَيُّهَا ٱلَّذِينَ ءَامَنُوا۟ ٱدْخُلُوا۟ فِى ٱلسِّلْمِ كَآفَّةًۭ وَلَا تَتَّبِعُوا۟ خُطُوَٰتِ ٱلشَّيْطَٰنِ ۚ إِنَّهُۥ لَكُمْ عَدُوٌّۭ مُّبِينٌۭ ۝٢٠٨
سورة البقرة
""")

# 3. ayahHadithPreThree_2: 2:208 fragment
replace_field(f, 'ayahHadithPreThree_2', """\
ٱدْخُلُوا۟ فِى ٱلسِّلْمِ
""")

# 4. ayahHadithPreThree_3: 2:208 fragment
replace_field(f, 'ayahHadithPreThree_3', """\
ٱدْخُلُوا۟ فِى ٱلسِّلْمِ
""")

print("\nDone!")
