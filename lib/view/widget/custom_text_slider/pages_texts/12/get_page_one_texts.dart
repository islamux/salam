import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle footer = AppTheme.customTextStyleFooter();

  return [
    // Page 1 : titles, subtitles, texts, ayahHadiths, footer
    TextSpan(text: elmList12[i].ayahHadithTwelveOne_1, style: ayah),
    TextSpan(text: elmList12[i].elmtextTwelveOne_1),
  ];
}
