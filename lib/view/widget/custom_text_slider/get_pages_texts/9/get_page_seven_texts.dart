import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_9.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  return [
    TextSpan(text: elmList9[i].elmTextNineSeven_1),
    TextSpan(
        text: elmList9[i].ayahHadithNineSeven_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList9[i].elmTextNineSeven_2),
  ];
}
