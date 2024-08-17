import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  return [
    TextSpan(text: elmList4[i].elmTextFourEight_1),
    TextSpan(text: elmList4[i].ayahHadithFourEight_1),
    TextSpan(text: elmList4[i].elmTextFourEight_2),
  ];
}
