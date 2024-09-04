import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_10.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList10[i].elmTextTenSeven_1),
    TextSpan(text: elmList10[i].ayahHadithTenSeven_1, style: ayah),
    TextSpan(text: elmList10[i].elmTextTenSeven_2),
    TextSpan(text: elmList10[i].ayahHadithTenSeven_2, style: ayah),
    TextSpan(text: elmList10[i].elmTextTenSeven_3),
  ];
}
