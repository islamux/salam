import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTherteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  TextStyle title = AppTheme.customTextStyleTitle();

  return [
    TextSpan(text: elmList11[i].elmTextElevenTherteen_1),
    TextSpan(text: elmList11[i].ayahHadithElevenTherteen_1, style: ayah),
    TextSpan(text: elmList11[i].elmTextElevenTherteen_2),
    TextSpan(text: elmList11[i].ayahHadithElevenTherteen_2, style: ayah),
    TextSpan(text: elmList11[i].elmTextElevenTherteen_3),
    TextSpan(text: elmList11[i].ayahHadithElevenTherteen_3, style: ayah),
  ];
}
