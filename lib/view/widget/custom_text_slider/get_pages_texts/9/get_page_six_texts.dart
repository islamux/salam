import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_9.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i) {
  return [
    TextSpan(text: elmList9[i].elmTextNineSix_1),
    TextSpan(
        text: elmList9[i].ayahHadithNineSix_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList9[i].elmTextNineSix_2),
    TextSpan(
        text: elmList9[i].ayahHadithNineSix_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList9[i].elmTextNineSix_3),
  ];
}
