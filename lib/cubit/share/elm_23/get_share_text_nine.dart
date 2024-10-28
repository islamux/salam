import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<Text> getShareTextNine(int currentPageIndex, List<ElmModelNew> elmList) {
  ElmModelNew text = elmList[currentPageIndex];
  return [
    //
    Text(text.ayahs![0]),
    Text(text.titles![0]),
    Text(text.texts![0]),
    //
    Text(text.ayahs![1]),
    Text(text.texts![1]),
  ];
}
