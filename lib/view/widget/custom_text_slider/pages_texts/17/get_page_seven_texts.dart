import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  return [
    TextSpan(text: elmList17[i].elmTextSeventeenSeven_1),
    TextSpan(
        text: elmList17[i].ayahHadithSeventeenSeven_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList17[i].elmTextSeventeenSeven_2),
    TextSpan(
        text: elmList17[i].ayahHadithSeventeenSeven_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList17[i].elmTextSeventeenSeven_3),
    TextSpan(
        text: elmList17[i].ayahHadithSeventeenSeven_3,
        style: AppTheme.customTextStyleHadith()),
  ];
}
