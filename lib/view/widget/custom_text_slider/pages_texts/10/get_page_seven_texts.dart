import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  return [
    TextSpan(text: elmList10[i].elmTextTenSeven_1),
    TextSpan(text: elmList10[i].ayahHadithTenSeven_1),
    TextSpan(text: elmList10[i].elmTextTenSeven_2),
    TextSpan(text: elmList10[i].ayahHadithTenSeven_2),
    TextSpan(text: elmList10[i].elmTextSeven_3),
  ];
}
