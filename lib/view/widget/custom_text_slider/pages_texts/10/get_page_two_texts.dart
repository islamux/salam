import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTowTexts(int i) {
  return [
    TextSpan(text: elmList[i].elmTextTwo1),
    TextSpan(text: elmList6[i].ayahHadithTwo1),
  ];
}
