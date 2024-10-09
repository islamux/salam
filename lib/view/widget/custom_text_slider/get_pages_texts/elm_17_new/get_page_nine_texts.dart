import 'package:elm/core/data/model/elm_lists/elm_list_17.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineTexts(List<ElmModelNew> elmList) {
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
 
  ];
}

// List<TextSpan> getPageNineTexts(List<ElmModelNew> elmList) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   TextStyle subtitle = AppTheme.customTextStyleSubtitle();
//   return [
//     TextSpan(text: elmList17[i].subtitle, style: subtitle),
//     TextSpan(text: elmList17[i].text),
//     TextSpan(text: elmList17[i].ayah, style: ayah),
//     TextSpan(text: elmList17[i].text2),
//   ];
// }
