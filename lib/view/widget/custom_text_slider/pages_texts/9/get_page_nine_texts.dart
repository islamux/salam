import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineTexts(int i) {
  return [
    TextSpan(text: elmList9[i].titleNineNine),
    TextSpan(text: elmList9[i].elmTextNineNine_1),
    TextSpan(text: elmList9[i].ayahHadithNineNine_1),
    TextSpan(text: elmList9[i].elmTextNineNine_2),
    TextSpan(text: elmList9[i].ayahHadithNineNine_2),
    TextSpan(text: elmList9[i].elmTextNineNine_3),
    TextSpan(text: elmList9[i].footerNineNine),
  ];
}
