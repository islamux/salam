import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwoTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList15[i].elmTextFifteenTwo_1),
    TextSpan(text: elmList15[i].ayahHadithFifteenTwo_1, style: ayah),
    TextSpan(text: elmList15[i].footerFifteenTwo, style: footer),
  ];
}
