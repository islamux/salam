import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(
        text: elmList[i].titleOneOne, style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList[i].elmTextOneOne_1),
    TextSpan(text: elmList[i].elmTextOneOne_2),
    TextSpan(text: elmList[i].elmTextOneOne_3),
  ];
}
