import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTenTexts(int i) {
  return [
    TextSpan(text: elmList13[i].elmTextTherteenTen_1),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenTen_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenTen_2),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenTen_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenTen_3),
  ];
}
