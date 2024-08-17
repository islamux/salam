import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(text: elmList17[i].elmTextSixteenOne_1),
    TextSpan(text: elmList17[i].ayahHadithSeventeenOne_1),
    TextSpan(text: elmList17[i].elmTextSeventeenOne_2),
    TextSpan(text: elmList17[i].ayahHadithSeventeenOne_2),
    TextSpan(text: elmList17[i].elmTextSeventeenOne_3),
  ];
}
