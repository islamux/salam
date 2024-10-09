import 'package:elm/core/data/model/elm_lists/elm_list_19.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageElevenTexts(List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];
 
 return [
      // ayah 0
 if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
   TextSpan(text: elm.ayahs![0], style: ayahStyle),
       // text 0
 if (elm.texts != null && elm.texts!.isNotEmpty)
   TextSpan(text: elm.texts![0], style: null),
      // ayah 1
 if (elm.ayahs != null && elm.ayahs!.length > 1)
   TextSpan(text: elm.ayahs![1], style: ayahStyle),
      // text 1
 if (elm.texts != null && elm.texts!.length > 1)
   TextSpan(text: elm.texts![1], style: null),
 
 ];
}

// List<TextSpan> getPageElevenTexts(List<ElmModelNew> elmList) {
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   ElmModel elm = elmList19[i];
//   return [
//     TextSpan(text: elm.ayah, style: ayahStyle),
//     TextSpan(text: elm.text),
//     TextSpan(text: elm.ayah2, style: ayahStyle),
//     TextSpan(text: elm.text2),
//   ];
// }
