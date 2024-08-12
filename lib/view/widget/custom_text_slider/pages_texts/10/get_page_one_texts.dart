import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(
        text: elmList10[i].titleOne, style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList10[i].elmTextOne1),
    TextSpan(text: elmList10[i].ayahHadithOne),
    TextSpan(text: elmList10[i].elmTextOne2),
    TextSpan(text: elmList10[i].ayahHadithOne2),
    TextSpan(text: elmList10[i].elmTextOne3),
  ];
}
