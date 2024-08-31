import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList15[i].elmTextFifteenSix_1),
    TextSpan(text: elmList15[i].ayahHadithFifteenSix_1, style: ayah),
    TextSpan(text: elmList15[i].footerFifteenSix, style: footer),
  ];
}
