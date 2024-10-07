import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i, List<ElmModelNew> elmList) {
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();

  ElmModelNew elm = elmList[i];

  return [
    // subtitle 0
    if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
      TextSpan(text: elm.subtitles![0], style: subtitleStyle),

    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
  ];
}

// List<TextSpan> getPageSixTexts(int i) {
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   return [
//     TextSpan(text: elmList8[i].subtitle, style: subtitleStyle),
//     TextSpan(text: elmList8[i].text),
//   ];
// }
