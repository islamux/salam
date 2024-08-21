import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwelveTexts(int i) {
  return [
    TextSpan(text: elmList[i].elmTextOneTwelve_1),
    TextSpan(
        text: elmList[i].ayahHadithOneTwelve_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList[i].elmTextOneTwelve_2),
    TextSpan(
        text: elmList[i].ayahHadithOneTwelve_2,
        style: AppTheme.customTextStyleHadith()),
  ];
}
