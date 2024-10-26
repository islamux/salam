import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<Text> getShareTextTherteen(
    int currentPageIndex, List<ElmModelNew> elmList) {
  ElmModelNew text = elmList[currentPageIndex];
  return [
    Text(text.texts![0]),
    Text(text.subtitle![0]),
//
    Text(text.texts![1]),
    Text(text.subtitle![1]),
//
    Text(text.texts![2]),
  ];
}
