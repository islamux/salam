import 'package:elm/core/data/model/elm_lists/elm_list_12.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwoTexts(int i) {
  return [
    TextSpan(text: elmList12[i].text),
  ];
}
