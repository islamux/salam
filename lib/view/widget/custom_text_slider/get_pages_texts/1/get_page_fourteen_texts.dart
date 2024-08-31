import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourteenTexts(int i) {
  return [
    TextSpan(text: elmList[i].elmTextOneFourteen_1),
    TextSpan(text: elmList[i].elmTextOneFourteen_2),
    TextSpan(
        text: elmList[i].footerOneFourteen,
        style: AppTheme.customTextStyleFooter()),
  ];
}
