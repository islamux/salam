import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFifteenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];

  return [
    // ayah 0
    TextSpan(text: elm.ayahs![0], style: ayahStyle),
    // text 0
    TextSpan(text: elm.texts![0], style: null),
    // ayah 1
    TextSpan(text: elm.ayahs![1], style: ayahStyle),
    // text 1
    TextSpan(text: elm.texts![1], style: null),
  ];
}

// List<TextSpan> getPageFifteenTexts(int i, List<ElmModelNew>elmList) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   return [
//     TextSpan(text: elmList15[i].ayah, style: ayah),
//     TextSpan(text: elmList15[i].text),
//     TextSpan(text: elmList15[i].ayah2, style: ayah),
//     TextSpan(text: elmList15[i].text2),
//   ];
// }