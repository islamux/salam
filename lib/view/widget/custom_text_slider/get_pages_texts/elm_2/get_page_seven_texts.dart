import 'package:elm/core/data/model/elm_lists/elm_list_2.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  return [
    TextSpan(text: elmList2[i].text),
    TextSpan(text: elmList2[i].ayah, style: AppTheme.customTextStyleHadith()),
  ];
}