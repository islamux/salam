import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();

  return [
    TextSpan(text: elmList11[i].elmTextElevenFourteen_1),
    TextSpan(text: elmList11[i].ayahHadithElevenFourteen_1, style: ayah),
    TextSpan(text: elmList11[i].elmTextElevenFourteen_2),
    TextSpan(text: elmList11[i].ayahHadithElevenFourteen_2, style: ayah),
    TextSpan(text: elmList11[i].elmTextElevenFourteen_3),
  ];
}
