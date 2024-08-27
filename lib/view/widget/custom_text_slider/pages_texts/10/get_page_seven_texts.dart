import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  TextStyle title = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList10[i].elmTextTenSeven_1),
    TextSpan(text: elmList10[i].ayahHadithTenSeven_1, style: ayah),
    TextSpan(text: elmList10[i].elmTextTenSeven_2),
    TextSpan(text: elmList10[i].ayahHadithTenSeven_2, style: ayah),
    TextSpan(text: elmList10[i].elmTextTenSeven_3),
  ];
}
