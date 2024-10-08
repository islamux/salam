import 'package:elm/core/data/model/elm_lists/elm_list_6.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i) {
  return [
    TextSpan(text: elmList6[i].title, style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList6[i].ayah, style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList6[i].text),
  ];
}
