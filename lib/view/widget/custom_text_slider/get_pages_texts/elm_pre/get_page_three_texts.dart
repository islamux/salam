import 'package:elm/core/data/model/elm_lists/elm_list_pre.dart';
import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
// to get the elments
  ElmModelNew elm = elmListPre[i];
  // // تأكد من أن القوائم تحتوي على 3 عناصر على الأقل، عن طريق ملء القوائم بعناصر فارغة إذا لزم الأمر
  // List<String> ayahs = List.from(elm.ayahs as Iterable)
  //   ..addAll(List.filled((3 - elm.ayahs!.length), ''));

  // List<String> texts = List.from(elm.texts as Iterable)
  //   ..addAll(List.filled((3 - elm.texts!.length), ''));

  return [
    TextSpan(text: elm.ayahs![0], style: ayah),
    TextSpan(text: elm.texts![0]),
    TextSpan(text: elm.ayahs![1], style: ayah),
    TextSpan(text: elm.texts![1]),
    TextSpan(text: elm.ayahs![2], style: ayah),
    TextSpan(text: elm.texts![2]),
  ];
}





// List<TextSpan> getPageThreeTexts(int i) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   return [
//     TextSpan(text: elmListPre[i].ayah, style: ayah),
//     TextSpan(text: elmListPre[i].text),
//     TextSpan(text: elmListPre[i].ayah2, style: ayah),
//     TextSpan(text: elmListPre[i].text2),
//     TextSpan(text: elmListPre[i].ayah3, style: ayah),
//     TextSpan(text: elmListPre[i].text3),
//   ];
// }
