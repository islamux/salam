import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_12.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();

  return [
    TextSpan(text: elmList12[i].ayahHadithTwelveFour_1, style: ayah),
    TextSpan(text: elmList12[i].elmTextTwelveFour_1),
    TextSpan(text: elmList12[i].ayahHadithTwelveFour_2, style: ayah),
    TextSpan(text: elmList12[i].elmTextTwelveFour_2),
  ];
}
