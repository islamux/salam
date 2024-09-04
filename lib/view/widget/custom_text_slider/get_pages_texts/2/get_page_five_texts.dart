import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_2.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i) {
  return [
    TextSpan(text: elmList2[i].elmTextTwoFive_1),
    TextSpan(
        text: elmList2[i].footerTwoFive,
        style: AppTheme.customTextStyleFooter()),
  ];
}
