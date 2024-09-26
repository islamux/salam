import 'package:elm/core/data/model/elm_lists/elm_list_23.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  ElmModel elm = elmList23[i];

  return [
    // Form ElmTextTwentyThree{}
    // pageThree
    TextSpan(text: elm.title, style: titleStyle),
    TextSpan(text: elm.text),
    TextSpan(text: elm.ayah, style: ayahStyle),
    TextSpan(text: elm.text2),
    TextSpan(text: elm.ayah2, style: ayahStyle),
    TextSpan(text: elm.text3),
    TextSpan(text: elm.ayah3, style: ayahStyle),
    TextSpan(text: elm.text4),
  ];
}
