import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<Text> getShareTextSix(int currentPageIndex, List<ElmModelNew> elmList) {
  ElmModelNew text = elmList[currentPageIndex];
  return [
    // 0
    Text(text.texts![0]),
    Text(text.ayahs![0]),
    //1
    Text(text.texts![1]),
    Text(text.ayahs![1]),
    //2
    Text(text.texts![2]),
    Text(text.ayahs![2]),
    //3
    Text(text.texts![3]),
    Text(text.ayahs![3]),
    //4
    Text(text.texts![4]),
    Text(text.ayahs![4]),
    // 5
    Text(text.texts![5]),
  ];
}
