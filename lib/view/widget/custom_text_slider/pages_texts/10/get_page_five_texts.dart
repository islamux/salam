import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i) {
  return [
    TextSpan(text: elmList10[i].ayahHadithFive1),
    TextSpan(text: elmList10[i].elmTextFive1),
    TextSpan(text: elmList10[i].ayahHadithFive2),
  ];
}
