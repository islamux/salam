import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  return [
    TextSpan(text: elmList[i].elmTextOneEight_1),
    TextSpan(
        text: elmList[i].ayahHadithOneEight_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList[i].elmTextOneEight_2),
  ];
}
