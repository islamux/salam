import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();

  return [
    TextSpan(text: elmList12[i].elmTextTwelveThree_1, style: ayah),
    TextSpan(text: elmList12[i].ayahHadithTwelveThree_1, style: ayah),
    TextSpan(text: elmList12[i].elmTextTwelveThree_2),
    TextSpan(text: elmList12[i].ayahHadithTwelveThree_2, style: ayah),
    TextSpan(text: elmList12[i].elmTextTwelveThree_3),
  ];
}
