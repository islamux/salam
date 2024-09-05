import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList16[i].subtitle, style: subtitle),
    TextSpan(text: elmList16[i].ayah, style: ayah),
    TextSpan(text: elmList16[i].text),
    TextSpan(text: elmList16[i].subtitle2, style: subtitle),
    TextSpan(text: elmList16[i].text2),
    TextSpan(text: elmList16[i].ayah2, style: ayah),
    TextSpan(text: elmList16[i].subtitle3, style: subtitle),
    TextSpan(text: elmList16[i].text3),
    TextSpan(text: elmList16[i].ayah3, style: ayah),
    TextSpan(text: elmList16[i].text4),
    TextSpan(text: elmList16[i].ayah4, style: ayah),
    TextSpan(text: elmList16[i].text5),
    TextSpan(text: elmList16[i].ayah5, style: ayah),
    TextSpan(text: elmList16[i].text6),
    TextSpan(text: elmList16[i].subtitle4, style: subtitle),
    TextSpan(text: elmList16[i].ayah6, style: ayah),
    TextSpan(text: elmList16[i].subtitle5, style: subtitle),
    TextSpan(text: elmList16[i].subtitle6),
    TextSpan(text: elmList16[i].ayah7, style: ayah),
    TextSpan(text: elmList16[i].text7),
    TextSpan(text: elmList16[i].footer, style: footer)
  ];
}
