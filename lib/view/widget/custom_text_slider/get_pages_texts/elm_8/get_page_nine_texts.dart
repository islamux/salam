import 'package:elm/core/data/model/elm_lists/elm_list_8.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList8[i].ayah, style: ayah),
    TextSpan(text: elmList8[i].text),
    TextSpan(text: elmList8[i].ayah2, style: ayah),
    TextSpan(text: elmList8[i].text2),
  ];
}
