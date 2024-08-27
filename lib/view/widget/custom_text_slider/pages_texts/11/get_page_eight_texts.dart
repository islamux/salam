import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();

  return [
    TextSpan(text: elmList11[i].ayahHadithElevenEight_1, style: ayah),
  ];
}
