import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_3.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  return [
    TextSpan(text: elmList3[i].ayah, style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList3[i].text),
    TextSpan(text: elmList3[i].text2),
  ];
}
