import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle footerStyle = AppTheme.customTextStyleFooter();

  ElmModelNew elm = elmList[i]; // استخدم  بناءً على السياق

  return [
    // تحقق من وجود النصوص
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),

    // تحقق من وجود الآيات
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle),

    // تحقق من وجود الخاتمة
    if (elm.footer != null && elm.footer!.isNotEmpty)
      TextSpan(text: elm.footer, style: footerStyle),
  ];
}
// List<TextSpan> getPageEightTexts(int i) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   TextStyle footer = AppTheme.customTextStyleFooter();
//   return [
//     TextSpan(text: elmList2[i].text),
//     TextSpan(text: elmList2[i].ayah, style: ayah),
//     TextSpan(text: elmList2[i].footer, style: footer),
//   ];
// }