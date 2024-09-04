import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_12.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle footer = AppTheme.customTextStyleFooter();

  return [
    TextSpan(text: elmList12[i].titleTwelveFourteen, style: title),
    TextSpan(text: elmList12[i].ayahHadithTwelveFourteen_1, style: ayah),
    TextSpan(text: elmList12[i].elmTextTwelveFourteen_1),
    TextSpan(text: elmList12[i].ayahHadithTwelveFourteen_2, style: ayah),
    TextSpan(text: elmList12[i].footerTwelveFourteen, style: footer),
  ];
}
