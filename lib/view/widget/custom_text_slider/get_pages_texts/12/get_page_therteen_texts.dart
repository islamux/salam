import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_12.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTherteenTexts(int i) {
  return [
    TextSpan(text: elmList12[i].elmTextTwelveTherteen_1),
    TextSpan(
        text: elmList12[i].ayahHadithTwelveTherteen_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList12[i].elmTextTwelveTherteen_2),
  ];
}
