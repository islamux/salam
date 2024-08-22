import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTherteenTexts(int i) {
  return [
    TextSpan(text: elmList2[i].titelTwoTherteen),
    TextSpan(text: elmList2[i].ayhaHadithTowTherteen_1),
    TextSpan(text: elmList2[i].elmTextTwoTherteen_1),
  ];
}
