import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFifteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList14[i].ayahHadithFourteenFifteen_1, style: ayah),
    TextSpan(text: elmList14[i].elmTextFourteenFifteen_1),
    TextSpan(text: elmList14[i].ayahHadithFourteenFifteen_2, style: ayah),
    TextSpan(text: elmList14[i].elmTextFourteenFifteen_2),
  ];
}
