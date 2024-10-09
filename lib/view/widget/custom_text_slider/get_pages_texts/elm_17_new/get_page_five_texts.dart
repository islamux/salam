import 'package:elm/core/data/model/elm_lists/elm_list_17.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(List<ElmModelNew> elmList) {

    TextSpan(text: elmList17[i].text2),
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
