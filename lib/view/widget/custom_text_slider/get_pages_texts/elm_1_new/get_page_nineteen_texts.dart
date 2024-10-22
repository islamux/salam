import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineteenTexts(int i, List<ElmModelNew> elmList) {
  ElmModelNew elm = elmList[i]; // استخدم elmListPreNew بناءً على السياق الجديد

  return [
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0]), // النص الأول
  ];
}
