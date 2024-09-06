import 'package:elm/core/data/model/elm_lists/elm_list_8.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList8[i].text),
    TextSpan(text: elmList8[i].footer, style: footer),
    TextSpan(text: elmList8[i].text2),
  ];
}
