import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  ElmModelNew elm = elmList[i];
  return [
    // these orederd by ElmTextDersPre
    TextSpan(text: elm.ayahs![0], style: ayahStyle),
    TextSpan(text: elm.texts![0]),
    TextSpan(text: elm.ayahs![1], style: ayahStyle),
    TextSpan(text: elm.texts![1]),
    TextSpan(text: elm.ayahs![2], style: ayahStyle),
    TextSpan(text: elm.texts![2]),
  ];
}
