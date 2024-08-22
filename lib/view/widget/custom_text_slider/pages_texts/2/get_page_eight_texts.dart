import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  return [
    TextSpan(text: elmList2[i].elmTextTwoEight_1),
    TextSpan(text: elmList2[i].ayahHadithTwoEight_1),
    TextSpan(text: elmList2[i].footerTwoEight),
  ];
}
