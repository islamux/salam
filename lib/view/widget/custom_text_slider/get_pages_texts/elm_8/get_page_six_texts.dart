import 'package:elm/core/data/model/elm_lists/elm_list_8.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i) {
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  return [
    TextSpan(text: elmList8[i].subtitle, style: subtitleStyle),
    TextSpan(text: elmList8[i].text),
  ];
}
