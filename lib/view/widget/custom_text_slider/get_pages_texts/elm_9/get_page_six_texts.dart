import 'package:elm/core/data/model/elm_lists/elm_list_9.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList9[i].text),
    TextSpan(text: elmList9[i].ayah, style: ayah),
    TextSpan(text: elmList9[i].ayah2),
    TextSpan(text: elmList9[i].ayah3, style: ayah),
    TextSpan(text: elmList9[i].text2),
  ];
}
