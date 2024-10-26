import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<Text> getShareTextTen(int currentPageIndex, List<ElmModelNew> elmList) {
  ElmModelNew text = elmList[currentPageIndex];
  return [
    // 0
    Text(text.ayahs![0]),
    Text(text.texts![0]),
    //1
    Text(text.ayahs![1]),
    Text(text.texts![1]),
    // 2
    Text(text.ayahs![2]),
    Text(text.texts![2]),
    // 3
    Text(text.ayahs![3]),
    Text(text.texts![3]),
  ];
}
