import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    // Page 1 : titles, subtitles, texts, ayahHadiths, footer
    TextSpan(text: elmList16[i].title, style: title),
    TextSpan(text: elmList16[i].subtitle, style: subtitle),
    TextSpan(text: elmList16[i].text),
    TextSpan(text: elmList16[i].ayah, style: ayah),
    TextSpan(text: elmList16[i].text2),
    TextSpan(text: elmList16[i].subtitle, style: subtitle),
    TextSpan(text: elmList16[i].text3),
    TextSpan(text: elmList16[i].ayah2, style: ayah),
    TextSpan(text: elmList16[i].text4),
    TextSpan(text: elmList16[i].ayah3, style: ayah),
    TextSpan(text: elmList16[i].text5),
    TextSpan(text: elmList16[i].ayah4, style: ayah),
    TextSpan(text: elmList16[i].text6),
    TextSpan(text: elmList16[i].ayah5, style: ayah),
    TextSpan(text: elmList16[i].footer, style: footer),
  ];
}