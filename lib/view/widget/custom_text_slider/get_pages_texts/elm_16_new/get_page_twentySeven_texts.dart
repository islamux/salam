import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwentySevenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle titleStyle = AppTheme.customTextStyleTitle();

  ElmModelNew elm = elmList[i];
 
  return [
    // title
 if (elm.titles != null && elm.titles!.isNotEmpty)
      TextSpan(text: elm.titles![0], style: titleStyle),
     // text 0
 if (elm.texts != null && elm.texts!.isNotEmpty)
   TextSpan(text: elm.texts![0], style: null),
  
  ];
}

// List<TextSpan> getPageTwentySevenTexts(int i, List<ElmModelNew> elmList) {
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   ElmModel elm = elmList16[i];

//   return [
//     TextSpan(text: elm.title, style: titleStyle),
//     TextSpan(text: elm.text),
//   ];
// }
