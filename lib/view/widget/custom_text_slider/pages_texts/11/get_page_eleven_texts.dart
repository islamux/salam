import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageElevenTexts(int i) {
  return [
    TextSpan(text: elmList11[i].elmTextSevenEleven_1),
    TextSpan(text: elmList11[i].ayahHadithElevenEleven_2),
    TextSpan(text: elmList11[i].elmTextElevenEleven_3),
    TextSpan(text: elmList11[i].footerElevenEleven),
  ];
}
