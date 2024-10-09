import 'package:elm/core/data/model/elm_lists/elm_list_18.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTenTexts(List<ElmModelNew> elmList) {
  
  ElmModelNew elm = elmList[i];
  
  return [
    // text 0
 if (elm.texts != null && elm.texts!.isNotEmpty)
   TextSpan(text: elm.texts![0], style: null),

  ];
}

// List<TextSpan> getPageTenTexts(List<ElmModelNew> elmList) {
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   ElmModel elm = elmList18[i];
//   return [
//     TextSpan(text: elm.text),
//   ];
// }
