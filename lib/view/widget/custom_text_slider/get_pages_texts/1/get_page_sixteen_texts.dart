import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_1.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixteenTexts(int i) {
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList[i].text),
    TextSpan(text: elmList[i].footer, style: footer),
  ];
}
