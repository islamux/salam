import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_15.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwelveTexts(int i) {
  return [
    TextSpan(text: elmList15[i].text),
    TextSpan(text: elmList15[i].text2),
  ];
}
