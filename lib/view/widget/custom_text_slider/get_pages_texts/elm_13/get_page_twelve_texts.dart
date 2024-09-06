import 'package:elm/core/data/model/elm_lists/elm_list_13.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwelveTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  return [
    TextSpan(text: elmList13[i].title, style: title),
    TextSpan(text: elmList13[i].text),
    TextSpan(text: elmList13[i].ayah, style: ayah),
    TextSpan(text: elmList13[i].text2),
    TextSpan(text: elmList13[i].subtitle, style: subtitle),
    TextSpan(text: elmList13[i].text3),
    TextSpan(text: elmList13[i].ayah2, style: ayah),
  ];
}
