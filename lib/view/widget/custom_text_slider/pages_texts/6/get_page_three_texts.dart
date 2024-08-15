import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  return [
    TextSpan(text: elmList6[i].elmTextSix3),
    TextSpan(text: elmList6[i].ayahHadithSix3),
    TextSpan(text: elmList6[i].elmTextSix2),
  ];
}
