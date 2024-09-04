import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_14.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(
        text: elmList14[i].titleFourteenOne,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList14[i].elmTextFourteenOne_1)
  ];
}
