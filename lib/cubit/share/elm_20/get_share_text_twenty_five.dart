import 'package:elm/core/data/model/elm_model_new.dart'; import 'package:flutter/material.dart';
List<Text> getShareTextTwentyFive(int currentPageIndex, List<ElmModelNew> elmList) {
  ElmModelNew text = elmList[currentPageIndex];
  return [
    //
    Text(text.subtitles![0]),
    Text(text.texts![0]),
    //

  ];
}
