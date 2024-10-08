import 'package:elm/core/data/model/elm_lists/elm_list_12.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineTexts(int i, List<ElmodelNew> elmList) {
  
  ElmModelNew elm = elmList[i];
  return [
    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
 
  ];
}

// List<TextSpan> getPageNineTexts(int i, List<ElmodelNew> elmList) {
//   return [
//     TextSpan(text: elmList12[i].text),
//   ];
// }
