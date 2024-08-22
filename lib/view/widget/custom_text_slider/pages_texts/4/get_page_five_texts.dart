import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i) {
  return [
    TextSpan(text: elmList4[i].elmTextFourFive_1),
    TextSpan(
        text: elmList4[i].ayhaHadithFourFive_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: elmList4[i].footerFourFive,
        style: AppTheme.customTextStyleFooter()),
  ];
}
