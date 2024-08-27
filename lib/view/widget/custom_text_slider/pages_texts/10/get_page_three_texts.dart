import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  TextStyle title = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList10[i].ayahHadithTenThree_1, style: ayah),
    TextSpan(text: elmList10[i].subtitleTenThree_1, style: title),
    TextSpan(text: elmList10[i].elmTextTenThree_1),
    TextSpan(text: elmList10[i].ayahHadithTenThree_2, style: ayah),
    TextSpan(text: elmList10[i].elmTextTenThree_2),
  ];
}
