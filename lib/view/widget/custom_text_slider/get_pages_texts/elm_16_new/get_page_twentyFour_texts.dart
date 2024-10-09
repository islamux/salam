import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwentyFourTexts(inti, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  ElmModelNew  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  ElmModelNew elm = elmList[i];
  
  return [
 //1      // title
    if (elm.titles != null && elm.titles!.isNotEmpty)
      TextSpan(text: elm.titles![0], style: titleStyle),

// 2    // subtitle 0
    if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
      TextSpan(text: elm.subtitles![0], style: subtitleStyle),
 
// 3    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
 
// 4    // ayah 0
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle),
 
// 5    // text 1
    if (elm.texts != null && elm.texts!.length > 1)
      TextSpan(text: elm.texts![1], style: null),
// 6   // ayah 1
    if (elm.ayahs != null && elm.ayahs!.length > 1)
      TextSpan(text: elm.ayahs![1], style: ayahStyle),
   
}

// List<TextSpan> getPageTwentyFourTexts(List<ElmModelNew> elmList) {
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   ElmModel elm = elmList16[i];

//   return [
//     TextSpan(text: elm.title, style: titleStyle),
//     TextSpan(text: elm.subtitle, style: subtitleStyle),
//     TextSpan(text: elm.text),
//     TextSpan(text: elm.ayah, style: ayahStyle),
//     TextSpan(text: elm.text2),
//     TextSpan(text: elm.ayah2, style: ayahStyle),
//   ];
// }
