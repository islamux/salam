import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  ElmModelNew elm = elmList[i];
  return [
    TextSpan(text: elm.texts![0]),
    TextSpan(text: elm.ayahs![0], style: ayah),
    TextSpan(text: elm.texts![1]),
  ];
}
