import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_6.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwoTexts(int i) {
  return [
    TextSpan(
        text: elmList6[i].subtitleSixTwo_1,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList6[i].elmTextSixTwo_1),
    TextSpan(
        text: elmList6[i].ayahHadithSixTwo_1,
        style: AppTheme.customTextStyleHadith())
  ];
}
