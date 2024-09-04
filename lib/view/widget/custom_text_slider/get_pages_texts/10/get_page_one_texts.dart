import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_10.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList10[i].titleTenOne, style: title),
    TextSpan(text: elmList10[i].elmTextTenOne_1),
    TextSpan(text: elmList10[i].ayahHadithTenOne_1, style: ayah),
    TextSpan(text: elmList10[i].elmTextTenOne_2),
    TextSpan(text: elmList10[i].ayahHadithTenOne_2, style: ayah),
    TextSpan(text: elmList10[i].elmTextTenOne_3),
  ];
}
