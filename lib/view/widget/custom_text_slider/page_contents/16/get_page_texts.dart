import 'package:elm/core/data/model/kahtira_page_content.dart';
import 'package:elm/core/data/static/text/elm_text_ders_sixteen.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTexts(int i) {
  final KhatiraPageContent page = ElmTextDersSixteen.pages[i];
  return [
    // title
    if (page.title != null)
      TextSpan(text: page.title!, style: AppTheme.customTextStyleTitle()),

    // subtitle
    if (page.subtitle != null)
      TextSpan(text: page.subtitle!, style: AppTheme.customTextStyleTitle()),

    // text
    if (page.text != null) TextSpan(text: page.text!),

    // ayah & hadith
    if (page.ayahHadith != null)
      TextSpan(text: page.ayahHadith!, style: AppTheme.customTextStyleHadith()),

    // footer
    if (page.footer != null)
      TextSpan(text: page.footer!, style: AppTheme.customTextStyleFooter()),
  ];
}
