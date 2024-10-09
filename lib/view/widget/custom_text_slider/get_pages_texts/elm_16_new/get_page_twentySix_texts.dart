import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwentySixTexts(int i, List<ElmModelNew> elmList) {
 TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];
  
  return [
    // text 0
 if (elm.texts != null && elm.texts!.isNotEmpty)
   TextSpan(text: elm.texts![0], style: null),
     // ayah 0
 if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
   TextSpan(text: elm.ayahs![0], style: ayahStyle),
      // text 1
 if (elm.texts != null && elm.texts!.length > 1)
   TextSpan(text: elm.texts![1], style: null),
       // ayah 1
 if (elm.ayahs != null && elm.ayahs!.length > 1)
   TextSpan(text: elm.ayahs![1], style: ayahStyle),
      // text 2
 if (elm.texts != null && elm.texts!.length > 2)
   TextSpan(text: elm.texts![2], style: null),
     // text 3
 if (elm.texts != null && elm.texts!.length > 2)
   TextSpan(text: elm.texts![3], style: null),
     // ayah 2
 if (elm.ayahs != null && elm.ayahs!.length > 2)
   TextSpan(text: elm.ayahs![2], style: ayahStyle),
   

 ];
}

// List<TextSpan> getPageTwentySixTexts(int i, List<ElmModelNew> elmList) {
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   ElmModel elm = elmList16[i];

//   return [
//     TextSpan(text: elm.text),
//     TextSpan(text: elm.ayah, style: ayahStyle),
//     TextSpan(text: elm.text2),
//     TextSpan(text: elm.ayah2, style: ayahStyle),
//     TextSpan(text: elm.text3),
//     TextSpan(text: elm.text4),
//     TextSpan(text: elm.ayah3, style: ayahStyle),
//   ];
// }