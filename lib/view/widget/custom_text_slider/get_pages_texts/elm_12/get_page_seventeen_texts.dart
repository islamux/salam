import 'package:elm/core/data/model/elm_lists/elm_list_12.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSeventeenTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle ayah = AppTheme.customTextStyleHadith();
// to refactor -> customTextSpan()
  return [
    TextSpan(text: elmList12[i].title, style: title),
    TextSpan(text: elmList12[i].text),
    TextSpan(text: elmList12[i].ayah, style: ayah),
    TextSpan(text: elmList12[i].text2),
    TextSpan(text: elmList12[i].ayah2, style: ayah),
    TextSpan(text: elmList12[i].text3),
    TextSpan(text: elmList12[i].ayah3, style: ayah),
  ];
}
