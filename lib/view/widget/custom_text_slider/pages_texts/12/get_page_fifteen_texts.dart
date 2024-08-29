import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFifteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  TextStyle title = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList12[i].elmTextTwelveFifteen_1),
    TextSpan(text: elmList12[i].ayahHadithTwelveFifteen_1, style: ayah),
    TextSpan(text: elmList12[i].elmTextTwelveFifteen_2),
    TextSpan(text: elmList12[i].ayahHadithTwelveFifteen_2, style: ayah),
    TextSpan(text: elmList12[i].elmTextTwelveFifteen_3),
    TextSpan(text: elmList12[i].footerTwelveFifteen, style: footer),
  ];
}
