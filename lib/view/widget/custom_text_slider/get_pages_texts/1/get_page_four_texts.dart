import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourTexts(int i) {
  return [
    TextSpan(text: elmList[i].elmTextOneFour_1),
    TextSpan(text: elmList[i].elmTextOneFour_2),
    TextSpan(
        text: elmList[i].ayahHadithOneFour_3,
        style: AppTheme.customTextStyleHadith()),
  ];
}
