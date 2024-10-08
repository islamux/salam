import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwelveTexts(int i, List<ElmModelNew> elmList) {
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();

  ElmModelNew elm = elmList[i];

  return [
// subtitle
    if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
      TextSpan(text: elm.subtitles![0], style: subtitleStyle),
    // text
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
  ];
}

// List<TextSpan> getPageTwelveTexts(int i, List<ElmModelNew>elmList) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   TextStyle subtitle = AppTheme.customTextStyleSubtitle();
//   return [
//     TextSpan(text: elmList16[i].subtitle, style: subtitle),
//     TextSpan(text: elmList16[i].text),
//   ];
// }
