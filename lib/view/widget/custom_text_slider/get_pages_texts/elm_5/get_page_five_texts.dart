import 'package:elm/core/data/model/elm_lists/elm_list_5.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i) {
  return [
    TextSpan(text: elmList5[i].text),
    TextSpan(text: elmList5[i].ayah, style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList5[i].text2),
  ];
}
