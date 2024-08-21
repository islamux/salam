import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwentyTexts(int i) {
  return [
    TextSpan(
        text: elmList[i].subtitleOneTwenty,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList[i].elmTextOneTwenty_1),
  ];
}
