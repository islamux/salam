import 'package:elm/core/data/model/elm_lists/elm_list_11.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTherteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();

  return [
    TextSpan(text: elmList11[i].text),
    TextSpan(text: elmList11[i].ayah, style: ayah),
    TextSpan(text: elmList11[i].text2),
    TextSpan(text: elmList11[i].ayah2, style: ayah),
    TextSpan(text: elmList11[i].text3),
    TextSpan(text: elmList11[i].ayah3, style: ayah),
  ];
}
