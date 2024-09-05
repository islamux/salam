import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_4.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList4[i].text),
    TextSpan(text: elmList4[i].ayah, style: ayah),
    TextSpan(text: elmList4[i].text),
  ];
}
