import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i, List<ElmModelNew> elmList) {
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  ElmModelNew elm = elmList[i];
  return [
    TextSpan(text: elm.titles![0], style: titleStyle),
    TextSpan(text: elm.ayahs![0], style: ayahStyle),
    TextSpan(text: elm.texts![0]),
  ];
}

// List<TextSpan> getPageOneTexts(int i) {
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   ElmModelNew elm = elmListPreNew[i];

//   List<TextSpan> textSpans = [];

//   // تحقق من وجود العنوان
//   if (elm.titles != null && elm.titles!.isNotEmpty) {
//     textSpans.add(TextSpan(text: elm.titles![0], style: titleStyle));
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

//   return textSpans;
// }

