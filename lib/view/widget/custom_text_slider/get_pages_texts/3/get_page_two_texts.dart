import 'package:elm/core/data/model/elm_lists/elm_list_3.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTowTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList3[i].text),
    TextSpan(text: elmList3[i].text2),
    TextSpan(text: elmList3[i].ayah, style: ayah),
    TextSpan(text: elmList3[i].text3),
  ];
}
