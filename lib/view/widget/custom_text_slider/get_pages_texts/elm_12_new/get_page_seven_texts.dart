import 'package:elm/core/data/model/elm_lists/elm_list_12.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i, List<ElmodelNew> elmList) {
  TextStyle footerStyle = AppTheme.customTextStyleFooter();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];
 
  return [

    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
 
    // ayah 0
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle),
 
    // footer
    if (elm.footer != null && elm.footer!.isNotEmpty)
      TextSpan(text: elm.footer!, style: footerStyle),
 
  ];
}

// List<TextSpan> getPageSevenTexts(int i, List<ElmodelNew> elmList) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   TextStyle footer = AppTheme.customTextStyleFooter();

//   return [
//     TextSpan(text: elmList12[i].text),
//     TextSpan(text: elmList12[i].ayah, style: ayah),
//     TextSpan(text: elmList12[i].footer, style: footer),
//   ];
// }
