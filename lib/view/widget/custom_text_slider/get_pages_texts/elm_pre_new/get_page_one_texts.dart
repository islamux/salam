import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i, List<ElmModelNew> elmList) {
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  ElmModelNew elm = elmList[i];
  return [
    TextSpan(text: elm.titles![0], style: titleStyle),
    TextSpan(text: elm.ayahs![0], style: ayahStyle),
    TextSpan(text: elm.texts![0]),
  ];
}
