import 'package:elm/core/data/model/elm_lists/elm_list_13.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList13[i].ayah, style: ayah),
    TextSpan(text: elmList13[i].text),
    TextSpan(text: elmList13[i].ayah2, style: ayah),
    TextSpan(text: elmList13[i].text2),
    TextSpan(text: elmList13[i].ayah3, style: ayah),
    TextSpan(text: elmList13[i].text3),
  ];
}
