import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList15[i].elmTextFifteenFive_1),
    TextSpan(text: elmList15[i].ayahHadithFifteenFive_1, style: ayah),
  ];
}
