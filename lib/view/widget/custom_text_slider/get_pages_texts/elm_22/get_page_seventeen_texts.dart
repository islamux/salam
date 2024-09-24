import 'package:elm/core/data/model/elm_lists/elm_list_21.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSeventeenTexts(int i) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  ElmModel elm = elmList21[i];
  return [
    // Form ElmTextTwentyOne{} // page 17
    TextSpan(text: elm.subtitle, style: subtitleStyle),
    TextSpan(text: elm.text),
    TextSpan(text: elm.ayah, style: ayahStyle),
    TextSpan(text: elm.subtitle2, style: subtitleStyle),
    TextSpan(text: elm.text2),
    TextSpan(text: elm.ayah2, style: ayahStyle),
    TextSpan(text: elm.text3),
  ];
}