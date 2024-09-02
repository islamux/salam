import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTowTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList3[i].elmTextThreeTwo_1),
    TextSpan(text: elmList3[i].elmTextThreeTwo_2),
    TextSpan(text: elmList3[i].ayahHadithThreeTwo_1, style: ayah),
    TextSpan(text: elmList3[i].elmTextThreeTwo_3),
  ];
}
