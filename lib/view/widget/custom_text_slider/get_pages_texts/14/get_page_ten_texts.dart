import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList14[i].ayahHadithFourteenTen_1, style: ayah),
    TextSpan(text: elmList14[i].elmTextFourteenTen_1),
    TextSpan(text: elmList14[i].ayahHadithFourteenTen_2, style: ayah),
    TextSpan(text: elmList14[i].elmTextFourteenTen_2),
    TextSpan(text: elmList14[i].ayahHadithFourteenTen_3),
    TextSpan(text: elmList14[i].elmTextFourteenTen_3),
    TextSpan(text: elmList14[i].ayahHadithFourteenTen_4, style: ayah),
    TextSpan(text: elmList14[i].elmTextFourteenTen_4),
  ];
}
