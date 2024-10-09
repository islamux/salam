import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFifteenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];

  return [
    // subtitle 0
    if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
      TextSpan(text: elm.subtitles![0], style: subtitleStyle),
    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
    // ayah 0
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle),
    // text 1
    if (elm.texts != null && elm.texts!.length > 1)
      TextSpan(text: elm.texts![1], style: null),
    // ayah 1
    if (elm.ayahs != null && elm.ayahs!.length > 1)
      TextSpan(text: elm.ayahs![1], style: ayahStyle),
    // text 2
    if (elm.texts != null && elm.texts!.length > 2)
      TextSpan(text: elm.texts![2], style: null),
  ];
}

// List<TextSpan> getPageFifteenTexts(int i, List<ElmModelNew> elmList) {
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   ElmModel elm = elmList19[i];
//   return [
//     TextSpan(text: elm.subtitle, style: subtitleStyle),
//     TextSpan(text: elm.text),
//     TextSpan(text: elm.ayah, style: ayahStyle),
//     TextSpan(text: elm.text2),
//     TextSpan(text: elm.ayah2, style: ayahStyle),
//     TextSpan(text: elm.text3),
//   ];
// }
