import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i) {
  return [
    TextSpan(text: elmList10[i].elmTextSix1),
    TextSpan(
      text: elmList10[i].ayahHadithSix,
      style: AppTheme.customTextStyleHadith(),
    ),
  ];
}