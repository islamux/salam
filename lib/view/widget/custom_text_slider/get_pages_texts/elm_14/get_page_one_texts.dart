import 'package:elm/core/data/model/elm_lists/elm_list_14.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(text: elmList14[i].title, style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList14[i].text)
  ];
}
