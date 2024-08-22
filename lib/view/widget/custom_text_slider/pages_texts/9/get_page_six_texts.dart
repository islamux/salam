import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i) {
  return [
    TextSpan(text: elmList9[i].elmTextNineSix_1),
    TextSpan(text: elmList9[i].ayahHadithNineSix_1),
    TextSpan(text: elmList9[i].elmTextNineSix_2),
    TextSpan(text: elmList9[i].ayahHadithNineSix_2),
    TextSpan(text: elmList9[i].elmTextNineSix_3),
  ];
}
