import 'package:elm/core/data/model/elm_lists/elm_list_11.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();

  return [
    TextSpan(text: elmList11[i].title, style: title),
    TextSpan(text: elmList11[i].ayah, style: ayah),
    TextSpan(text: elmList11[i].subtitle, style: subtitle),
    TextSpan(text: elmList11[i].ayah2, style: ayah),
    TextSpan(text: elmList11[i].text3),
    TextSpan(text: elmList11[i].footer, style: footer),
  ];
}
