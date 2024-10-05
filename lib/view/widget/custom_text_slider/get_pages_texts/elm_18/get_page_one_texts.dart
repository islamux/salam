import 'package:elm/core/data/model/elm_lists/elm_list_18.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  ElmModel elm = elmList18[i];
  return [
    TextSpan(text: elm.title, style: titleStyle),
    TextSpan(text: elm.text),
  ];
}
