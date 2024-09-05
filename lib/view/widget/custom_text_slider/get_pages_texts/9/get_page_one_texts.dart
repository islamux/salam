import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_9.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList9[i].ayah, style: ayah),
    TextSpan(text: elmList9[i].text),
    TextSpan(text: elmList9[i].ayah, style: ayah),
    TextSpan(text: elmList9[i].ayah, style: ayah),
  ];
}
