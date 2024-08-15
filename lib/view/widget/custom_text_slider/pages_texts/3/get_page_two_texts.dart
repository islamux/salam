import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTowTexts(int i) {
  return [
    TextSpan(text: elmList3[i].elmTextThreeTwo_1),
    TextSpan(text: elmList3[i].elmTextThreeTwo_2),
    TextSpan(text: elmList3[i].ayahHadithThreeThree_1),
    TextSpan(text: elmList3[i].elmTextThreeTwo_3),
  ];
}
