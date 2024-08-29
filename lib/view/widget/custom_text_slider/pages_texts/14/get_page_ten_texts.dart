import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTenTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList14[i].ayahHadithFourteenTen_1),
    TextSpan(text: elmList14[i].elmTextFourteenTen_1),
    TextSpan(text: elmList14[i].ayahHadithFourteenTen_2),
    TextSpan(text: elmList14[i].elmTextFourteenTen_2),
    TextSpan(text: elmList14[i].ayahHadithFourteenTen_3),
    TextSpan(text: elmList14[i].elmTextFourteenTen_3),
    TextSpan(text: elmList14[i].ayahHadithFourteenTen_4),
    TextSpan(text: elmList14[i].elmTextFourteenTen_4),
  ];
}
