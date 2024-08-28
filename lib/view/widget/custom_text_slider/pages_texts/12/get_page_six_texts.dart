import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();

  return [
    TextSpan(text: elmList12[i].elmTextTwelveSix_1),
    TextSpan(text: elmList12[i].ayahHadithTwelveSix_1, style: ayah),
    TextSpan(text: elmList12[i].elmTextTwelveSix_2),
    TextSpan(text: elmList12[i].ayahHadithTwelveSix_2, style: ayah),
    TextSpan(text: elmList12[i].foooterTwelveSix, style: footer),
  ];
}
