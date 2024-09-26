import 'package:elm/core/data/model/elm_lists/elm_list_23.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEighteenTexts(int i) {
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle footer = AppTheme.customTextStyleFooter();
  ElmModel elm = elmList23[i];
  return [
    // From ElmTextTwentyThree
    // pageEighteen
    TextSpan(text: elm.title, style: title),
    TextSpan(text: elm.text),
    TextSpan(text: elm.subtitle, style: subtitle),
    TextSpan(text: elm.text2),
  ];
}
