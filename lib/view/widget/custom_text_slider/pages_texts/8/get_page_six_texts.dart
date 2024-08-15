import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i) {
  return [
    TextSpan(
        text: elmList8[i].subtitleEightSix_1,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList8[i].elmTextEightSix_1),
  ];
}
