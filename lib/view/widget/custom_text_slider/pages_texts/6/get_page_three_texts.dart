import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  return [
    TextSpan(text: elmList6[i].elmTextSixThree_1),
    TextSpan(text: elmList6[i].ayahHadithSixThree_1),
    TextSpan(text: elmList6[i].elmTextSixThree_2),
  ];
}
