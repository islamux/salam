import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  ElmModelNew elm = elmList[i];
  return [
    // these orederd by ElmTextDersPre
    TextSpan(text: elm.ayahs![0], style: ayahStyle),
    TextSpan(text: elm.texts![0]),
    TextSpan(text: elm.ayahs![1], style: ayahStyle),
    TextSpan(text: elm.texts![1]),
    TextSpan(text: elm.ayahs![2], style: ayahStyle),
    TextSpan(text: elm.texts![2]),
  ];
}


// List<TextSpan> getPageThreeTexts(int i) {
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   ElmModelNew elmPre = elmListPreNew[i];

//   List<TextSpan> textSpans = [];

//   // تحقق من وجود العنوان
//   if (elmPre.titles != null && elmPre.titles!.isNotEmpty) {
//     textSpans.add(TextSpan(
//         text: elmPre.titles![0],
//         style: ayahStyle)); // يمكنك تخصيص style هنا إذا أردت
//   }

//   // تحقق من وجود النص الفرعي
//   if (elmPre.subtitles != null && elmPre.subtitles!.isNotEmpty) {
//     textSpans.add(TextSpan(
//         text: elmPre.subtitles![0],
//         style: ayahStyle)); // تخصيص الـ style للنص الفرعي إذا أردت
//   }

//   // أضف الآيات والنصوص
//   if (elmPre.ayahs != null && elmPre.texts != null) {
//     for (int j = 0; j < elmPre.ayahs!.length; j++) {
//       // إضافة الآية
//       textSpans.add(TextSpan(text: elmPre.ayahs![j], style: ayahStyle));
//       // تحقق من وجود النص المقابل للآية
//       if (j < elmPre.texts!.length) {
//         textSpans.add(TextSpan(text: elmPre.texts![j]));
//       }
//     }
//   }

//   return textSpans;
// }


