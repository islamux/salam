import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFifteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  TextStyle title = AppTheme.customTextStyleTitle();

  return [
    TextSpan(text: elmList11[i].elmTextElevenFifteen_1),
    TextSpan(text: elmList11[i].ayahHadithElevenFifteen_1, style: ayah),
    TextSpan(text: elmList11[i].elmTextElevenFifteen_2),
    TextSpan(text: elmList11[i].ayahHadithElevenFifteen_2, style: ayah),
    TextSpan(text: elmList11[i].elmTextElevenFifteen_3),
    TextSpan(text: elmList11[i].footerElevenFifteen_3, style: footer),
  ];
}
