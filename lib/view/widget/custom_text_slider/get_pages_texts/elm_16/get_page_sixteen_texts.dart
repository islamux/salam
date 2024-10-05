import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixteenTexts(int i) {
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  ElmModel elm = elmList16[i];
  return [
    TextSpan(text: elm.subtitle, style: subtitleStyle),
    TextSpan(text: elm.text),
  ];
}
