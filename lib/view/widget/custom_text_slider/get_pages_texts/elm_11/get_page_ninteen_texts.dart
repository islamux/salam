import 'package:elm/core/data/model/elm_lists/elm_list_11.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNinteenTexts(int i) {
  return [
    TextSpan(text: elmList11[i].title, style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList11[i].text),
  ];
}