import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwoTexts(int i) {
  return [
    TextSpan(text: elmList8[i].elmTextTwo1),
    TextSpan(text: elmList8[i].ayahHadithTwo1),
    TextSpan(text: elmList8[i].elmTextTwo2),
  ];
}
