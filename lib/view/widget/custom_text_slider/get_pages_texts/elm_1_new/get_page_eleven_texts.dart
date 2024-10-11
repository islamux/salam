import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

import '../../../../../core/data/model/elm_model_new.dart';

List<TextSpan> getPageElevenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith(); // نمط الآيات

  ElmModelNew elm = elmList[i]; // استخدم elmListPreNew بناءً على السياق الجديد

  return [
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null), // النص الأول
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle), // الآية الأولى
  ];
}
