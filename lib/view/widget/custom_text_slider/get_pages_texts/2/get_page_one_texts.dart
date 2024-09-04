import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_2.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(
        text: elmList2[i].titleTwoOne, style: AppTheme.customTextStyleTitle()),
    TextSpan(
        text: elmList2[i].ayahHadithTwoOne_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList2[i].elmTextTwoOne_1),
    TextSpan(
        text: elmList2[i].ayahHadithTwoOne_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList2[i].elmTextTwoOne_2),
  ];
}
