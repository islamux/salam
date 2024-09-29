import 'package:elm/core/data/model/elm_lists/elm_list_10.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:elm/view/widget/custom_text_span.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  ElmModel elm = elmList10[i];
  return [
    customTextSpan(elm.ayah, ayahStyle),
    customTextSpan(elm.text, null),
    customTextSpan(elm.ayah2, ayahStyle),
  ];
}
