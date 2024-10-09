import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i, List<ElmModelNew> elmList) {
  ElmModelNew elm = elmList[i];
  return [
    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
    // text 2
    if (elm.texts != null && elm.texts!.length > 2)
      TextSpan(text: elm.texts![2], style: null),
  ];
}

// List<TextSpan> getPageFiveTexts(List<ElmModelNew> elmList) {
//   return [
//     TextSpan(text: elmList17[i].text),
//     TextSpan(text: elmList17[i].text2),
//   ];
// }
