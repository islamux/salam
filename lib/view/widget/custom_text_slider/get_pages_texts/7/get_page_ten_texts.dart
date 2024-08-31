import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTenTexts(int i) {
  return [
    TextSpan(
        text: elmList7[i].titleSevenTen,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(
        text: elmList7[i].ayahHadithSevenTen_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList7[i].elmTextSevenTen_1),
    TextSpan(
        text: elmList7[i].ayahHadithSevenTen_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList7[i].elmTextSevenTen_2),
    TextSpan(
        text: elmList7[i].ayahHadithSevenTen_3,
        style: AppTheme.customTextStyleHadith()),
  ];
}
