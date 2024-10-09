import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwentyTwoTexts(int i, List<ElmModelNew> elmList) {
 TextStyle titleStyle = AppTheme.customTextStyleTitle();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];
  
  return [
   // title
 if (elm.titles != null && elm.titles!.isNotEmpty)
      TextSpan(text: elm.titles![0], style: titleStyle),
     // subtitle 0
 if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
   TextSpan(text: elm.subtitles![0], style: subtitleStyle),
      // text 0
 if (elm.texts != null && elm.texts!.isNotEmpty)
   TextSpan(text: elm.texts![0], style: null),
       // ayah 0
 if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
   TextSpan(text: elm.ayahs![0], style: ayahStyle),
      // text 0
 if (elm.texts != null && elm.texts!.isNotEmpty)
   TextSpan(text: elm.texts![0], style: null),
  
  ];
}

// List<TextSpan> getPageTwentyTwoTexts(int i, List<ElmModelNew> elmList) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   TextStyle subtitle = AppTheme.customTextStyleSubtitle();
//   TextStyle title = AppTheme.customTextStyleTitle();
//   return [
//     TextSpan(text: elmList16[i].title, style: title),
//     TextSpan(text: elmList16[i].subtitle, style: subtitle),
//     TextSpan(text: elmList16[i].text),
//     TextSpan(text: elmList16[i].ayah, style: ayah),
//     TextSpan(text: elmList16[i].text2),
//   ];
// }
