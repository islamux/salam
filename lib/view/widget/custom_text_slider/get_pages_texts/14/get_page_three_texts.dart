import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_14.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList14[i].subtitleFourteenThree_1, style: title),
    TextSpan(text: elmList14[i].ayahHadithFourteenThree_1, style: ayah),
    TextSpan(text: elmList14[i].elmTextFourteenThree_1),
    TextSpan(text: elmList14[i].ayahHadithFourteenThree_2, style: ayah),
    TextSpan(text: elmList14[i].elmTextFourteenThree_2),
  ];
}
