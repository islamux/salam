import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i) {
  return [
    TextSpan(text: elmList13[i].elmTextTherteenFive_1),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenFive_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenFive_2),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenFive_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenFive_3),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenFive_3,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenFive_4),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenFive_4,
        style: AppTheme.customTextStyleHadith()),
  ];
}
