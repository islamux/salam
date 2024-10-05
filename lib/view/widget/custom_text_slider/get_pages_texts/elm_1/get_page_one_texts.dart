import 'package:elm/core/data/model/elm_lists/elm_list_1.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList[i].title, style: title),
    TextSpan(text: elmList[i].text),
    TextSpan(text: elmList[i].text2),
    TextSpan(text: elmList[i].text3),
  ];
}
