import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle footerStyle = AppTheme.customTextStyleFooter();

  ElmModelNew elm = elmList[i]; // استخدم elmListPreNew بناءً على السياق
  return [
    // ayah 1
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle),
    // footer
    if (elm.footer != null && elm.footer!.isNotEmpty)
      TextSpan(text: elm.footer, style: footerStyle),
  ];
}
