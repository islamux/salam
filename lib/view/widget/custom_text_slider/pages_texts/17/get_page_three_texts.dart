import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  return [
    TextSpan(
      text: elmList17[i].ayahHadithSeventeenThree_1,
      style: AppTheme.customTextStyleHadith(),
    ),
    TextSpan(text: elmList17[i].subtitleSixteenThree_1),
    TextSpan(text: elmList17[i].elmTextSeventeenThree_1),
    TextSpan(text: elmList17[i].ayahHadithSeventeenThree_2),
    TextSpan(text: elmList17[i].elmTextSeventeenThree_2),
  ];
}
