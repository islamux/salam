import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList17[i].subtitleSeventeenNine_1, style: title),
    TextSpan(text: elmList17[i].elmTextSeventeenNine_1),
    TextSpan(text: elmList17[i].ayahHadithSeventeenNine_1, style: ayah),
    TextSpan(text: elmList17[i].elmTextSeventeenNine_2),
  ];
}