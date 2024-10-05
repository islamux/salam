import 'package:elm/core/data/model/elm_lists/elm_list_22.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourTexts(int i) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  ElmModel elm = elmList22[i];
  return [
    // Form ElmTextTwentyTow{} // page 4
    TextSpan(text: elm.title, style: titleStyle),
    TextSpan(text: elm.ayah, style: ayahStyle),
    TextSpan(text: elm.text),
    TextSpan(text: elm.ayah2, style: ayahStyle),
    TextSpan(text: elm.text2),
  ];
}
