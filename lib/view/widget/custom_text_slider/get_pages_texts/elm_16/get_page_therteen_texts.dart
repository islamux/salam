import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTherteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  return [
    TextSpan(text: elmList16[i].ayah, style: ayah),
    TextSpan(text: elmList16[i].text),
    TextSpan(text: elmList16[i].ayah2, style: ayah),
    TextSpan(text: elmList16[i].text2),
  ];
}
