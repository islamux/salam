import 'package:elm/core/data/model/elm_lists/elm_list_13.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTherteenTexts(int i) {
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  return [
    TextSpan(text: elmList13[i].text),
    TextSpan(text: elmList13[i].subtitle, style: subtitle),
    TextSpan(text: elmList13[i].text2),
    TextSpan(text: elmList13[i].subtitle2, style: subtitle),
    TextSpan(text: elmList13[i].text3),
  ];
}
