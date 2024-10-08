import 'package:elm/core/data/model/elm_lists/elm_list_12.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i, List<ElmodelNew> elmList) {
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle footerStyle = AppTheme.customTextStyleFooter();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];
 
  return [
    // title
    if (elm.titles != null && elm.titles!.isNotEmpty)
      TextSpan(text: elm.titles![0], style: titleStyle),
    // subtitle 0
    if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
      TextSpan(text: elm.subtitles![0], style: subtitleStyle),
 
    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
 
    // ayah 0
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle),
     // text 1
    if (elm.texts != null && elm.texts!.length > 1)
      TextSpan(text: elm.texts![1], style: null),
     // ayah 1
    if (elm.ayahs != null && elm.ayahs!.length > 1)
      TextSpan(text: elm.ayahs![1], style: ayahStyle),
 
    // footer
    if (elm.footer != null && elm.footer!.isNotEmpty)
      TextSpan(text: elm.footer!, style: footerStyle),
 

 ];
}

// List<TextSpan> getPageFiveTexts(int i, List<ElmodelNew> elmList) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   TextStyle title = AppTheme.customTextStyleTitle();
//   TextStyle subtitle = AppTheme.customTextStyleSubtitle();
//   TextStyle footer = AppTheme.customTextStyleFooter();

//   return [
//     TextSpan(text: elmList12[i].title, style: title),
//     TextSpan(text: elmList12[i].subtitle, style: subtitle),
//     TextSpan(text: elmList12[i].text),
//     TextSpan(text: elmList12[i].ayah, style: ayah),
//     TextSpan(text: elmList12[i].text2),
//     TextSpan(text: elmList12[i].ayah2, style: ayah),
//     TextSpan(text: elmList12[i].footer, style: footer),
//   ];
// }
