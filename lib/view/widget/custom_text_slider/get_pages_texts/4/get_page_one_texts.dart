import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_4.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(
        text: elmList4[i].titleFourOne, style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList4[i].elmTextFourOne_1),
    TextSpan(
        text: elmList4[i].ayahHadithFourOne_1,
        style: AppTheme.customTextStyleHadith())
  ];
}
