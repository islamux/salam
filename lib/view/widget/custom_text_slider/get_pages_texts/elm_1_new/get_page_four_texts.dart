import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith(); // نمط الآيات

  ElmModelNew elm = elmList[i]; // استخدم elmListPreNew بناءً على السياق الجديد

  return [
    // if (elm.texts != null && elm.texts!.isNotEmpty) // النص الأول
      TextSpan(text: elm.texts![0]),
    // if (elm.texts != null && elm.texts!.length > 1) // النص الثاني
      TextSpan(text: elm.texts![1]),
    // if (elm.ayahs != null && elm.ayahs!.isNotEmpty) // الآية الأولى
      TextSpan(text: elm.ayahs![0], style: ayahStyle),
  ];
}
