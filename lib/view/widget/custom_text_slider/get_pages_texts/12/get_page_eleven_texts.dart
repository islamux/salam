import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageElevenTexts(int i) {
  return [
    TextSpan(text: elmList12[i].elmTextTwelveEleven_1),
    TextSpan(
        text: elmList12[i].ayahHadithTwelveEleven_1,
        style: AppTheme.customTextStyleHadith()),
  ];
}