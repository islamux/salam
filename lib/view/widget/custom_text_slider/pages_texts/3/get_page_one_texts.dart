import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(
      text: elmList3[i].titleThreeOne,
      style: AppTheme.customTextStyleTitle(),
    ),
    TextSpan(text: elmList3[i].elmTextThreeOne_1),
    TextSpan(
        text: elmList3[i].ayahHadithThreeOne_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList3[i].elmTextThreeOne_2),
    TextSpan(text: elmList3[i].ayahHadithThreeOne_2),
  ];
}
