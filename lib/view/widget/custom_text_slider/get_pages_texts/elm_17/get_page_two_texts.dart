import 'package:elm/core/data/model/elm_lists/elm_list_17.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwoTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList17[i].ayah, style: ayah),
    TextSpan(text: elmList17[i].text),
    TextSpan(text: elmList17[i].ayah2, style: ayah),
    TextSpan(text: elmList17[i].ayah3, style: ayah),
    TextSpan(text: elmList17[i].subtitle, style: title),
    TextSpan(text: elmList17[i].text2),
  ];
}
