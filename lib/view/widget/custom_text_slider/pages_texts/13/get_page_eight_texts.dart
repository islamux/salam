import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  return [
    TextSpan(
        text: elmList13[i].ayahHadithTherteenEight_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenEight_1),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenEight_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: elmList13[i].footerTherteenEight,
        style: AppTheme.customTextStyleFooter()),
  ];
}
