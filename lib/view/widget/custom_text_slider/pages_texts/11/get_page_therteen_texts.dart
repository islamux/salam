import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTherteenTexts(int i) {
  return [
    TextSpan(text: elmList11[i].elmTextElevenTherteen_1),
    TextSpan(text: elmList11[i].ayahHadithElevenTherteen_1),
    TextSpan(text: elmList11[i].elmTextElevenTherteen_2),
    TextSpan(text: elmList11[i].ayahHadithElevenTherteen_2),
    TextSpan(text: elmList11[i].elmTextElevenTherteen_3),
  ];
}
