import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSeventeenTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle ayah = AppTheme.customTextStyleHadith();

  return [
    TextSpan(text: elmList12[i].titleTwelveSeventeen, style: title),
    TextSpan(text: elmList12[i].elmTwelveSeventeen_1),
    TextSpan(text: elmList12[i].ayahHadithTwelveSeventeen_1, style: ayah),
    TextSpan(text: elmList12[i].elmTwelveSeventeen_2),
    TextSpan(text: elmList12[i].ayahHadithTwelveSeventeen_2, style: ayah),
    TextSpan(text: elmList12[i].elmTwelveSeventeen_3),
    TextSpan(text: elmList12[i].ayahHadithTwelveSeventeen_3, style: ayah),
  ];
}
