import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_1.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEighteenTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList[i].text),
    TextSpan(text: elmList[i].ayah, style: ayah),
    TextSpan(text: elmList[i].text2),
    TextSpan(text: elmList[i].ayah2, style: ayah),
    TextSpan(text: elmList[i].text2),
  ];
}
