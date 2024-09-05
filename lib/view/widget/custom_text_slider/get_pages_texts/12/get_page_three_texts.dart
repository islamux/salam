import 'package:elm/core/data/model/elm_lists/elm_list_12.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();

  return [
    TextSpan(text: elmList12[i].text, style: ayah),
    TextSpan(text: elmList12[i].ayah, style: ayah),
    TextSpan(text: elmList12[i].text2),
    TextSpan(text: elmList12[i].ayah3, style: ayah),
    TextSpan(text: elmList12[i].text3),
  ];
}
