import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  return [
    TextSpan(text: elmList10[i].ayahHadithThree1),
    TextSpan(text: elmList10[i].subtitleThree1),
    TextSpan(text: elmList10[i].elmTextThree1),
    TextSpan(text: elmList10[i].ayahHadithThree1),
    TextSpan(text: elmList10[i].ayahHadithThree2),
    TextSpan(text: elmList10[i].elmTextThree2),
  ];
}
