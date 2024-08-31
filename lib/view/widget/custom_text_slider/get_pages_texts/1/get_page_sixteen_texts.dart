import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixteenTexts(int i) {
  return [
    TextSpan(text: elmList[i].elmTextOneSixteen_1),
    TextSpan(
        text: elmList[i].footerOneSixteen,
        style: AppTheme.customTextStyleFooter()),
  ];
}
