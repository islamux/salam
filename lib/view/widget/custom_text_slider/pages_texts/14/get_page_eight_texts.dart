import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList14[i].elmTextFourteenEight_1),
    TextSpan(text: elmList14[i].ayahHadithFourteenEight_1),
    TextSpan(text: elmList14[i].elmTextFourteenEight_2),
  ];
}
