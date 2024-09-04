import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_2.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  return [
    TextSpan(text: elmList2[i].elmTextTwoEight_1),
    TextSpan(
        text: elmList2[i].ayahHadithTwoEight_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: elmList2[i].footerTwoEight,
        style: AppTheme.customTextStyleFooter()),
  ];
}
