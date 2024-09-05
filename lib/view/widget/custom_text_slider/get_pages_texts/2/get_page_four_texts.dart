import 'package:elm/core/data/model/elm_lists/elm_list_2.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList2[i].text),
    TextSpan(text: elmList2[i].text2),
    TextSpan(text: elmList2[i].text3),
    TextSpan(text: elmList2[i].ayah, style: ayah),
  ];
}
