import 'package:elm/core/data/model/elm_lists/elm_list_14.dart';
import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwelveTexts(int i, List<ElmModelNew> elmList) {
  TextStyle titleStyle = AppTheme.customTextStyleTitle();

  ElmModelNew elm = elmList[i];

  return [
    if (elm.titles != null && elm.titles!.isNotEmpty)
      TextSpan(text: elm.titles![0], style: titleStyle),
    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
  ];
}

// List<TextSpan> getPageTwelveTexts(int i, List<ElmModelNew>elmList) {
//   TextStyle title = AppTheme.customTextStyleTitle();
//   return [
//     TextSpan(text: elmList14[i].title, style: title),
//     TextSpan(text: elmList14[i].text),
//   ];
// }
