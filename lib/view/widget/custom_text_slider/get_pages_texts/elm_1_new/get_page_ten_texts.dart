import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle footerStyle = AppTheme.customTextStyleFooter();

  ElmModelNew elm = elmList[i]; // استخدم  بناءً على السياق
  return [
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null), // النص الأول

    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle), // الآية الأولى

    if (elm.footer != null && elm.footer!.isNotEmpty) // footer
      TextSpan(text: elm.footer, style: footerStyle),
  ];
}

// List<TextSpan> getPageTenTexts(int i) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   TextStyle footer = AppTheme.customTextStyleFooter();

//   return [
//     TextSpan(text: elmList[i].text),
//     TextSpan(text: elmList[i].ayah, style: ayah),
//     TextSpan(text: elmList[i].footer, style: footer),
//   ];
// }
