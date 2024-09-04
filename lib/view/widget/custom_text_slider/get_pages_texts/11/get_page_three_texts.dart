import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_11.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();

  return [
    TextSpan(text: elmList11[i].elmTextElevenThree_1),
    TextSpan(text: elmList11[i].ayahHadithElevenEight_1, style: ayah),
    TextSpan(text: elmList11[i].elmTextElevenThree_2),
  ];
}
