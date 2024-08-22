import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineTexts(int i) {
  return [
    TextSpan(text: elmList2[i].elmTextTwoNine_1),
    TextSpan(text: elmList2[i].elmTextTwoNine_2),
  ];
}
