import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTenTexts(int i) {
  return [
    TextSpan(text: elmList9[i].titleNineTen_1),
    TextSpan(text: elmList9[i].elmTextNineTen_1),
    TextSpan(text: elmList9[i].ayahHadithNineTen_2),
    TextSpan(text: elmList9[i].elmTextNineTen_2),
    TextSpan(text: elmList9[i].ayahHadithNineTen_3),
  ];
}
