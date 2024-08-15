import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(
      text: elmList10[i].titleTenOne,
      style: AppTheme.customTextStyleTitle(),
    ),
    TextSpan(text: elmList10[i].elmTextTenOne_1),
    TextSpan(
        text: elmList10[i].ayahHadithTenOne_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList10[i].elmTextTenOne_2),
    TextSpan(
        text: elmList10[i].ayahHadithTenOne_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList10[i].elmTextTenOne_3),
  ];
}
