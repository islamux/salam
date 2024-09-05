import 'package:elm/core/data/model/elm_lists/elm_list_6.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList6[i].text),
    TextSpan(text: elmList6[i].ayah, style: ayah),
    TextSpan(text: elmList6[i].text2),
  ];
}
