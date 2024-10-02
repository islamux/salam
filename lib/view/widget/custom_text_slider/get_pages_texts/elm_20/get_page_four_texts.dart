import 'package:elm/core/data/model/elm_lists/elm_list_20.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourTexts(int i) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  ElmModel elm = elmList20[i];
  return [
    TextSpan(text: elm.subtitle, style: subtitleStyle),
    TextSpan(text: elm.text),
    TextSpan(text: elm.subtitle2, style: subtitleStyle),
    TextSpan(text: elm.text2),
    TextSpan(text: elm.ayah, style: ayahStyle),
  ];
}
