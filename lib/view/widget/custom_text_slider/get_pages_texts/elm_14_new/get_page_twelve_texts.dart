import 'package:elm/core/data/model/elm_lists/elm_list_14.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwelveTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList14[i].title, style: title),
    TextSpan(text: elmList14[i].text),
  ];
}
