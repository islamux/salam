import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i, List<ElmModelNew> elmList) {
  TextStyle footerStyle = AppTheme.customTextStyleFooter();

  ElmModelNew elm = elmList[i];

  return [
    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
    // footer
    if (elm.footer != null && elm.footer!.isNotEmpty)
      TextSpan(text: elm.footer!, style: footerStyle),
  ];
}

// List<TextSpan> getPageEightTexts(int i, List<ElmModelNew> elmList) {
//   TextStyle footer = AppTheme.customTextStyleFooter();
//   return [
//     TextSpan(text: elmList17[i].text),
//     TextSpan(text: elmList17[i].footer, style: footer),
//   ];
// }