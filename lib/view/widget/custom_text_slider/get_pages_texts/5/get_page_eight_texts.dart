import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineTexts(int i) {
  return [
    TextSpan(text: elmList5[i].elmTextFiveNine_1),
    TextSpan(
        text: elmList5[i].ayahHadithFiveNine_1,
        style: AppTheme.customTextStyleHadith()),
  ];
}
