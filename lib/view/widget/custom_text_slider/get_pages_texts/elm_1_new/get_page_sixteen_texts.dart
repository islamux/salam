import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixteenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle footerStyle = AppTheme.customTextStyleFooter();

  ElmModelNew elm = elmList[i]; // استخدم elmListPreNew بناءً على السياق

  return [
    // تحقق من وجود النصوص
    //if (elm.texts != null && elm.texts!.isNotEmpty)
    TextSpan(text: elm.texts![0], style: null),

    // تحقق من وجود الخاتمة
    //if (elm.footer != null && elm.footer!.isNotEmpty)
    TextSpan(text: elm.footer, style: footerStyle),
  ];
}
