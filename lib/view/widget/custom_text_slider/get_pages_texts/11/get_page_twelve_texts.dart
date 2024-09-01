import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwelveTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  return [
    TextSpan(text: elmList11[i].titleElevenTweleve_1, style: title),
    TextSpan(text: elmList11[i].elmTextElevenTwelve_1),
  ];
}
