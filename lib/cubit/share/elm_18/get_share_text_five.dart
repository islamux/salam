import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<Text> getShareTextFive(int currentPageIndex, List<ElmModelNew> elmList) {
  ElmModelNew text = elmList[currentPageIndex];
  return [
    Text(text.texts![0]),
  ];
}
