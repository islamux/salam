import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_13.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i) {
  return [
    TextSpan(text: elmList13[i].elmTextTherteenSix_1),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenSix_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenSix_2),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenSix_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenSix_3),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenSix_3,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenSix_4),
  ];
}
