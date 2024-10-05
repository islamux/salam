import 'package:elm/core/data/model/elm_lists/elm_list_22.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle footerStyle = AppTheme.customTextStyleFooter();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  ElmModel elm = elmList22[i];
  return [
    // Form ElmTextTwentyTwo{} // page 1
    TextSpan(text: elm.text),
    TextSpan(text: elm.ayah, style: ayahStyle),
    TextSpan(text: elm.text2),
  ];
}
