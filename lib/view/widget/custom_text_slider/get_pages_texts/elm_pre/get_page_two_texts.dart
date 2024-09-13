import 'package:elm/core/data/model/elm_lists/elm_list_pre.dart';
import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTwoTexts(int i) {
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  ElmModelNew elm = elmListPre[i];

  // // تأكد من أن القوائم تحتوي على 3 عناصر على الأقل، عن طريق ملء القوائم بعناصر فارغة إذا لزم الأمر
  // List<String> ayahs = List.from(elm.ayahs as Iterable)
  //   ..addAll(List.filled(3 - elm.ayahs!.length, ''));

  // List<String> texts = List.from(elm.texts as Iterable)
  //   ..addAll(List.filled(3 - elm.texts!.length, ''));

  return [
    TextSpan(text: elm.title, style: title),
    TextSpan(text: elm.subtitles![0], style: subtitle),
    TextSpan(text: elm.texts![0]),
  ];
}
