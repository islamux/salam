import 'package:elm/core/data/model/elm_lists/elm_list_15.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList15[i].ayah, style: ayah),
    TextSpan(text: elmList15[i].text),
    TextSpan(text: elmList15[i].ayah2, style: ayah),
    TextSpan(text: elmList15[i].text2),
    TextSpan(text: elmList15[i].ayah3, style: ayah),
    TextSpan(text: elmList15[i].text4),
  ];
}
