import 'package:elm/core/data/model/elm_lists/elm_list_22.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  ElmModel elm = elmList22[i];
  return [
    TextSpan(text: elm.ayah, style: ayahStyle),
    TextSpan(text: elm.text, style: titleStyle),
    TextSpan(text: elm.subtitle, style: subtitleStyle),
    TextSpan(text: elm.text2, style: titleStyle),
    TextSpan(text: elm.ayah2, style: ayahStyle),
    TextSpan(text: elm.text3, style: titleStyle),
    TextSpan(text: elm.ayah3, style: ayahStyle),
    TextSpan(text: elm.text4, style: titleStyle),
    TextSpan(text: elm.ayah4, style: ayahStyle),
    TextSpan(text: elm.text5, style: titleStyle),
    TextSpan(text: elm.ayah5, style: ayahStyle),
    TextSpan(text: elm.text6, style: titleStyle),
  ];
}
