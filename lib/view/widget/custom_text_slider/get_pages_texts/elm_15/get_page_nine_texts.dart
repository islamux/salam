import 'package:elm/core/data/model/elm_lists/elm_list_15.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineTexts(int i) {
  return [
    TextSpan(text: elmList15[i].title, style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList15[i].text),
  ];
}
