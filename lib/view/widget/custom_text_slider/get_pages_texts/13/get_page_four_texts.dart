import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourTexts(int i) {
  return [
    TextSpan(text: elmList13[i].elmTextTherteenFour_1),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenFour_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenFour_2),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenFour_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenFour_3),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenFour_3,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenFour_4),
  ];
}
