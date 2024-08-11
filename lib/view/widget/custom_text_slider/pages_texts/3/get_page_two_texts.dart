import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTowTexts(int i) {
  return [
    TextSpan(text: elmList3[i].elmTextTwo1),
    TextSpan(text: elmList3[i].elmTextTwo2),
    TextSpan(text: elmList3[i].ayahHadithTwo1),
    TextSpan(text: elmList3[i].elmTextTwo3),
  ];
}
