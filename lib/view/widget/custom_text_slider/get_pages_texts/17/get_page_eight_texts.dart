import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList17[i].elmTextSeventeenEight_1),
    TextSpan(text: elmList17[i].footerSeventeenEight, style: footer),
  ];
}