import 'package:elm/core/data/model/elm_lists/elm_list_2.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList2[i].text),
    TextSpan(text: elmList2[i].ayah, style: ayah),
    TextSpan(text: elmList2[i].footer, style: footer),
  ];
}
