import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(text: elmList8[i].titleOne),
    TextSpan(text: elmList8[i].elmTextEight1),
    TextSpan(text: elmList8[i].ayahHadithEight1),
  ];
}
