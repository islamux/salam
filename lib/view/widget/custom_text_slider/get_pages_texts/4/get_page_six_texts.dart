import 'package:elm/core/data/model/elm_lists/elm_list_4.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i) {
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  return [
    TextSpan(text: elmList4[i].subtitle, style: subtitle),
    TextSpan(text: elmList4[i].text),
  ];
}
