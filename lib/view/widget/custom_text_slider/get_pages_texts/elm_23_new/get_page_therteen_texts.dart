import 'package:elm/core/data/model/elm_lists/elm_list_22.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTherteenTexts(int i) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  ElmModel elm = elmList22[i];
  return [
    // Form ElmTextTwentyThree
    // pageThirteen
    TextSpan(text: elm.title, style: titleStyle),
    TextSpan(text: elm.text),
    TextSpan(text: elm.ayah, style: ayahStyle),
    TextSpan(text: elm.text2),
    TextSpan(text: elm.ayah2, style: ayahStyle),
    TextSpan(text: elm.subtitle, style: subtitleStyle),
    TextSpan(text: elm.text3),
    TextSpan(text: elm.ayah3, style: ayahStyle),
    TextSpan(text: elm.subtitle2, style: subtitleStyle),
    TextSpan(text: elm.text4),
  ];
}
