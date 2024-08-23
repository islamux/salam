import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTherteenTexts(int i) {
  return [
    TextSpan(text: elmList5[i].titleFiveTherteen),
    TextSpan(text: elmList5[i].ayahHadithFiveTherteen_1),
    TextSpan(text: elmList5[i].elmTextFiveTherteen_1),
    TextSpan(text: elmList5[i].ayahHadithFiveTherteen_2),
    TextSpan(text: elmList5[i].elmTextFiveTherteen_2),
  ];
}
