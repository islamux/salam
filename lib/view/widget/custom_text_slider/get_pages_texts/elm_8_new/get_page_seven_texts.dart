import 'package:elm/core/data/model/elm_lists/elm_list_8.dart';
import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i, List<ElmModelNew> elmList) {
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

// List<TextSpan> getPageSevenTexts(int i) {
//   TextStyle footer = AppTheme.customTextStyleFooter();
//   return [
//     TextSpan(text: elmList8[i].text),
//     TextSpan(text: elmList8[i].footer, style: footer),
//   ];
// }
