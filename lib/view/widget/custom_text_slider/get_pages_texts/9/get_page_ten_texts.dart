import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_9.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTenTexts(int i) {
  return [
    TextSpan(
        text: elmList9[i].titleNineTen_1,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList9[i].elmTextNineTen_1),
    TextSpan(
        text: elmList9[i].ayahHadithNineTen_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList9[i].elmTextNineTen_2),
    TextSpan(
        text: elmList9[i].ayahHadithNineTen_3,
        style: AppTheme.customTextStyleHadith()),
  ];
}
