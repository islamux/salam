import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  ElmModelNew elm = elmList[i];
  return [
    TextSpan(text: elm.texts![0]),
    TextSpan(text: elm.ayahs![0], style: ayah),
    TextSpan(text: elm.texts![1]),
  ];
}

// List<TextSpan> getPageEightTexts(int i) {
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle footerStyle = AppTheme.customTextStyleFooter();

//   ElmModelNew elm = elmList1New[i]; // استخدم elmListPreNew بناءً على السياق

//   List<TextSpan> textSpans = [];

//   // تحقق من وجود العنوان
//   if (elm.titles != null && elm.titles!.isNotEmpty) {
//     textSpans.add(TextSpan(text: elm.titles![0], style: titleStyle));
//   }

//   // تحقق من وجود العنوان الفرعي
//   if (elm.subtitles != null && elm.subtitles!.isNotEmpty) {
//     textSpans.add(TextSpan(text: elm.subtitles![0], style: subtitleStyle));
//   }

//   // تحقق من وجود الآيات
//   if (elm.ayahs != null && elm.ayahs!.isNotEmpty) {
//     for (String ayah in elm.ayahs!) {
//       textSpans.add(TextSpan(text: ayah, style: ayahStyle));
//     }
//   }

//   // تحقق من وجود النصوص
//   if (elm.texts != null && elm.texts!.isNotEmpty) {
//     for (String text in elm.texts!) {
//       textSpans.add(TextSpan(text: text));
//     }
//   }

//   // تحقق من وجود الخاتمة
//   if (elm.footer != null && elm.footer!.isNotEmpty) {
//     textSpans.add(TextSpan(text: elm.footer, style: footerStyle));
//   }

//   return textSpans;
// }



