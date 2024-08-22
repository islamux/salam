import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(text: elmList2[i].titleTwoOne),
    TextSpan(text: elmList2[i].ayahHadithTwoOne_1),
    TextSpan(text: elmList2[i].elmTextTwoOne_1),
    TextSpan(text: elmList2[i].ayahHadithTwoOne_2),
    TextSpan(text: elmList2[i].elmTextTwoOne_2),
  ];
}
