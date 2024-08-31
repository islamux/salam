import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  return [
    TextSpan(text: elmList[i].elmTextOneSeven_1),
    TextSpan(
        text: elmList[i].ayahHadithOneSeven_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList[i].elmTextOneSeven_2),
  ];
}
