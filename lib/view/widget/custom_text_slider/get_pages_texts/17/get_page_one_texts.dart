import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle subtitle = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList17[i].elmTextSeventeenOne_1),
    TextSpan(text: elmList17[i].ayahHadithSeventeenOne_1, style: ayah),
    TextSpan(text: elmList17[i].elmTextSixteenOne_2),
    TextSpan(text: elmList17[i].ayahHadithSeventeenOne_2, style: ayah),
  ];
}
