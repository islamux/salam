import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineTexts(int i, List<ElmModelNew> elmList) {
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];

  return [
    // ayah 0
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle),

    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),

    // subtitle 0
    if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
      TextSpan(text: elm.subtitles![0], style: subtitleStyle),
    // text 1
    if (elm.texts != null && elm.texts!.length > 1)
      TextSpan(text: elm.texts![1], style: null),
  ];
}

// List<TextSpan> getPageNineTexts(int i, List<ElmodelNew> elmList) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   TextStyle subtitle = AppTheme.customTextStyleSubtitle();

//   return [
//     TextSpan(text: elmList11[i].ayah, style: ayah),
//     TextSpan(text: elmList11[i].text),
//     TextSpan(text: elmList11[i].subtitle, style: subtitle),
//     TextSpan(text: elmList11[i].text2),
//   ];
// }
