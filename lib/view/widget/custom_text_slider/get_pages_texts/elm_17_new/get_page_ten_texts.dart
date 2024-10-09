import 'package:elm/core/data/model/elm_lists/elm_list_17.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTenTexts(List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];
 
  return [
     // text 0
 if (elm.texts != null && elm.texts!.isNotEmpty)
   TextSpan(text: elm.texts![0], style: null),
      // ayah 0
 if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
   TextSpan(text: elm.ayahs![0], style: ayahStyle),
 
  ];
}

// List<TextSpan> getPageTenTexts(List<ElmModelNew> elmList) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   return [
//     TextSpan(text: elmList17[i].text),
//     TextSpan(text: elmList17[i].ayah, style: ayah),
//   ];
// }
