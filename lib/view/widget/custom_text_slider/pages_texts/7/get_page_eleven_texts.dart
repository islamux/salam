import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageElevenTexts(int i) {
  return [
    TextSpan(text: elmList7[i].elmTextSevenEleven_1),
    TextSpan(
        text: elmList7[i].ayahHadithSevenEleven_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: elmList7[i].ayahHadithSevenEleven_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList7[i].elmTextSevenEleven_3),
  ];
}
