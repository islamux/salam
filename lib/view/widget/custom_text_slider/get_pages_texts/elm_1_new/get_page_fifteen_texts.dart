import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFifteenTexts(int i, List<ElmModelNew> elmList) {
  ElmModelNew elm = elmList[i]; // استخدم elmListPreNew بناءً على السياق الجديد

  return [
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0]), // النص الأول
    if (elm.texts != null && elm.texts!.length > 1)
      TextSpan(text: elm.texts![1]), // النص الثاني
  ];
}



// List<TextSpan> getPageFifteenTexts(int i) {
//   return [
//     TextSpan(text: elmList[i].text),
//     TextSpan(text: elmList[i].text2),
//   ];
// }