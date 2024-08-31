import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageElevenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList15[i].elmTextFifteenEleven_1),
    TextSpan(text: elmList15[i].ayahHadithFifteenEleven_1, style: ayah),
  ];
}
