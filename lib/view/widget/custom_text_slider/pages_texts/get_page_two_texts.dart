import 'package:elm/core/data/static/text/elm_text_ders_sixteen.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTowTexts(int i) {
  return [
    TextSpan(
        text: ElmTextDersSixteen.pageTwo.length > i
            ? ElmTextDersSixteen.pageTwo[i].text
            : ''),
    TextSpan(
        text: ElmTextDersSixteen.pageTwo.length > i
            ? ElmTextDersSixteen.pageTwo[i].ayahHadith
            : '',
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: ElmTextDersSixteen.pageTwo.length > i
            ? ElmTextDersSixteen.pageTwo[i].text
            : ''),
    TextSpan(
        text: ElmTextDersSixteen.pageTwo.length > i
            ? ElmTextDersSixteen.pageTwo[i].ayahHadith
            : '',
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: ElmTextDersSixteen.pageTwo.length > i
            ? ElmTextDersSixteen.pageTwo[i].text
            : ''),
    TextSpan(
        text: ElmTextDersSixteen.pageTwo.length > i
            ? ElmTextDersSixteen.pageTwo[i].ayahHadith
            : '',
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: ElmTextDersSixteen.pageTwo.length > i
            ? ElmTextDersSixteen.pageTwo[i].subtitle
            : '',
        style: AppTheme.customTextStyleTitle()),
    TextSpan(
        text: ElmTextDersSixteen.pageTwo.length > i
            ? ElmTextDersSixteen.pageTwo[i].text
            : ''),
    TextSpan(
        text: ElmTextDersSixteen.pageTwo.length > i
            ? ElmTextDersSixteen.pageTwo[i].ayahHadith
            : '',
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: ElmTextDersSixteen.pageTwo.length > i
            ? ElmTextDersSixteen.pageTwo[i].text
            : ''),
    TextSpan(
        text: ElmTextDersSixteen.pageTwo.length > i
            ? ElmTextDersSixteen.pageTwo[i].footer
            : '',
        style: AppTheme.customTextStyleFooter()),
  ];
}
