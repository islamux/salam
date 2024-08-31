import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList15[i].ayahHadithFifteenSixteen_1, style: ayah),
    TextSpan(text: elmList15[i].elmtTextFifteenSixteen_2),
    TextSpan(text: elmList15[i].ayahHadithFifteenSixteen_2, style: ayah),
    TextSpan(text: elmList15[i].elmtTextFifteenSixteen_3),
    TextSpan(text: elmList15[i].ayahHadithFifteenSixteen_3, style: ayah),
    TextSpan(text: elmList15[i].elmtTextFifteenSixteen_4),
  ];
}
