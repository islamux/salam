import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList14[i].elmTextFourteenSix_1),
    TextSpan(text: elmList14[i].ayahHadithFourteenSix_2),
    TextSpan(text: elmList14[i].elmTextFourteenSix_2),
    TextSpan(text: elmList14[i].ayahHadithFourteenSix_3),
    TextSpan(text: elmList14[i].elmTextFourteenSix_3),
    TextSpan(text: elmList14[i].ayahHadithFourteenSix_4),
    TextSpan(text: elmList14[i].elmTextFourteenSix_4),
    TextSpan(text: elmList14[i].ayahHadithFourteenSix_5),
    TextSpan(text: elmList14[i].elmTextFourteenSix_5),
    TextSpan(text: elmList14[i].ayahHadithFourteenSix_6),
    TextSpan(text: elmList14[i].elmTextFourteenSix_7),
  ];
}
