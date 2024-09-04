import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_7.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  return [
    TextSpan(text: elmList7[i].elmTextSevenEight_1),
    TextSpan(
        text: elmList7[i].ayahHadithSevenEight_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList7[i].elmTextSevenEight_2),
  ];
}
