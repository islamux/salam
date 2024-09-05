import 'package:elm/core/data/model/elm_lists/elm_list_14.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  TextStyle ayah = AppTheme.customTextStyleHadith();
  return [
    TextSpan(text: elmList14[i].ayah, style: ayah),
    TextSpan(text: elmList14[i].ayah2, style: ayah),
    TextSpan(text: elmList14[i].subtitle, style: subtitle),
    TextSpan(text: elmList14[i].text),
    TextSpan(text: elmList14[i].ayah3, style: ayah),
  ];
}
