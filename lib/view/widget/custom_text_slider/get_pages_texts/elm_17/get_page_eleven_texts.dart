import 'package:elm/core/data/model/elm_lists/elm_list_17.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageElevenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList17[i].ayah, style: ayah),
    TextSpan(text: elmList17[i].text),
  ];
}