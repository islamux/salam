import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  ElmModel elm = elmList16[i];
  return [
    // Page 1 : titles, subtitles, texts, ayahHadiths, footer
    TextSpan(text: elm.title, style: title),
    TextSpan(text: elm.subtitle, style: subtitle),
    TextSpan(text: elm.text),
    TextSpan(text: elm.ayah, style: ayah),
    TextSpan(text: elm.text2),
  ];
}
