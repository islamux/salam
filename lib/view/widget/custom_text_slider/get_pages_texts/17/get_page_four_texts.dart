import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourTexts(int i) {
  return [
    TextSpan(text: elmList17[i].elmTextSeventeenFour_1),
    TextSpan(
        text: elmList17[i].ayahHadithSeventeenFour_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList17[i].elmTextSeventeenFour_2),
  ];
}
