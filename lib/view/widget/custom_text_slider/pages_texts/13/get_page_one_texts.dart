import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(text: elmList13[i].titleOneTherteen),
    TextSpan(text: elmList13[i].ayahHadithTherteenOne_1),
    TextSpan(text: elmList13[i].elmTextTherteenOne_1),
    TextSpan(text: elmList13[i].ayahHadithTherteenOne_2),
    TextSpan(text: elmList13[i].elmTextThreeOne_2),
    TextSpan(text: elmList13[i].ayahHadithTherteenOne_3),
    TextSpan(text: elmList13[i].elmTextTherteenOne_3),
    TextSpan(text: elmList13[i].footerTherteen),
  ];
}
