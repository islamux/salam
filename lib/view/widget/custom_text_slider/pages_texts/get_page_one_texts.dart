import 'package:elm/core/data/static/text/elm_text_ders_sixteen.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    // Page 1 : titles, subtitles, texts, ayahHadiths, footer
    TextSpan(
        text: ElmTextDersSixteen.pageOne[i].title,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(
        text: ElmTextDersSixteen.pageOne[i].subtitle,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: ElmTextDersSixteen.pageOne[i].text),
    TextSpan(
      text: ElmTextDersSixteen.pageOne[i].ayahHadith,
      style: AppTheme.customTextStyleHadith(),
    ),
    TextSpan(text: ElmTextDersSixteen.pageOne[i].text),
    TextSpan(
        text: ElmTextDersSixteen.pageOne[i].subtitle,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: ElmTextDersSixteen.pageOne[i].text),
    TextSpan(
        text: ElmTextDersSixteen.pageOne[i].ayahHadith,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: ElmTextDersSixteen.pageOne[i].text),
    TextSpan(
        text: ElmTextDersSixteen.pageOne[i].ayahHadith,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: ElmTextDersSixteen.pageOne[i].text),
    TextSpan(
        text: ElmTextDersSixteen.pageOne[i].ayahHadith,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: ElmTextDersSixteen.pageOne[i].text),
    TextSpan(
        text: ElmTextDersSixteen.pageOne[i].ayahHadith,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: ElmTextDersSixteen.pageOne[i].footer,
        style: AppTheme.customTextStyleFooter()),
  ];
}
