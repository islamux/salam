import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(text: elmList5[i].titleFiveOne),
    TextSpan(text: elmList5[i].ayahHadithFiveOne_1),
    TextSpan(text: elmList5[i].elmTextFiveOne_1),
    TextSpan(text: elmList5[i].footerFiveOne),
  ];
}
