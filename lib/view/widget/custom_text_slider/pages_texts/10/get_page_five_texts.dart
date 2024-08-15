import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i) {
  return [
    TextSpan(
      text: elmList10[i].ayahHadithTenFive_1,
      style: AppTheme.customTextStyleHadith(),
    ),
    TextSpan(text: elmList10[i].elmTextTenFive_1),
    TextSpan(
      text: elmList10[i].ayahHadithTenFive_2,
      style: AppTheme.customTextStyleHadith(),
    ),
  ];
}
