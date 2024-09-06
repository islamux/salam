import 'package:elm/core/data/model/elm_lists/elm_list_1.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFifteenTexts(int i) {
  return [
    TextSpan(text: elmList[i].text),
    TextSpan(text: elmList[i].text2),
  ];
}
