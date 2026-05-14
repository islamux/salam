#!/usr/bin/env python3
"""Fix broken fragment extractions in ders 26 file."""

import re
import urllib.request
import json

BASE = '/media/islamux/Variety/Flutter_Projects/salam/lib/core/data/static/text/'
f = BASE + 'elm_text_ders_twenty_six.dart'

def fetch_uthmani(surah, ayah):
    url = f'http://api.alquran.cloud/v1/ayah/{surah}:{ayah}/quran-uthmani'
    with urllib.request.urlopen(url, timeout=15) as resp:
        return json.loads(resp.read().decode())['data']['text']

def replace_field(filepath, field_name, new_content):
    with open(filepath, 'r', encoding='utf-8') as fh:
        text = fh.read()
    # Escape backslashes in new_content for the replacement string
    escaped = new_content.replace('\\', '\\\\')
    pattern = re.compile(rf'({re.escape(field_name)} = """).*?(""";)', re.DOTALL)
    replacement = rf'\1\n{escaped}\2'
    new_text = pattern.sub(replacement, text)
    if new_text == text:
        print(f"  !! No match: {field_name}")
    else:
        print(f"  OK: {field_name}")
    with open(filepath, 'w', encoding='utf-8') as fh:
        fh.write(new_text)

# Fix 1: ayahHadithTwentySixPageTwo_1 - 4:172 fragment
t = fetch_uthmani(4, 172)
# Waqf meem is U+06DA
idx = t.find('\u06da')
frag = t[idx+1:].strip() if idx >= 0 else t
print(f"4:172 fragment: ...{frag[:30]}...")
replace_field(f, 'ayahHadithTwentySixPageTwo_1', frag)

# Fix 2: ayahHadithTwentySixPageThree_2 - 38:76 fragment before the ۖ
t38 = fetch_uthmani(38, 76)
idx = t38.find('\u0656')
frag38 = t38[:idx].strip() if idx >= 0 else 'قَالَ أَنَا۠ خَيْرٌۭ مِّنْهُ'
print(f"38:76 fragment: {frag38}")
replace_field(f, 'ayahHadithTwentySixPageThree_2', frag38)

# Fix 3: ayahHadithTwentySixPageTwo_3 - also uses 38:76 fragment
t38_76 = fetch_uthmani(38, 76)
idx = t38_76.find('\u0656')
frag38s = t38_76[:idx].strip() if idx >= 0 else 'قَالَ أَنَا۠ خَيْرٌۭ مِّنْهُ'
kr_rdai = '\u0671\u0644\u0652\u0643\u0650\u0628\u0652\u0631\u0650\u064a\u064e\u0627\u0621\u064f \u0631\u0650\u062f\u064e\u0627\u0626\u0650\u0649\u060c \u0648\u064e\u0671\u0644\u0652\u0639\u064e\u0638\u064e\u0645\u064e\u0629\u064f \u0625\u0650\u0632\u064e\u0627\u0631\u0650\u0649\u060c \u0641\u064e\u0645\u064e\u0646\u0652 \u0646\u064e\u0627\u0632\u064e\u0639\u064e\u0646\u0650\u0649 \u0648\u064e\u0670\u062d\u0650\u062f\u064b\u0627 \u0645\u0650\u0646\u0652\u0647\u064f\u0645\u064e\u0627 \u0642\u064e\u0630\u064e\u0641\u0652\u062a\u064f\u0647\u064f\u06e5 \u0641\u0650\u0649 \u0671\u0644\u0646\u0651\u064e\u0627\u0631\u0650 (\u0623\u064e\u062d\u0652\u0645\u064e\u062f\u064f \u0639\u064e\u0646\u0652 \u0623\u064e\u0628\u0650\u0649 \u0647\u064f\u0631\u064e\u064a\u0652\u0631\u064e\u0629\u064e)'
replace_field(f, 'ayahHadithTwentySixPageTwo_3', 
    f'{frag38s}\n\n\u0644\u0650\u0630\u0670\u0644\u0650\u0643\u064e \u0648\u064e\u0631\u064e\u062f\u064e \u0639\u064e\u0646\u0652 \u0631\u064e\u0633\u064f\u0648\u0644\u0650 \u0671\u0644\u0644\u0651\u064e\u0647\u0650 \u0635\u064e\u0644\u0651\u064e\u0649 \u0671\u0644\u0644\u0651\u064e\u0647\u064f \u0639\u064e\u0644\u064e\u064a\u0652\u0647\u0650 \u0648\u064e\u0633\u064e\u0644\u0651\u064e\u0645\u064e \u0639\u064e\u0646\u0650 \u0671\u0644\u0644\u0651\u064e\u0647\u0650 \u0639\u064e\u0632\u0651\u064e \u0648\u064e\u062c\u064e\u0644\u0651\u064e\n{kr_rdai}')

# Fix 4: ayahHadithTwentySixPageFour_1 - fix سَؤِلَ to سُئِلَ
replace_field(f, 'ayahHadithTwentySixPageFour_1',
    '\u0633\u064f\u0626\u0650\u0644\u064e \u0633\u064e\u064a\u0651\u0650\u062f\u064f\u0646\u064e\u0627 \u0671\u0644\u0652\u0639\u064e\u0628\u0651\u064e\u0627\u0633\u064f \u0631\u064e\u0636\u0650\u064a\u064e \u0671\u0644\u0644\u0651\u064e\u0647\u064f \u0639\u064e\u0646\u0652\u0647\u064f: \u0623\u064e\u064a\u0651\u064f\u0643\u064f\u0645\u064e\u0627 \u0623\u064e\u0643\u0652\u0628\u064e\u0631\u064f \u0623\u064e\u0646\u0652\u062a\u064e \u0623\u064e\u0645\u0652 \u0631\u064e\u0633\u064f\u0648\u0644\u064f \u0671\u0644\u0644\u0651\u064e\u0647\u0650\u061f \u0641\u064e\u0642\u064e\u0627\u0644\u064e \u0631\u064e\u0636\u0650\u064a\u064e \u0671\u0644\u0644\u0651\u064e\u0647\u064f \u0639\u064e\u0646\u0652\u0647\u064f: \u0647\u064f\u0648\u064e \u0623\u064e\u0643\u0652\u0628\u064e\u0631\u064f \u0645\u0650\u0646\u0651\u0650\u064a \u0642\u064e\u062f\u0652\u0631\u064b\u0627 \u0628\u0650\u0644\u064e\u0627 \u0634\u064e\u0643\u0651\u064d\u060c \u0648\u064e\u0623\u064e\u0646\u064e\u0627 \u0648\u064f\u0644\u0650\u062f\u0652\u062a\u064f \u0642\u064e\u0628\u0652\u0644\u064e\u0647\u064f\u06e5')

# Fix 5: ayahHadithTwentySixPageFour_2 - fix حَبَشِىٌّ
replace_field(f, 'ayahHadithTwentySixPageFour_2',
    '\u0639\u064e\u0646\u0652 \u0623\u064e\u0646\u064e\u0633\u0650 \u0628\u0652\u0646\u0650 \u0645\u064e\u0627\u0644\u0650\u0643\u064d \u0639\u064e\u0646\u0650 \u0671\u0644\u0646\u0651\u064e\u0628\u0650\u064a\u0651\u0650 \u0635\u064e\u0644\u0651\u064e\u0649 \u0671\u0644\u0644\u0651\u064e\u0647\u064f \u0639\u064e\u0644\u064e\u064a\u0652\u0647\u0650 \u0648\u064e\u0633\u064e\u0644\u0651\u064e\u0645\u064e \u0642\u064e\u0627\u0644\u064e:{\u0671\u0633\u0652\u0645\u064e\u0639\u064f\u0648\u0627\u06df\u060c \u0648\u064e\u0623\u064e\u0637\u0650\u064a\u0639\u064f\u0648\u0627\u06df\u060c \u0648\u064e\u0625\u0650\u0646\u0650 \u0671\u0633\u0652\u062a\u064f\u0639\u0652\u0645\u0650\u0644\u064e \u062d\u064e\u0628\u064e\u0634\u0650\u064a\u0651\u064c \u0643\u064e\u0627\u0646\u064e \u0639\u064e\u0644\u064e\u0649\u0670 \u0631\u064e\u0623\u0652\u0633\u0650\u0647\u0650\u06e6 \u0632\u064e\u0628\u0650\u064a\u0628\u064e\u0629\u064c}[\u0671\u0644\u0652\u0628\u064f\u062e\u064e\u0627\u0631\u0650\u064a]')

# Fix 6: ayahHadithTwentySixPageFour_4 - 28:83 fragment (U+06DA for waqf meem)
t28 = fetch_uthmani(28, 83)
idx = t28.find('\u06da')
frag28_a = t28[:idx].strip() if idx >= 0 else t28
print(f"28:83 fragment a: ...{frag28_a[-20:]}...")
replace_field(f, 'ayahHadithTwentySixPageFour_4', frag28_a)

# Fix 7: ayahHadithTwentySixPageFour_5 - 28:83 fragment (للذين...)
idx = t28.find('\u0644\u0651\u0650\u0644\u0651\u064e\u0630\u0650\u064a\u0646\u064e')
idx2 = t28.find('\u06da')
frag28_b = t28[idx:idx2].strip() if idx >= 0 and idx2 >= 0 else t28
print(f"28:83 fragment b: {frag28_b[:40]}...")
replace_field(f, 'ayahHadithTwentySixPageFour_5', frag28_b)

# Fix 8: ayahHadithTwentySixPageSeven_1 - 49:11 fragment with ۖ
t49 = fetch_uthmani(49, 11)
idx = t49.find('\u0656')
frag49 = t49[:idx].strip() if idx >= 0 else t49
print(f"49:11 fragment: {frag49[:60]}...")
replace_field(f, 'ayahHadithTwentySixPageSeven_1',
    '\u064a\u064e\u0642\u064f\u0648\u0644\u064f \u0671\u0644\u0644\u0651\u064e\u0647\u064f \u0639\u064e\u0632\u0651\u064e \u0648\u064e\u062c\u064e\u0644\u0651\u064e\n' + frag49)

# Fix 9: ayahHadithTwentySixPageTen_1 - 40:35 fragment
t40 = fetch_uthmani(40, 35)
idx = t40.find('\u0643\u064e\u0630\u0670\u0644\u0650\u0643\u064e')
frag40 = t40[idx:].strip() if idx >= 0 else t40
print(f"40:35 fragment: {frag40[:40]}...")
replace_field(f, 'ayahHadithTwentySixPageTen_1', frag40)

# Fix 10: ayahHadithTwentySixPageEleven_9 - 31:18 fragment (ولا تمش)
t31 = fetch_uthmani(31, 18)
idx = t31.find('\u0648\u064e\u0644\u064e\u0627 \u062a\u064e\u0645\u0652\u0634\u0650')
idx2 = t31.find('\u0656')
frag31_b = t31[idx:idx2].strip() if idx >= 0 and idx2 >= 0 else t31
print(f"31:18 fragment b: {frag31_b}")
replace_field(f, 'ayahHadithTwentySixPageEleven_9', frag31_b)

print("\nFixup done!")
