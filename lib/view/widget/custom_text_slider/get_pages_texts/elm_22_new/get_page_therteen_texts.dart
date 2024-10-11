import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTherteenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  ElmModelNew elm = elmList[i];
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  return [
    // Form ElmTextTwentyTwo{} // page 13
    // subtitle 0
    if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
      TextSpan(text: elm.subtitles![0], style: subtitleStyle),
    // subtitle 1
    if (elm.subtitles != null && elm.subtitles!.length > 1)
      TextSpan(text: elm.subtitles![1], style: subtitleStyle),
    // ayah 0
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle),
    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
  ];
}

// List<TextSpan> getPageTherteenTexts(int i, List<ElmModelNew>elmList) {
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   ElmModel elm = elmList22[i];
//   return [
//     // Form ElmTextTwentyTwo{} // page 13
//     TextSpan(text: elm.subtitle, style: subtitleStyle),
//     TextSpan(text: elm.subtitle2, style: subtitleStyle),
//     TextSpan(text: elm.ayah, style: ayahStyle),
//     TextSpan(text: elm.text2),
//   ];
// }
