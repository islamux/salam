import 'package:elm/core/data/model/elm_lists/elm_list_6.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwoTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  return [
    TextSpan(text: elmList6[i].subtitle, style: subtitle),
    TextSpan(text: elmList6[i].text),
    TextSpan(text: elmList6[i].ayah, style: ayah)
  ];
}
