import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFourteenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle footerStyle = AppTheme.customTextStyleFooter(); // نمط الخاتمة

  ElmModelNew elm = elmList[i]; // استخدم elmListPreNew بناءً على السياق الجديد

  return [
    // if (elm.texts != null && elm.texts!.isNotEmpty)
    TextSpan(text: elm.texts![0]), // النص الأول

    // if (elm.texts != null && elm.texts!.length > 1)
    TextSpan(text: elm.texts![1]), // النص الثاني

    // if (elm.footer != null)
    TextSpan(text: elm.footer!, style: footerStyle), // الخاتمة
  ];
}
