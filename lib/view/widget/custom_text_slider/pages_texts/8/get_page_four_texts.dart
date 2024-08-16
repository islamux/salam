import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourTexts(int i) {
  return [
    TextSpan(
        text: elmList8[i].ayahHadithEightFour_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList8[i].elmTextEightFour_1),
    TextSpan(
        text: elmList8[i].ayahHadithEightFour_2,
        style: AppTheme.customTextStyleHadith()),
  ];
}
