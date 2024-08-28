import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle footer = AppTheme.customTextStyleFooter();

  return [
    TextSpan(text: elmList12[i].titleTwelveSixteen, style: title),
    TextSpan(text: elmList12[i].ayahHadithTwelveSixteen_1, style: ayah),
    TextSpan(text: elmList12[i].elmTextTwelveSixteen_1),
    TextSpan(text: elmList12[i].ayahHadithTwelveSixteen_2, style: ayah),
    TextSpan(text: elmList12[i].ayahHadithTwelveSixteen_3, style: ayah),
    TextSpan(text: elmList12[i].elmTextTwelveSixteen_3),
    TextSpan(text: elmList12[i].footerTwelveSixteen, style: footer),
  ];
}
