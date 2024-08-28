import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEighteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();

  return [
    TextSpan(text: elmList12[i].elmTwelveEightteen_1),
    TextSpan(text: elmList12[i].ayahHadithTwelveEighteen_1, style: ayah),
    TextSpan(text: elmList12[i].elmTwelveEighteen_2),
    TextSpan(text: elmList12[i].ayahHadithTwelveEighteen_2, style: ayah),
    TextSpan(text: elmList12[i].elmTwelveEighteen_3),
    TextSpan(text: elmList12[i].ayahHadithTwelveEighteen_3, style: ayah),
    TextSpan(text: elmList12[i].elmTwelveEighteen_4),
    TextSpan(text: elmList12[i].elmTextTwelveEighteen_1),
    TextSpan(text: elmList12[i].ayahHadithTwelveEighteen_4, style: ayah),
    TextSpan(text: elmList12[i].elmTextTwelveEighteen_2),
  ];
}
