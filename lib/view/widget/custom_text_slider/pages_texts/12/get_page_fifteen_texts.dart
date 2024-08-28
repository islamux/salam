import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFifteenTexts(int i) {
  return [
    TextSpan(text: elmList12[i].elmTextTwelveFifteen_1),
    TextSpan(text: elmList12[i].ayahHadithTwelveFifteen_1),
    TextSpan(text: elmList12[i].elmTextTwelveFifteen_2),
    TextSpan(text: elmList12[i].ayahHadithTwelveFifteen_2),
    TextSpan(text: elmList12[i].elmTextTwelveFifteen_3),
    TextSpan(text: elmList12[i].footerTwelveFifteen),
  ];
}
