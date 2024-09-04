import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_2.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i) {
  return [
    TextSpan(text: elmList2[i].elmTextTwoSix_1),
    TextSpan(text: elmList2[i].elmTextTowSix_2),
  ];
}
