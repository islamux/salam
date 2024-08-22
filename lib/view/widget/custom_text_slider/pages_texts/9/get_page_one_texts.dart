import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(text: elmList9[i].ayahHadithNineOne_1),
    TextSpan(text: elmList9[i].elmTextNineOne_1),
    TextSpan(text: elmList9[i].ayahHadithNineOne_2),
    TextSpan(text: elmList9[i].ayahHadithNineOne_2),
  ];
}
