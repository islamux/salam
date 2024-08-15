import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(
        text: elmList8[i].titleEightOne,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList8[i].elmTextEightOne_1),
    TextSpan(text: elmList8[i].ayahHadithOne_1),
  ];
}
