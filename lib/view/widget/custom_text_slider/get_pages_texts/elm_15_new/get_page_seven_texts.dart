import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i, List<ElmModelNew> elmList) {
  ElmModelNew elm = elmList[i];

  return [
// text 0
    TextSpan(text: elm.texts![0], style: null),
  ];
}

// List<TextSpan> getPageSevenTexts(int i, List<ElmModelNew>elmList) {
//   return [
//     TextSpan(text: elmList15[i].text),
//   ];
// }
