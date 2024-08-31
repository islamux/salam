import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList15[i].elmTextFifteenThree_1),
    TextSpan(text: elmList15[i].ayahHadithFifteenThree_1, style: ayah),
    TextSpan(text: elmList15[i].elmTextFifteenThree_2),
  ];
}
