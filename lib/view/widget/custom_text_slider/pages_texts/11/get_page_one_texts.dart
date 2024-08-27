import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  TextStyle title = AppTheme.customTextStyleTitle();

  return [
    TextSpan(text: elmList11[i].titleElevenOne, style: title),
    TextSpan(text: elmList11[i].elmTextElevenOne_1),
    TextSpan(text: elmList11[i].ayahHadithElevenOne_1, style: ayah),
    TextSpan(text: elmList11[i].elmTextElevenOne_2),
  ];
}
