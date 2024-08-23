import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwoTexts(int i) {
  return [
    TextSpan(
        text: elmList5[i].ayahHadithFiveTwo_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList5[i].elmTextFiveTwo_1),
    TextSpan(
        text: elmList5[i].ayahHadithFiveTwo_2,
        style: AppTheme.customTextStyleHadith()),
  ];
}
