import 'package:elm/core/data/model/elm_lists/elm_list_11.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTenTexts(int i, List<ElmodelNew> elmList) {
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

// List<TextSpan> getPageTenTexts(int i, List<ElmodelNew> elmList) {
//   return [
//     TextSpan(text: elmList11[i].title, style: AppTheme.customTextStyleTitle()),
//     TextSpan(text: elmList11[i].text),
//   ];
// }
