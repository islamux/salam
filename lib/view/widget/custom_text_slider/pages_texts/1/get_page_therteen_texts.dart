import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTherteenTexts(int i) {
  return [
    TextSpan(
        text: elmList[i].titleOneTherteen,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList[i].elmTextOneTherteen_1),
    TextSpan(
        text: elmList[i].ayahHadithOneTherteen_1,
        style: AppTheme.customTextStyleHadith()),
  ];
}
