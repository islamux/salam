import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  return [
    TextSpan(text: elmList10[i].elmTextSeven1),
    TextSpan(text: elmList10[i].ayahHadithSeven),
    TextSpan(text: elmList10[i].elmTextSeven2),
    TextSpan(text: elmList10[i].ayahHadithSeven2),
    TextSpan(text: elmList10[i].elmTextSeven3),
  ];
}
