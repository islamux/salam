import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_14.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList14[i].elmTextFourteenFour_1),
    TextSpan(text: elmList14[i].ayahHadithFourteenFour_1, style: ayah),
    TextSpan(text: elmList14[i].elmTextFourteenFour_2),
    TextSpan(text: elmList14[i].ayahHadithFourteenFour_2, style: ayah),
    TextSpan(text: elmList14[i].elmTextFourteenSeven_4),
  ];
}
