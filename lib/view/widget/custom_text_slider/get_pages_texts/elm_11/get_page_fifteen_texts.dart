import 'package:elm/core/data/model/elm_lists/elm_list_11.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFifteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  TextStyle footer = AppTheme.customTextStyleFooter();

  return [
    TextSpan(text: elmList11[i].title, style: title),
    TextSpan(text: elmList11[i].ayah, style: ayah),
    TextSpan(text: elmList11[i].text),
    TextSpan(text: elmList11[i].ayah2, style: ayah),
    TextSpan(text: elmList11[i].text2),
    TextSpan(text: elmList11[i].subtitle, style: subtitle),
    TextSpan(text: elmList11[i].text3),
    TextSpan(text: elmList11[i].footer, style: footer),
  ];
}
