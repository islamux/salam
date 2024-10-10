import 'package:elm/core/data/model/elm_lists/elm_list_23.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

import '../../../custom_text_span.dart';

List<TextSpan> getPageEighteenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle footerStyle = AppTheme.customTextStyleFooter();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];
  return [
    // title
    if (elm.titles != null && elm.titles!.isNotEmpty)
      TextSpan(text: elm.titles![0], style: titleStyle),
    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
    // subtitle
    if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
      TextSpan(text: elm.subtitles![0], style: subtitleStyle),
    // text 1
    if (elm.texts != null && elm.texts!.length > 1)
      TextSpan(text: elm.texts![1], style: null),
  ];
}

// List<TextSpan> getPageEighteenTexts(int i, List<ElmModelNew>elmList) {
//   TextStyle subtitle = AppTheme.customTextStyleSubtitle();
//   TextStyle title = AppTheme.customTextStyleTitle();
//   ElmModel elm = elmList23[i];
//   return [
//     // From ElmTextTwentyThree
//     // pageEighteen
//     customTextSpan(elm.title, title),
//     customTextSpan(elm.text, null),
//     customTextSpan(elm.subtitle, subtitle),
//     customTextSpan(elm.text2, null),

//     // to remove
//     // TextSpan(text: elm.title, style: title),
//     // TextSpan(text: elm.text),
//     // TextSpan(text: elm.subtitle, style: subtitle),
//     // TextSpan(text: elm.text2),
//   ];
// }
