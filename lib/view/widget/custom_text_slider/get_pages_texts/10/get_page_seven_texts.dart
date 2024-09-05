import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_10.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList10[i].text),
    TextSpan(text: elmList10[i].ayah, style: ayah),
    TextSpan(text: elmList10[i].ayah2),
    TextSpan(text: elmList10[i].ayah3, style: ayah),
    TextSpan(text: elmList10[i].text2),
  ];
}
