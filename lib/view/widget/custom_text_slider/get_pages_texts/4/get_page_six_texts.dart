import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_4.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i) {
  return [
    TextSpan(
        text: elmList4[i].subtitleFourSix_1,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList4[i].elmTextFourSix_1),
  ];
}
