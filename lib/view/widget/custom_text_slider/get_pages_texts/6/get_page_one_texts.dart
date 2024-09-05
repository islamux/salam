import 'package:elm/core/data/model/elm_lists/elm_list_6.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList6[i].title, style: title),
    TextSpan(text: elmList6[i].text),
    TextSpan(text: elmList6[i].text2),
    TextSpan(text: elmList6[i].ayah, style: ayah),
  ];
}
