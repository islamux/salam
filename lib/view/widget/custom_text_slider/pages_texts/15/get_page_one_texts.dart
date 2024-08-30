import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList15[i].titleFifteenOne),
    TextSpan(text: elmList15[i].ayahHadithFifteenOne_1),
    TextSpan(text: elmList15[i].elmTextFifteenOne_1),
  ];
}
