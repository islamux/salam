import 'package:elm/core/data/model/elm_lists/elm_list_5.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineTexts(int i) {
  return [
    TextSpan(text: elmList5[i].text),
    TextSpan(text: elmList5[i].ayah),
  ];
}
