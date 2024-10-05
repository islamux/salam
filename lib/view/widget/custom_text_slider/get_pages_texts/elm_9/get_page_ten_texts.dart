import 'package:elm/core/data/model/elm_lists/elm_list_9.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList9[i].title, style: title),
    TextSpan(text: elmList9[i].text),
    TextSpan(text: elmList9[i].ayah, style: ayah),
    TextSpan(text: elmList9[i].text2),
    TextSpan(text: elmList9[i].ayah2, style: ayah),
  ];
}
