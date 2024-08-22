import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  return [
    TextSpan(text: elmList2[i].elmTextTwoThree_1),
    TextSpan(text: elmList2[i].ayahHadithTwoThree_1),
    TextSpan(text: elmList2[i].elmTextTwoThree_2),
  ];
}
