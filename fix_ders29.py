#!/usr/bin/env python3
"""Fix ayahHadith fields in ders 29: Uthmani tashkeel."""

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

f29 = BASE + 'elm_text_ders_twenty_nine.dart'

print("=== Ders 29 ===")

# 1. ayahHadithTwentyNinePageFifteen_1: 76:20
replace_field(f29, 'ayahHadithTwentyNinePageFifteen_1', """\
والقائل: {وَإِذَا رَأَيْتَ ثَمَّ رَأَيْتَ نَعِيمًۭا وَمُلْكًۭا كَبِيرًا}.
""")

print("\nDone!")
