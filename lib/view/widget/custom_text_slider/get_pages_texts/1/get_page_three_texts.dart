import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  return [
    TextSpan(
        text: elmList[i].ayahHadithOneThree_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList[i].elmTextOneThree_1),
    TextSpan(
        text: elmList[i].ayahHadithOneThree_2,
        style: AppTheme.customTextStyleHadith()),
  ];
}
