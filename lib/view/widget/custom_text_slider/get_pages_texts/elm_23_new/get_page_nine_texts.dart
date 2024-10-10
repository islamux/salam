import 'package:elm/core/data/model/elm_lists/elm_list_22.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();

  ElmModelNew elm = elmList[i];
  return [
    // ElmtextTwentyThree
    // pageNine
  ];
}


// List<TextSpan> getPageNineTexts(int i, List<ElmModelNew>elmList) {
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   ElmModel elm = elmList22[i];
//   return [
//     // ElmtextTwentyThree
//     // pageNine
//     TextSpan(text: elm.ayah, style: ayahStyle),
//     TextSpan(text: elm.title, style: titleStyle),
//     TextSpan(text: elm.text),
//     TextSpan(text: elm.ayah2, style: ayahStyle),
//     TextSpan(text: elm.text2),
//   ];
// }
