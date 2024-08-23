import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTentTexts(int i) {
  return [
    TextSpan(text: elmList5[i].elmTexteFiveTen_1),
    TextSpan(text: elmList5[i].ayahHadithFiveTen_1),
    TextSpan(text: elmList5[i].elmTexteFiveTen_2),
    TextSpan(text: elmList5[i].ayahHadithFiveTen_2),
    TextSpan(text: elmList5[i].elmTexteFiveTen_3),
  ];
}
