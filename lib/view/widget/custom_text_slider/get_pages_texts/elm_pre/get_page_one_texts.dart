import 'package:elm/core/data/model/elm_lists/elm_list_pre.dart';
import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

// responsible of make text , ayah in its correct place in the page, which one is frist whict next
List<TextSpan> getPageOneTexts(int i) {
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  ElmModelNew elm = elmListPre[i];
  // تأكد من أن القوائم تحتوي على 3 عناصر على الأقل، عن طريق ملء القوائم بعناصر فارغة إذا لزم الأمر
  // List<String> ayahs = List.from(elm.ayahs as Iterable)
  //   ..addAll(List.filled(3 - elm.ayahs!.length, ''));

  // List<String> texts = List.from(elm.texts as Iterable)
  //   ..addAll(List.filled(3 - elm.texts!.length, ''));

  return [
    TextSpan(text: elm.title, style: titleStyle),
    TextSpan(text: elm.ayahs![0], style: ayahStyle),
    TextSpan(text: elm.texts![0]),
  ];
}
