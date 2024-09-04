import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_9.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(
        text: elmList9[i].ayahHadithNineOne_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList9[i].elmTextNineOne_1),
    TextSpan(
        text: elmList9[i].ayahHadithNineOne_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: elmList9[i].ayahHadithNineOne_2,
        style: AppTheme.customTextStyleHadith()),
  ];
}
