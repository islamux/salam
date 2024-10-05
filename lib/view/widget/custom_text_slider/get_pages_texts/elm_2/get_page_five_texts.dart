import 'package:elm/core/data/model/elm_lists/elm_list_2.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i) {
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList2[i].text),
    TextSpan(text: elmList2[i].footer, style: footer),
  ];
}
