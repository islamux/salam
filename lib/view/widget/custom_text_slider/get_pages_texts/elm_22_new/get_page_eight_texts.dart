import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();

  ElmModelNew elm = elmList[i];
  return [
    // ayah 0
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle),
    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: titleStyle),
    // subtitle 0
    if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
      TextSpan(text: elm.subtitles![0], style: subtitleStyle),
    // text 1
    if (elm.texts != null && elm.texts!.length > 1)
      TextSpan(text: elm.texts![1], style: titleStyle),
    // subtitle 1
    if (elm.subtitles != null && elm.subtitles!.length > 1)
      TextSpan(text: elm.subtitles![1], style: subtitleStyle),
    // ayah 1
    if (elm.ayahs != null && elm.ayahs!.length > 1)
      TextSpan(text: elm.ayahs![1], style: ayahStyle),
    // text 2
    if (elm.texts != null && elm.texts!.length > 2)
      TextSpan(text: elm.texts![2], style: titleStyle),
    // subtitle 2
    if (elm.subtitles != null && elm.subtitles!.length > 2)
      TextSpan(text: elm.subtitles![2], style: subtitleStyle),
    // ayah 2
    if (elm.ayahs != null && elm.ayahs!.length > 2)
      TextSpan(text: elm.ayahs![2], style: ayahStyle),
    // text 3
    if (elm.texts != null && elm.texts!.length > 3)
      TextSpan(text: elm.texts![3], style: titleStyle),
    // subtitle 3
    if (elm.subtitles != null && elm.subtitles!.length > 3)
      TextSpan(text: elm.subtitles![3], style: subtitleStyle),
    // ayah 3
    if (elm.ayahs != null && elm.ayahs!.length > 3)
      TextSpan(text: elm.ayahs![3], style: ayahStyle),
    // text 4
    if (elm.texts != null && elm.texts!.length > 4)
      TextSpan(text: elm.texts![4], style: titleStyle),
    // subtitle 4
    if (elm.subtitles != null && elm.subtitles!.length > 4)
      TextSpan(text: elm.subtitles![4], style: subtitleStyle),
    // ayah 4
    if (elm.ayahs != null && elm.ayahs!.length > 4)
      TextSpan(text: elm.ayahs![4], style: ayahStyle),
    // text 5
    if (elm.texts != null && elm.texts!.length > 5)
      TextSpan(text: elm.texts![5], style: titleStyle),
  ];
}

// List<TextSpan> getPageEightTexts(int i, List<ElmModelNew>elmList) {
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   ElmModel elm = elmList22[i];
//   return [
//     TextSpan(text: elm.ayah, style: ayahStyle),
//     TextSpan(text: elm.text, style: titleStyle),
//     TextSpan(text: elm.subtitle, style: subtitleStyle),
//     TextSpan(text: elm.text2, style: titleStyle),
//     TextSpan(text: elm.ayah2, style: ayahStyle),
//     TextSpan(text: elm.text3, style: titleStyle),
//     TextSpan(text: elm.ayah3, style: ayahStyle),
//     TextSpan(text: elm.text4, style: titleStyle),
//     TextSpan(text: elm.ayah4, style: ayahStyle),
//     TextSpan(text: elm.text5, style: titleStyle),
//     TextSpan(text: elm.ayah5, style: ayahStyle),
//     TextSpan(text: elm.text6, style: titleStyle),
//   ];
// }
