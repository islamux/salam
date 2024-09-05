import 'package:elm/core/data/model/elm_lists/elm_list_7.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList7[i].title, style: title),
    TextSpan(text: elmList7[i].text),
  ];
}
