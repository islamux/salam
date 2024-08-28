import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSeventeenTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();

  return [
    TextSpan(text: elmList12[i].titleTwelveSeventeen, style: title),
  ];
}
