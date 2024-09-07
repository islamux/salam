import 'package:elm/core/data/model/elm_lists/elm_list_pre.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwoTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  return [
    TextSpan(text: elmListPre[i].title, style: title),
    TextSpan(text: elmListPre[i].subtitle, style: subtitle),
    TextSpan(text: elmListPre[i].text),
  ];
}
