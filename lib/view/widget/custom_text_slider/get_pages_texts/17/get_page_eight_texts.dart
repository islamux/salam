import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_17.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList17[i].text),
    TextSpan(text: elmList17[i].footer, style: footer),
  ];
}
