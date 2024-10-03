import 'package:elm/core/data/model/elm_lists/elm_list_pre.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmListPre[i].title, style: title),
    TextSpan(text: elmListPre[i].ayah, style: ayah),
    TextSpan(text: elmListPre[i].text),
  ];
}
