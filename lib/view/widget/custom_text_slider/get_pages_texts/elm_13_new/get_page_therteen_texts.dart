import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTherteenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();

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
    // subtitle 1
    if (elm.subtitles != null && elm.subtitles!.length > 1)
      TextSpan(text: elm.subtitles![1], style: subtitleStyle),

    // text 2
    if (elm.texts != null && elm.texts!.length > 2)
      TextSpan(text: elm.texts![2], style: null),
  ];
}

// List<TextSpan> getPageTherteenTexts(int i, List<ElmModelNew>elmList) {
//   TextStyle subtitle = AppTheme.customTextStyleSubtitle();
//   return [
//     TextSpan(text: elmList13[i].text),
//     TextSpan(text: elmList13[i].subtitle, style: subtitle),
//     TextSpan(text: elmList13[i].text2),
//     TextSpan(text: elmList13[i].subtitle2, style: subtitle),
//     TextSpan(text: elmList13[i].text3),
//   ];
// }
