import 'package:elm/core/data/model/elm_lists/elm_list_4.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList4[i].title, style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList4[i].text),
    TextSpan(text: elmList4[i].ayah, style: ayah),
  ];
}
