import 'package:elm/core/data/model/elm_lists/elm_list_14.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList14[i].ayah, style: ayah),
    TextSpan(text: elmList14[i].text),
  ];
}
