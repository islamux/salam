import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourTexts(int i) {
  return [
    TextSpan(text: elmList10[i].ayahHadithTenFour_1),
    TextSpan(text: elmList10[i].elmTextTenFour_1),
    TextSpan(text: elmList10[i].ayahHadithTenFive_1),
    TextSpan(text: elmList10[i].elmTextTenFive_1),
    TextSpan(text: elmList10[i].ayahHadithTenFive_2),
  ];
}
