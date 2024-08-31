import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwoTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList11[i].elmTextElevenTwo_1),
    TextSpan(text: elmList11[i].ayahHadithElevenTwo_1, style: ayah),
  ];
}
