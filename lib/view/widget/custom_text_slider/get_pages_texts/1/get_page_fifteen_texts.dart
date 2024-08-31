import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFifteenTexts(int i) {
  return [
    TextSpan(text: elmList[i].elmTextOneFifteen_1),
    TextSpan(text: elmList[i].elmTextOneFifteen_2),
  ];
}
