import 'package:elm/core/data/model/elm_lists/elm_list_pre.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmListPre[i].ayah, style: ayah),
    TextSpan(text: elmListPre[i].text),
    TextSpan(text: elmListPre[i].ayah2, style: ayah),
    TextSpan(text: elmListPre[i].text2),
    TextSpan(text: elmListPre[i].ayah3, style: ayah),
    TextSpan(text: elmListPre[i].text3),
  ];
}
