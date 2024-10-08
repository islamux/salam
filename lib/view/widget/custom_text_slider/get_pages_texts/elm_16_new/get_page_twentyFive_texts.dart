import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwentyFiveTexts(int i, List<ElmModelNew> elmList) {
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];

  return [
    //subtitle
    if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
      TextSpan(text: elm.subtitles![0], style: subtitleStyle),
    //text
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
    //subtitle2
    if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
      TextSpan(text: elm.subtitles![1], style: subtitleStyle),
    //text2
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![1], style: null),
    //ayah
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle),
    //text3
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
    //ayah2
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![1], style: ayahStyle),
  ];
}

// List<TextSpan> getPageTwentyFiveTexts(int i, List<ElmModelNew>elmList) {
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   ElmModel elm = elmList16[i];

//   return [
//     TextSpan(text: elm.subtitle, style: subtitleStyle),
//     TextSpan(text: elm.text),
//     TextSpan(text: elm.subtitle2, style: subtitleStyle),
//     TextSpan(text: elm.text2),
//     TextSpan(text: elm.ayah, style: ayahStyle),
//     TextSpan(text: elm.text3),
//     TextSpan(text: elm.ayah2, style: ayahStyle),
//   ];
// }
