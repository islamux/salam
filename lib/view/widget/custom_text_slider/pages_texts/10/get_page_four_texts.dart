import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourTexts(int i) {
  return [
    TextSpan(text: elmList10[i].ayahHadithFour1),
    TextSpan(text: elmList10[i].elmTextFour1),
  ];
}
