import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<Text> getShareTextOne(int currentPageIndex, List<ElmModelNew> elmList) {
  ElmModelNew text = elmList[currentPageIndex];
  return [
    Text(text.titles![0]),
    Text(text.ayah![0]),
    Text(text.texts![0]),

    Text(text.ayah![1]),
    Text(text.texts![1]),

    Text(text.ayah![2]),
    Text(text.texts![2]),


  ];
}
