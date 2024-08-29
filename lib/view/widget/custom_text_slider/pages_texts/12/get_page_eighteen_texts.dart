import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEighteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle footer = AppTheme.customTextStyleFooter();

  return [
    TextSpan(text: elmList12[i].elmTwelveEighteen_1),
    TextSpan(text: elmList12[i].elmTextTwelveEighteen_2),
    TextSpan(text: elmList12[i].ayahHadithTwelveEighteen_1, style: ayah),
    TextSpan(text: elmList12[i].elmTextTwelveEighteen_3),
  ];
}
