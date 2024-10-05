import 'package:elm/core/data/model/elm_lists/elm_list_8.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:elm/view/widget/custom_text_span.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  ElmModel elm = elmList8[i];
  return [
    customTextSpan(elm.title, titleStyle),
    customTextSpan(elm.subtitle, subtitleStyle),
    customTextSpan(elm.ayah, ayahStyle),
    customTextSpan(elm.text, null),
    customTextSpan(elm.ayah2, ayahStyle),
    customTextSpan(elm.subtitle, subtitleStyle),
    customTextSpan(elm.text2, null),
  ];
}
