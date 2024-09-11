import 'package:elm/core/data/model/elm_lists/elm_list_8.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  TextStyle footer = AppTheme.customTextStyleFooter();
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  TextStyle title = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList8[i].title, style: title),
    TextSpan(text: elmList8[i].subtitle, style: subtitle),
    TextSpan(text: elmList8[i].ayah, style: ayah),
    TextSpan(text: elmList8[i].text),
    TextSpan(text: elmList8[i].ayah2, style: ayah),
    TextSpan(text: elmList8[i].subtitle2, style: subtitle),
    TextSpan(text: elmList8[i].text2),
    TextSpan(text: elmList8[i].ayah3, style: ayah),
    TextSpan(text: elmList8[i].text3),
    TextSpan(text: elmList8[i].ayah4, style: ayah),
    TextSpan(text: elmList8[i].text4),
    TextSpan(text: elmList8[i].ayah5, style: ayah),
    TextSpan(text: elmList8[i].text5),
    TextSpan(text: elmList8[i].ayah6, style: ayah),
    TextSpan(text: elmList8[i].text6),
  ];
}
