import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwoTexts(int i) {
  return [
    TextSpan(text: elmList8[i].elmTextTwo_1),
    TextSpan(
        text: elmList8[i].ayahHadithEightTwo_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList8[i].elmTextTwo_2),
  ];
}
