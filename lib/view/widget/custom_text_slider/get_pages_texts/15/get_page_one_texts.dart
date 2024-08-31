import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList15[i].titleFifteenOne, style: title),
    TextSpan(text: elmList15[i].ayahHadithFifteenOne_1, style: ayah),
    TextSpan(text: elmList15[i].elmTextFifteenOne_1),
  ];
}
