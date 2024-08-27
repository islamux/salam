import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();

  return [
    TextSpan(text: elmList11[i].elmTextElevenSixteen_1),
    TextSpan(text: elmList11[i].ayahHadithElevenSixteen_1, style: ayah),
    TextSpan(text: elmList11[i].elmTextElevenSixteen_2),
    TextSpan(text: elmList11[i].ayahHadithElevenSixteen_3, style: ayah),
    TextSpan(text: elmList11[i].elmTextElevenSixteen_3),
    TextSpan(text: elmList11[i].footerElevenSixteen, style: footer),
  ];
}
