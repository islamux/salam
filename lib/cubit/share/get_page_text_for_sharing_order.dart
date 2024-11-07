import 'package:flutter/material.dart';
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';

List<Text> getPageTextsForSharing(
    int pageIndex, List<ElmModelNewOrder> elmList) {
  final elm = elmList[pageIndex];
  final List<Text> sharedTexts = [];

  int titleIndex = 0;
  int subtitleIndex = 0;
  int textIndex = 0;
  int ayahIndex = 0;

  // توليد النصوص على شكل عناصر Text وفق ترتيب order
  for (var orderItem in elm.order) {
    switch (orderItem) {
      case EnOrder.titles:
        if (elm.titles != null && titleIndex < elm.titles!.length) {
          sharedTexts.add(Text(elm.titles![titleIndex]));
          titleIndex++;
        }
        break;

      case EnOrder.subtitles:
        if (elm.subtitles != null && subtitleIndex < elm.subtitles!.length) {
          sharedTexts.add(Text(elm.subtitles![subtitleIndex]));
          subtitleIndex++;
        }
        break;

      case EnOrder.texts:
        if (elm.texts != null && textIndex < elm.texts!.length) {
          sharedTexts.add(Text(elm.texts![textIndex]));
          textIndex++;
        }
        break;

      case EnOrder.ayahs:
        if (elm.ayahs != null && ayahIndex < elm.ayahs!.length) {
          sharedTexts.add(Text(elm.ayahs![ayahIndex]));
          ayahIndex++;
        }
        break;

      case EnOrder.footer:
        if (elm.footer != null) {
          sharedTexts.add(Text(elm.footer!));
        }
        break;
    }
  }

  return sharedTexts;
}

// import 'package:elm/core/data/model/elm_model_new_order.dart';
// import 'package:elm/core/data/model/enum_order.dart';

// String getPageTextsForSharing(int pageIndex, List<ElmModelNewOrder> elmList) {
//   final elm = elmList[pageIndex];
//   final StringBuffer sharedText = StringBuffer();

//   int titleIndex = 0;
//   int subtitleIndex = 0;
//   int textIndex = 0;
//   int ayahIndex = 0;

//   // توليد النص حسب ترتيب order بدون تكرار
//   for (var orderItem in elm.order) {
//     switch (orderItem) {
//       case EnOrder.titles:
//         if (elm.titles != null && titleIndex < elm.titles!.length) {
//           sharedText.writeln(elm.titles![titleIndex]);
//           titleIndex++;
//         }
//         break;

//       case EnOrder.subtitles:
//         if (elm.subtitles != null && subtitleIndex < elm.subtitles!.length) {
//           sharedText.writeln(elm.subtitles![subtitleIndex]);
//           subtitleIndex++;
//         }
//         break;

//       case EnOrder.texts:
//         if (elm.texts != null && textIndex < elm.texts!.length) {
//           sharedText.writeln(elm.texts![textIndex]);
//           textIndex++;
//         }
//         break;

//       case EnOrder.ayahs:
//         if (elm.ayahs != null && ayahIndex < elm.ayahs!.length) {
//           sharedText.writeln(elm.ayahs![ayahIndex]);
//           ayahIndex++;
//         }
//         break;

//       case EnOrder.footer:
//         if (elm.footer != null) {
//           sharedText.writeln(elm.footer);
//         }
//         break;
//     }
//   }

//   return sharedText.toString();
// }

// import 'package:elm/core/data/model/elm_model_new_order.dart';
// import 'package:elm/core/data/model/enum_order.dart';
// import 'package:flutter/material.dart';
// import 'package:elm/core/data/static/theme/app_them.dart';

// List<TextSpan> getPageTexts(int pageIndex, List<ElmModelNewOrder> elmList) {
//   final elm = elmList[pageIndex];
//   final List<TextSpan> spans = [];

//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   TextStyle footerStyle = AppTheme.customTextStyleFooter();

//   int titleIndex = 0;
//   int subtitleIndex = 0;
//   int textIndex = 0;
//   int ayahIndex = 0;

//   // تكرار العناصر حسب الترتيب الموجود في order مع التأكد من عدم تكرارها
//   for (var orderItem in elm.order) {
//     switch (orderItem) {
//       case EnOrder.titles:
//         if (elm.titles != null && titleIndex < elm.titles!.length) {
//           spans.add(TextSpan(text: elm.titles![titleIndex], style: titleStyle));
//           titleIndex++;
//         }
//         break;

//       case EnOrder.subtitles:
//         if (elm.subtitles != null && subtitleIndex < elm.subtitles!.length) {
//           spans.add(TextSpan(
//               text: elm.subtitles![subtitleIndex], style: subtitleStyle));
//           subtitleIndex++;
//         }
//         break;

//       case EnOrder.texts:
//         if (elm.texts != null && textIndex < elm.texts!.length) {
//           spans.add(TextSpan(text: elm.texts![textIndex], style: null));
//           textIndex++;
//         }
//         break;

//       case EnOrder.ayahs:
//         if (elm.ayahs != null && ayahIndex < elm.ayahs!.length) {
//           spans.add(TextSpan(text: elm.ayahs![ayahIndex], style: ayahStyle));
//           ayahIndex++;
//         }
//         break;

//       case EnOrder.footer:
//         if (elm.footer != null) {
//           spans.add(TextSpan(text: elm.footer, style: footerStyle));
//         }
//         break;
//     }
//   }

//   return spans;
// }


// import 'package:elm/core/data/model/elm_model_new_order.dart';
// import 'package:elm/core/data/model/enum_order.dart';
// import 'package:flutter/material.dart';
// import 'package:elm/core/data/static/theme/app_them.dart';

// List<TextSpan> getPageTexts(int pageIndex, List<ElmModelNewOrder> elmList) {
//   final elm = elmList[pageIndex];
//   final List<TextSpan> spans = [];
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   TextStyle footerStyle = AppTheme.customTextStyleFooter();
// //  TextStyle defaultStyle = AppTheme.defaultTextStyle();

//   // تكرار العناصر حسب الترتيب الموجود في order
//   for (var orderItem in elm.order) {
//     switch (orderItem) {
//       case EnOrder.titles:
//         if (elm.titles != null) {
//           for (var title in elm.titles!) {
//             spans.add(TextSpan(text: title, style: titleStyle));
//           }
//         }
//         break;
//       case EnOrder.subtitles:
//         if (elm.subtitles != null) {
//           for (var subtitle in elm.subtitles!) {
//             spans.add(TextSpan(text: subtitle, style: subtitleStyle));
//           }
//         }
//         break;
//       case EnOrder.texts:
//         if (elm.texts != null) {
//           for (var text in elm.texts!) {
//             spans.add(TextSpan(text: text, style: null));
//           }
//         }
//         break;
//       case EnOrder.ayahs:
//         if (elm.ayahs != null) {
//           for (var ayah in elm.ayahs!) {
//             spans.add(TextSpan(text: ayah, style: ayahStyle));
//           }
//         }
//         break;
//       case EnOrder.footer:
//         if (elm.footer != null) {
//           spans.add(TextSpan(text: elm.footer, style: footerStyle));
//         }
//         break;
//     }
//   }
//   return spans;
// }

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
