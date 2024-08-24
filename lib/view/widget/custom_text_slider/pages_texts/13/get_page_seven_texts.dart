import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  return [
    TextSpan(text: elmList13[i].elmTextTherteenSeven_1),
    TextSpan(
        text: elmList13[i].ayahHadithTherteenSeven_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].elmTextTherteenSeven_2),
    TextSpan(
        text: elmList13[i].footerTherteenSeven,
        style: AppTheme.customTextStyleFooter()),
  ];
}
