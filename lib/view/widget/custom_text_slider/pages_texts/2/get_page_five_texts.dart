import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i) {
  return [
    TextSpan(text: elmList2[i].elmTextTwoFive_1),
    TextSpan(text: elmList2[i].footerTwoFive),
  ];
}
