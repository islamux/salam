import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i, List<ElmModelNew> elmList) {
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];

  return [
    // title
    if (elm.titles != null && elm.titles!.isNotEmpty)
      TextSpan(text: elm.titles![0], style: titleStyle),
    // subtitle
    if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
      TextSpan(text: elm.subtitles![0], style: subtitleStyle),
    // text
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
    // ayah
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle),
    // text 2
    if (elm.texts != null && elm.texts!.length > 1)
      TextSpan(text: elm.texts![1], style: null),
  ];
}

// List<TextSpan> getPageOneTexts(int i, List<ElmModelNew>elmList) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   TextStyle title = AppTheme.customTextStyleTitle();
//   TextStyle subtitle = AppTheme.customTextStyleSubtitle();
//   ElmModel elm = elmList16[i];
//   return [
//     // Page 1 : titles, subtitles, texts, ayahHadiths, footer
//     TextSpan(text: elm.title, style: title),
//     TextSpan(text: elm.subtitle, style: subtitle),
//     TextSpan(text: elm.text),
//     TextSpan(text: elm.ayah, style: ayah),
//     TextSpan(text: elm.text2),
//   ];
// }
