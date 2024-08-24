import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  return [
    TextSpan(
        text: elmList13[i].ayahHadithTherteenThree_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenThree_2),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenThree_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenThree_3),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenThree_3,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenThree_4),
  ];
}
