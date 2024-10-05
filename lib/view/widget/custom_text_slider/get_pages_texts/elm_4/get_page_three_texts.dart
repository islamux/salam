import 'package:elm/core/data/model/elm_lists/elm_list_4.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  return [
    TextSpan(text: elmList4[i].text),
  ];
}
