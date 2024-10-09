import 'package:elm/core/data/model/elm_lists/elm_list_20.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwentyOneTexts(int i) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  ElmModel elm = elmList20[i];
  return [
    TextSpan(text: elm.text),
    TextSpan(text: elm.ayah, style: ayahStyle),
    TextSpan(text: elm.text2),
    TextSpan(text: elm.subtitle, style: subtitleStyle),
    TextSpan(text: elm.text3),
  ];
}
