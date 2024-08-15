import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwoTexts(int i) {
  return [
    TextSpan(text: elmList6[i].elmTextSix2),
    TextSpan(text: elmList6[i].ayahHadithSix2),
  ];
}
