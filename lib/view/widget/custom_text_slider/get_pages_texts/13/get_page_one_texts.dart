import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_13.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    TextSpan(text: elmList13[i].title, style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList13[i].ayah, style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].text),
    TextSpan(text: elmList13[i].ayah2, style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].text2),
    TextSpan(text: elmList13[i].ayah3, style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList13[i].text3),
    TextSpan(
        text: elmList13[i].footer, style: AppTheme.customTextStyleFooter()),
  ];
}
