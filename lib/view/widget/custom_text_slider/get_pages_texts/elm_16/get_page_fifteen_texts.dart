import 'package:elm/core/data/model/elm_lists/elm_list_16.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:elm/view/widget/custom_text_span.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFifteenTexts(int i) {
  // refactor : customTextSpan()
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  ElmModel elm = elmList16[i];
  return [
    customTextSpan(elm.subtitle, subtitle),
    customTextSpan(elm.ayah, ayah),
    customTextSpan(elm.text, null),
  ];
}
