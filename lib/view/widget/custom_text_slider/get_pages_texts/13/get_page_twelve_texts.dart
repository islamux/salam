import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwelveTexts(int i) {
  return [
    TextSpan(
        text: elmList13[i].titleTherteenTwelve_1,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList13[i].elmTextTherteenTwelve_1),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenTwelve_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenTwelve_2),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenTwelve_2,
        style: AppTheme.customTextStyleHadith()),
  ];
}
