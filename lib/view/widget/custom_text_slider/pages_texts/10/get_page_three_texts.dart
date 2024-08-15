import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  return [
    TextSpan(
      text: elmList10[i].ayahHadithTenThree_1,
      style: AppTheme.customTextStyleHadith(),
    ),
    TextSpan(
      text: elmList10[i].subtitleTenThree_1,
      style: AppTheme.customTextStyleTitle(),
    ),
    TextSpan(text: elmList10[i].elmTextTenThree_1),
    TextSpan(
      text: elmList10[i].ayahHadithTenThree_2,
      style: AppTheme.customTextStyleHadith(),
    ),
    TextSpan(text: elmList10[i].elmTextTenThree_2),
  ];
}
