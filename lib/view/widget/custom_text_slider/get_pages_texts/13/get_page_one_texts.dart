import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(
        text: elmList13[i].titleOneTherteen,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenOne_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenOne_1),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenOne_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextThreeOne_2),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenOne_3,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenOne_3),
    TextSpan(
        text: elmList13[i].footerTherteen,
        style: AppTheme.customTextStyleFooter()),
  ];
}
