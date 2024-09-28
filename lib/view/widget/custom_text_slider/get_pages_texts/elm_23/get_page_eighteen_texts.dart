import 'package:elm/core/data/model/elm_lists/elm_list_23.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

import '../../../custom_text_span.dart';

List<TextSpan> getPageEighteenTexts(int i) {
  TextStyle subtitle = AppTheme.customTextStyleSubtitle();
  TextStyle title = AppTheme.customTextStyleTitle();
  ElmModel elm = elmList23[i];
  return [
    // From ElmTextTwentyThree
    // pageEighteen
    customTextSpan(elm.title, title),
    customTextSpan(elm.text, null),
    customTextSpan(elm.subtitle, subtitle),
    customTextSpan(elm.text2, null),

    // to remove
    // TextSpan(text: elm.title, style: title),
    // TextSpan(text: elm.text),
    // TextSpan(text: elm.subtitle, style: subtitle),
    // TextSpan(text: elm.text2),
  ];
}
