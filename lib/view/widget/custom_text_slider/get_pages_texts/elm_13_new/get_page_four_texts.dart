import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourTexts(int i, List<ElmModelNew> elmList) {
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];

  return [
    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
    // subtitle 0
    if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
      TextSpan(text: elm.subtitles![0], style: subtitleStyle),
    // text 1
    if (elm.texts != null && elm.texts!.length > 1)
      TextSpan(text: elm.texts![1], style: null),
    // ayah 0
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle),
    // subtitle 1
    if (elm.subtitles != null && elm.subtitles!.length > 1)
      TextSpan(text: elm.subtitles![1], style: subtitleStyle),
    // text 2
    if (elm.texts != null && elm.texts!.length > 2)
      TextSpan(text: elm.texts![2], style: null),
    // ayah 1
    if (elm.ayahs != null && elm.ayahs!.length > 1)
      TextSpan(text: elm.ayahs![1], style: ayahStyle),
    // subtitle 2
    if (elm.subtitles != null && elm.subtitles!.length > 2)
      TextSpan(text: elm.subtitles![2], style: subtitleStyle),
    // text 3
    if (elm.texts != null && elm.texts!.length > 2)
      TextSpan(text: elm.texts![3], style: null),
    // ayah 2
    if (elm.ayahs != null && elm.ayahs!.length > 2)
      TextSpan(text: elm.ayahs![2], style: ayahStyle),
    // subtitle 3
    if (elm.subtitles != null && elm.subtitles!.length > 2)
      TextSpan(text: elm.subtitles![3], style: subtitleStyle),
  ];
}

// List<TextSpan> getPageFourTexts(int i, List<ElmModelNew>elmList) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   TextStyle subtitle = AppTheme.customTextStyleSubtitle();
//   return [
//     TextSpan(text: elmList13[i].text),
//     TextSpan(text: elmList13[i].subtitle, style: ayah),
//     TextSpan(text: elmList13[i].text2),
//     TextSpan(text: elmList13[i].ayah, style: ayah),
//     TextSpan(text: elmList13[i].subtitle2, style: subtitle),
//     TextSpan(text: elmList13[i].text3),
//     TextSpan(text: elmList13[i].ayah2, style: ayah),
//     TextSpan(text: elmList13[i].subtitle3, style: subtitle),
//     TextSpan(text: elmList13[i].text4),
//     TextSpan(text: elmList13[i].ayah3, style: ayah),
//     TextSpan(text: elmList13[i].subtitle4, style: subtitle),
//   ];


// }
