import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList14[i].ayahHadithFourteenSeven_1),
    TextSpan(text: elmList14[i].elmTextFourteen_1),
    TextSpan(text: elmList14[i].ayahHadithFourteenSeven_2),
    TextSpan(text: elmList14[i].elmTextFourteenSeven_2),
    TextSpan(text: elmList14[i].subtitleFourteenSeven_1),
    TextSpan(text: elmList14[i].elmTextFourteenSeven_3),
    TextSpan(text: elmList14[i].ayahHadithFourteenSeven_3),
  ];
}
