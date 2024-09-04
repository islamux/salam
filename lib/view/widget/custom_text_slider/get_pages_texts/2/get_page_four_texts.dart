import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_2.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourTexts(int i) {
  return [
    TextSpan(text: elmList2[i].elmTextsTwoFour_1),
    TextSpan(text: elmList2[i].elmTextTwoFour_2),
    TextSpan(text: elmList2[i].elmTextTwoFour_3),
    TextSpan(
        text: elmList2[i].ayahHadithTwoFour_2,
        style: AppTheme.customTextStyleHadith()),
  ];
}
