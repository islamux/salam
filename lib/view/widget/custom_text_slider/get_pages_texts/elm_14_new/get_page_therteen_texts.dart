import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTherteenTexts(int i, List<ElmModelNew> elmList) {
  ElmModelNew elm = elmList[i];
  return [
    // text 0
    //if (elm.texts != null && elm.texts!.isNotEmpty)
    TextSpan(text: elm.texts![0], style: null),
  ];
}
