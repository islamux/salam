import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  return [
    TextSpan(text: elmList16[i].subtitle, style: subtitle),
    TextSpan(text: elmList16[i].text),
  ];
}
