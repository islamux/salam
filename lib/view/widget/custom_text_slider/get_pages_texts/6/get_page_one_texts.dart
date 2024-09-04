import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_6.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(
      text: elmList6[i].titleSixOne,
      style: AppTheme.customTextStyleTitle(),
    ),
    TextSpan(text: elmList6[i].elmTextSixOne_1),
    TextSpan(text: elmList6[i].elmTextSixOne_2),
    TextSpan(
      text: elmList6[i].ayhaHadithSixteenOne_1,
      style: AppTheme.customTextStyleHadith(),
    ),
  ];
}
