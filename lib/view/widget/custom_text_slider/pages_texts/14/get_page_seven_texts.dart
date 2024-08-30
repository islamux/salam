import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList14[i].ayahHadithFourteenSeven_1, style: ayah),
    TextSpan(text: elmList14[i].ayahHadithFourteenSeven_2, style: ayah),
    TextSpan(text: elmList14[i].subtitleFourteenSeven_1, style: title),
    TextSpan(text: elmList14[i].elmTextFourteenSeven_3),
    TextSpan(text: elmList14[i].ayahHadithFourteenSeven_3, style: ayah),
  ];
}
