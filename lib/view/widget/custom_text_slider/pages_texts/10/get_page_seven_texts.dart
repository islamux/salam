import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  return [
    TextSpan(text: elmList10[i].elmTextTenSeven_1),
    TextSpan(
      text: elmList10[i].ayahHadithSeven_1,
      style: AppTheme.customTextStyleHadith(),
    ),
    TextSpan(text: elmList10[i].elmTextTenSeven_2),
    TextSpan(
      text: elmList10[i].ayahHadithSeven_2,
      style: AppTheme.customTextStyleHadith(),
    ),
    TextSpan(text: elmList10[i].elmTextTenSeven_3),
  ];
}
