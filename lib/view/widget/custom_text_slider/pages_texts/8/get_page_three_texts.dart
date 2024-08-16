import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  return [
    TextSpan(text: elmList8[i].elmTextEightThree_1),
    TextSpan(
        text: elmList8[i].ayahHadithEightThree_1,
        style: AppTheme.customTextStyleHadith()),
  ];
}
