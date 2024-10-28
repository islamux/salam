import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<Text> getShareTextSeven(int currentPageIndex, List<ElmModelNew> elmList) {
  ElmModelNew text = elmList[currentPageIndex];
  return [
    //
    Text(text.texts![0]),
    Text(text.ayahs![0]),
    //
    Text(text.texts![1]),
    Text(text.ayahs![1]),
    //
    Text(text.texts![1]),
    Text(text.ayahs![1]),
//
    Text(text.texts![2]),
    Text(text.ayahs![2]),
//
    Text(text.texts![3]),
    Text(text.ayahs![3]),
//
    Text(text.texts![4]),
    Text(text.ayahs![4]),
//
    Text(text.texts![5]),
    Text(text.ayahs![5]),
//
    Text(text.texts![6]),
    Text(text.ayahs![6]),
//
    Text(text.texts![7]),
    Text(text.ayahs![7]),
//
    Text(text.texts![8]),
  ];
}
