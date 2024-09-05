import 'package:elm/core/data/model/elm_lists/elm_list_2.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineTexts(int i) {
  return [
    TextSpan(text: elmList2[i].text),
    TextSpan(text: elmList2[i].text2),
  ];
}
