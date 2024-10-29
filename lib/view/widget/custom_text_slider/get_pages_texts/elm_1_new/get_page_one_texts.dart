import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i, List<ElmModelNew> elmList) {
  TextStyle titleStyle = AppTheme.customTextStyleTitle(); // نمط العنوان

  ElmModelNew elm = elmList[i]; // استخدم elmListPreNew بناءً على السياق الجديد

  return [
    //   if (elm.titles != null && elm.titles!.isNotEmpty)
    TextSpan(text: elm.titles![0], style: titleStyle), // العنوان

//    if (elm.texts != null && elm.texts!.isNotEmpty)
    TextSpan(text: elm.texts![0]), // النص الأول

//    if (elm.texts != null && elm.texts!.length > 1)
    TextSpan(text: elm.texts![1]), // النص الثاني

//    if (elm.texts != null && elm.texts!.length > 2)
    TextSpan(text: elm.texts![2]), // النص الثالث
  ];
}
