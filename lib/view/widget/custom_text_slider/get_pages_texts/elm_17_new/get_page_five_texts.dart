import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i, List<ElmModelNew> elmList) {
  ElmModelNew elm = elmList[i];
  return [
    // text 0
    //if (elm.texts != null && elm.texts!.isNotEmpty)
    TextSpan(text: elm.texts![0], style: null),
    // text 1
    //if (elm.texts != null && elm.texts!.length > 2)
    TextSpan(text: elm.texts![1], style: null),
  ];
}
