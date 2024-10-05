import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSeventeenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  ElmModel elm16 = elmList16[i];
  return [
    TextSpan(text: elm16.ayah, style: ayah),
    TextSpan(text: elm16.text),
  ];
}
