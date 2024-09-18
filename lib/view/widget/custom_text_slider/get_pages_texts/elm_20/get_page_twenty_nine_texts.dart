import 'package:elm/core/data/model/elm_lists/elm_list_20.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwentyNineTexts(int i) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  ElmModel elm = elmList20[i];
  return [
    TextSpan(text: elm.text),
    TextSpan(text: elm.ayah, style: ayahStyle),
    TextSpan(text: elm.text2),
    TextSpan(text: elm.ayah2, style: ayahStyle),
    TextSpan(text: elm.text3),
    TextSpan(text: elm.ayah3, style: ayahStyle),
    TextSpan(text: elm.text4),
    TextSpan(text: elm.ayah4, style: ayahStyle),
    TextSpan(text: elm.text5),
    TextSpan(text: elm.ayah5, style: ayahStyle),
    TextSpan(text: elm.text6),
    TextSpan(text: elm.ayah6, style: ayahStyle),
    TextSpan(text: elm.text7),
    TextSpan(text: elm.ayah7, style: ayahStyle),
    TextSpan(text: elm.text7),
    TextSpan(text: elm.ayah8, style: ayahStyle),
  ];
}
