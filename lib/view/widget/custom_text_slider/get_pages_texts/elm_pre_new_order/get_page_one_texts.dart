// import 'package:elm/core/data/model/elm_model_new_order.dart';
// import 'package:elm/core/data/static/theme/app_them.dart';
// import 'package:flutter/material.dart';

// List<TextSpan> getPageTexts(int i, List<ElmModelNewOrder> elmList) {
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();

//   ElmModelNewOrder elm = elmList[i];
//   List<TextSpan> textSpans = [];
//   List<String> orderList = elm.order!.split(',');

//   int ayahIndex = 0;
//   int textIndex = 0;
//   int titleIndex = 0;
//   int subtitleIndex = 0;

//   // تحقق من وجود القيم المطلوبة وإضافتها حسب ترتيب order
//   for (var item in orderList) {
//     item = item.trim();

//     switch (item) {
//       case 'titles':
//         if (titleIndex < (elm.titles?.length ?? 0)) {
//           textSpans
//               .add(TextSpan(text: elm.titles![titleIndex], style: titleStyle));
//           titleIndex++;
//         } else {
//           print(
//               'خطأ: لا يوجد نص كافٍ في titles للصفحة $i. العدد المتاح: ${elm.titles?.length ?? 0}');
//         }
//         break;

//       case 'subtitles':
//         if (subtitleIndex < (elm.subtitles?.length ?? 0)) {
//           textSpans.add(TextSpan(
//               text: elm.subtitles![subtitleIndex], style: subtitleStyle));
//           subtitleIndex++;
//         } else {
//           print(
//               'خطأ: لا يوجد نص كافٍ في subtitles للصفحة $i. العدد المتاح: ${elm.subtitles?.length ?? 0}');
//         }
//         break;

//       case 'texts':
//         if (textIndex < (elm.texts?.length ?? 0)) {
//           textSpans.add(TextSpan(text: elm.texts![textIndex], style: null));
//           textIndex++;
//         } else {
//           print(
//               'خطأ: لا يوجد نص كافٍ في texts للصفحة $i. العدد المتاح: ${elm.texts?.length ?? 0}');
//         }
//         break;

//       case 'ayahs':
//         if (ayahIndex < (elm.ayahs?.length ?? 0)) {
//           textSpans
//               .add(TextSpan(text: elm.ayahs![ayahIndex], style: ayahStyle));
//           ayahIndex++;
//         } else {
//           print(
//               'خطأ: لا يوجد نص كافٍ في ayahs للصفحة $i. العدد المتاح: ${elm.ayahs?.length ?? 0}');
//         }
//         break;

//       case 'footer':
//         if (elm.footer != null && elm.footer!.isNotEmpty) {
//           textSpans.add(TextSpan(text: elm.footer, style: null));
//         } else {
//           print('تحذير: لا يوجد نص في footer للصفحة $i');
//         }
//         break;

//       default:
//         print('تحذير: عنصر غير معروف في order للصفحة $i: $item');
//     }
//   }

//   // التحقق من نجاح إضافة النصوص إلى textSpans
//   if (textSpans.isEmpty) {
//     print(
//         'خطأ: لم تتم إضافة أي نصوص للصفحة $i. تحقق من ترتيب order والبيانات.');
//   } else {
//     print('نجاح: تمت إضافة ${textSpans.length} عنصر في textSpans للصفحة $i.');
//   }

//   return textSpans;
// }

// import 'package:elm/core/data/model/elm_model_new.dart';
// import 'package:elm/core/data/static/theme/app_them.dart';
// import 'package:flutter/material.dart';

// List<TextSpan> getPageOneTexts(int i, List<ElmModelNew> elmList) {
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   ElmModelNew elm = elmList[i];
//   return [
//     TextSpan(text: elm.titles![0], style: titleStyle),
//     TextSpan(text: elm.ayahs![0], style: ayahStyle),
//     TextSpan(text: elm.texts![0]),
//   ];
// }
