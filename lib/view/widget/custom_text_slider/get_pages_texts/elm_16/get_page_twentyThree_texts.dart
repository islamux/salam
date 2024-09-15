import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwentyThreeTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  TextStyle title = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList16[i].title, style: title),
    TextSpan(text: elmList16[i].subtitle, style: subtitle),
    TextSpan(text: elmList16[i].text),
    TextSpan(text: elmList16[i].ayah, style: ayah),
    TextSpan(text: elmList16[i].text2),
  ];
}