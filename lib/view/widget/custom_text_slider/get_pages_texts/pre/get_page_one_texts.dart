import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(
      text: elmListPre[i].titlePreOne,
      style: AppTheme.customTextStyleTitle(),
    ),
    TextSpan(
        text: elmListPre[i].ayahHadithPreOne,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmListPre[i].elmTextPreOne)
  ];
}
