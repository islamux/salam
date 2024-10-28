import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<Text> getShareTextTen(int currentPageIndex, List<ElmModelNew> elmList) {
  ElmModelNew text = elmList[currentPageIndex];
  return [
    //
    Text(text.subtitles![0]),
    Text(text.texts![0]),
    Text(text.ayahs![0]),
    //
    Text(text.subtitles![1]),
    Text(text.texts![1]),
    Text(text.ayahs![1]),
    //
    Text(text.texts![2]),
    Text(text.ayahs![2]),
  ];
}