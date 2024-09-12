import 'package:elm/core/data/model/elm_lists/elm_list_pre.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  ElmModel elmPre = elmListPre[i];
  return [
    TextSpan(text: elmPre.ayah, style: ayahStyle),
    TextSpan(text: elmPre.text),
    TextSpan(text: elmPre.ayah2, style: ayahStyle),
    TextSpan(text: elmPre.text2),
    TextSpan(text: elmPre.ayah3, style: ayahStyle),
    TextSpan(text: elmPre.text3),
  ];
}
