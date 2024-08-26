import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(text: elmList11[i].titleElevenOne),
    TextSpan(text: elmList11[i].elmTextElevenOne_1),
    TextSpan(text: elmList11[i].ayahHadithElevenOne_1),
    TextSpan(text: elmList11[i].elmTextElevenOne_2),
  ];
}
