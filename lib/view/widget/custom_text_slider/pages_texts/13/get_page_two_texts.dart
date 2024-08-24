import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwoTexts(int i) {
  return [
    TextSpan(text: elmList13[i].elmTextTherteenTwo_1),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenTwo_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenTwo_2),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenTwo_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenTwo_3),
  ];
}
