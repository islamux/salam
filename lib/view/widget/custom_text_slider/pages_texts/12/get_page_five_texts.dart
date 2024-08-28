import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle footer = AppTheme.customTextStyleFooter();

  return [
    TextSpan(text: elmList12[i].titleTwelveFive_1, style: title),
    TextSpan(text: elmList12[i].elmTextTwelveFive_1),
    TextSpan(text: elmList12[i].ayahHadithTwelveFive_2, style: ayah),
    TextSpan(text: elmList12[i].elmTextTwelveFive_3),
    TextSpan(text: elmList12[i].ayahHadithTwelveFive_3, style: ayah),
    TextSpan(text: elmList12[i].footerTwelveFive, style: footer),
  ];
}
