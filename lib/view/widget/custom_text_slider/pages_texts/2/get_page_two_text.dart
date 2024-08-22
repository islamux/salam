import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwoTexts(int i) {
  return [
    TextSpan(text: elmList2[i].ayahHadithTwoTwo_1),
    TextSpan(text: elmList2[i].elmTextTwoTwo_1),
  ];
}
