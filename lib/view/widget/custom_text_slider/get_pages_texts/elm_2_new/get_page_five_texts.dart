import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i, List<ElmModelNew> elmList) {
  ElmModelNew elm = elmList[i];
  TextStyle footerStyle = AppTheme.customTextStyleFooter();
  return [
    // text 0
    //if (elm.texts != null && elm.texts!.isNotEmpty)
    TextSpan(text: elm.texts![0], style: null),

    // footer
    //if (elm.footer != null && elm.footer!.isNotEmpty)
    TextSpan(text: elm.footer!, style: footerStyle),
  ];
}
