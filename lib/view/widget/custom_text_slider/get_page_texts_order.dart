import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTexts(int pageIndex, List<KhatiraModelNewOrder> khatiraList) {
  final khatiraModel = khatiraList[pageIndex];
  final List<TextSpan> spans = [];
  // AppTheme Appthem = AppTheme();

  int titleIndex = 0;
  int subtitleIndex = 0;
  int textIndex = 0;
  int ayahIndex = 0;

  // تكرار العناصر حسب الترتيب المطلوب في order مع التشكيل من عدم تكرارها
  for (var orderItem in khatiraModel.order) {
    switch (orderItem) {
      case EnOrder.titles:
        if (khatiraModel.titles != null && titleIndex < khatiraModel.titles!.length) {
          spans.add(TextSpan(
              text: khatiraModel.titles![titleIndex],
              style: AppTheme.customTextStyleTitle));
          titleIndex++;
        }
        break;

      case EnOrder.subtitles:
        if (khatiraModel.subtitles != null && subtitleIndex < khatiraModel.subtitles!.length) {
          spans.add(TextSpan(
              text: khatiraModel.subtitles![subtitleIndex],
              style: AppTheme.customTextStyleSubtitle));
          subtitleIndex++;
        }
        break;

      case EnOrder.texts:
        if (khatiraModel.texts != null && textIndex < khatiraModel.texts!.length) {
          spans.add(TextSpan(text: khatiraModel.texts![textIndex], style: null));
          textIndex++;
        }
        break;

      case EnOrder.ayahs:
        if (khatiraModel.ayahs != null && ayahIndex < khatiraModel.ayahs!.length) {
          spans.add(TextSpan(
              text: khatiraModel.ayahs![ayahIndex],
              style: AppTheme.customTextStyleHadith));
          ayahIndex++;
        }
        break;

      case EnOrder.footer:
        if (khatiraModel.footer != null) {
          spans.add(TextSpan(
              text: khatiraModel.footer, style: AppTheme.customTextStyleFooter));
        }
        break;
    }
  }

  return spans;
}

// import 'package:khatir/core/data/model/khatira_model_new_order.dart';
// import 'package:khatir/core/data/model/enum_order.dart';
// import 'package:flutter/material.dart';
// import 'package:khatir/core/data/static/theme/app_them.dart';

// List<TextSpan> getPageTexts(int pageIndex, List<KhatiraModelNewOrder> khatiraList) {
//   final khatiraModel = khatiraList[pageIndex];
//   final List<TextSpan> spans = [];
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   TextStyle footerStyle = AppTheme.customTextStyleFooter();
// //  TextStyle defaultStyle = AppTheme.defaultTextStyle();

//   // تكرار العناصر حسب الترتيب الموجود في order
//   for (var orderItem in khatiraModel.order) {
//     switch (orderItem) {
//       case EnOrder.titles:
//         if (khatiraModel.titles != null) {
//           for (var title in khatiraModel.titles!) {
//             spans.add(TextSpan(text: title, style: titleStyle));
//           }
//         }
//         break;
//       case EnOrder.subtitles:
//         if (khatiraModel.subtitles != null) {
//           for (var subtitle in khatiraModel.subtitles!) {
//             spans.add(TextSpan(text: subtitle, style: subtitleStyle));
//           }
//         }
//         break;
//       case EnOrder.texts:
//         if (khatiraModel.texts != null) {
//           for (var text in khatiraModel.texts!) {
//             spans.add(TextSpan(text: text, style: null));
//           }
//         }
//         break;
//       case EnOrder.ayahs:
//         if (khatiraModel.ayahs != null) {
//           for (var ayah in khatiraModel.ayahs!) {
//             spans.add(TextSpan(text: ayah, style: ayahStyle));
//           }
//         }
//         break;
//       case EnOrder.footer:
//         if (khatiraModel.footer != null) {
//           spans.add(TextSpan(text: khatiraModel.footer, style: footerStyle));
//         }
//         break;
//     }
//   }
//   return spans;
// }

// import 'package:khatir/core/data/model/khatira_model_new_order.dart';
// import 'package:khatir/core/data/static/theme/app_them.dart';
// import 'package:flutter/material.dart';

// List<TextSpan> getPageTexts(int i, List<KhatiraModelNewOrder> khatiraList) {
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();

//   KhatiraModelNewOrder elm = khatiraList[i];
//   List<TextSpan> textSpans = [];
//   List<String> orderList = khatiraModel.order!.split(',');

//   int ayahIndex = 0;
//   int textIndex = 0;
//   int titleIndex = 0;
//   int subtitleIndex = 0;

//   // تحقق من وجود القيم المطلوبة وإضافتها حسب ترتيب order
//   for (var item in orderList) {
//     item = item.trim();

//     switch (item) {
//       case 'titles':
//         if (titleIndex < (khatiraModel.titles?.length ?? 0)) {
//           textSpans
//               .add(TextSpan(text: khatiraModel.titles![titleIndex], style: titleStyle));
//           titleIndex++;
//         } else {
//           print(
//               'خطأ: لا يوجد نص كافٍ في titles للصفحة $i. العدد المتاح: ${khatiraModel.titles?.length ?? 0}');
//         }
//         break;

//       case 'subtitles':
//         if (subtitleIndex < (khatiraModel.subtitles?.length ?? 0)) {
//           textSpans.add(TextSpan(
//               text: khatiraModel.subtitles![subtitleIndex], style: subtitleStyle));
//           subtitleIndex++;
//         } else {
//           print(
//               'خطأ: لا يوجد نص كافٍ في subtitles للصفحة $i. العدد المتاح: ${khatiraModel.subtitles?.length ?? 0}');
//         }
//         break;

//       case 'texts':
//         if (textIndex < (khatiraModel.texts?.length ?? 0)) {
//           textSpans.add(TextSpan(text: khatiraModel.texts![textIndex], style: null));
//           textIndex++;
//         } else {
//           print(
//               'خطأ: لا يوجد نص كافٍ في texts للصفحة $i. العدد المتاح: ${khatiraModel.texts?.length ?? 0}');
//         }
//         break;

//       case 'ayahs':
//         if (ayahIndex < (khatiraModel.ayahs?.length ?? 0)) {
//           textSpans
//               .add(TextSpan(text: khatiraModel.ayahs![ayahIndex], style: ayahStyle));
//           ayahIndex++;
//         } else {
//           print(
//               'خطأ: لا يوجد نص كافٍ في ayahs للصفحة $i. العدد المتاح: ${khatiraModel.ayahs?.length ?? 0}');
//         }
//         break;

//       case 'footer':
//         if (khatiraModel.footer != null && khatiraModel.footer!.isNotEmpty) {
//           textSpans.add(TextSpan(text: khatiraModel.footer, style: null));
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

// import 'package:khatir/core/data/model/elm_model_new.dart';
// import 'package:khatir/core/data/static/theme/app_them.dart';
// import 'package:flutter/material.dart';

// List<TextSpan> getPageOneTexts(int i, List<KhatiraModelNew> khatiraList) {
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   KhatiraModelNew elm = khatiraList[i];
//   return [
//     TextSpan(text: khatiraModel.titles![0], style: titleStyle),
//     TextSpan(text: khatiraModel.ayahs![0], style: ayahStyle),
//     TextSpan(text: khatiraModel.texts![0]),
//   ];
// }
