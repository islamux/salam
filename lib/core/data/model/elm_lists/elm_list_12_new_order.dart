import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_twelve.dart';

List<ElmModelNewOrder> elmList12NewOrder = [
  // 1
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersTwelve.ayahHadithTwelveOne_1,
    ],
    texts: [
      ElmTextDersTwelve.elmtextTwelveOne_1,
    ],
    order: 'ayahs,texts',
  ),

  // 2
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwelve.elmTextTwelveTwo_1,
    ],
    order: 'texts',
  ),

  // 3
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwelve.elmTextTwelveThree_1,
      ElmTextDersTwelve.elmTextTwelveThree_2,
      ElmTextDersTwelve.elmTextTwelveThree_3,
    ],
    ayahs: [
      ElmTextDersTwelve.ayahHadithTwelveThree_1,
      ElmTextDersTwelve.ayahHadithTwelveThree_2,
    ],
    order: '''
    texts,ayahs
    texts,ayahs
    texts
 ''',
  ),

  // 4
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersTwelve.ayahHadithTwelveFour_1,
      ElmTextDersTwelve.ayahHadithTwelveFour_2,
    ],
    texts: [
      ElmTextDersTwelve.elmTextTwelveFour_1,
      ElmTextDersTwelve.elmTextTwelveFour_2,
    ],
    order: '''
    ayahs,texts
    ayahs,texts
 ''',
  ),

  // 5
  ElmModelNewOrder(
    titles: [
      ElmTextDersTwelve.titleTwelveFive_1,
    ],
    subtitles: [
      ElmTextDersTwelve.subtitleTwelveFive_1,
    ],
    texts: [
      ElmTextDersTwelve.elmTextTwelveFive_1,
      ElmTextDersTwelve.elmTextTwelveFive_2,
    ],
    ayahs: [
      ElmTextDersTwelve.ayahHadithTwelveFive_1,
      ElmTextDersTwelve.ayahHadithTwelveFive_2,
    ],
    footer: ElmTextDersTwelve.footerTwelveFive,
    order: ''',
    titles,subtitles,texts,ayahs,
    ayahs,texts,footer
    ''',
  ),
  // 6
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwelve.elmTextTwelveSix_1,
      ElmTextDersTwelve.elmTextTwelveSix_2,
    ],
    ayahs: [
      ElmTextDersTwelve.ayahHadithTwelveSix_1,
      ElmTextDersTwelve.ayahHadithTwelveSix_2,
    ],
    footer: ElmTextDersTwelve.foooterTwelveSix,
    order: ''',
    texts,ayahs,
    texts,ayahs,
    footer,
    ''',
  ),
  // 7
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwelve.elmTextTwelveSeven_1,
    ],
    ayahs: [
      ElmTextDersTwelve.ayahHadithTwelveSeven_1,
    ],
    footer: ElmTextDersTwelve.foooterTwelveSeven,
    order: ''',
    texts,ayahs,footer
    ''',
  ),
  // 8
  ElmModelNewOrder(
    titles: [
      ElmTextDersTwelve.titleTwelveEight,
    ],
    ayahs: [
      ElmTextDersTwelve.ayahHadithTwelveEight_1,
    ],
    footer: ElmTextDersTwelve.footerTwelveEight,
    order: ''',
    titles,ayahs,footer
    ''',
  ),
  // 9
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwelve.elmTextTwelveNine_1,
    ],
    order: 'texts',
  ),
  // 10
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwelve.elmTextTwelveTen_1,
    ],
    order: 'texts',
  ),
  // 11
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwelve.elmTextTwelveEleven_1,
    ],
    ayahs: [
      ElmTextDersTwelve.ayahHadithTwelveEleven_1,
    ],
    order: ''',
    texts,ayahs,
    ''',
  ),
  // 12
  ElmModelNewOrder(
    titles: [
      ElmTextDersTwelve.titleTwelveTwelve,
    ],
    texts: [
      ElmTextDersTwelve.elmTextTwelveTwelve_1,
    ],
    order: ''',
    titles,texts,
    ''',
  ),
  // 13
  ElmModelNewOrder(
    titles: [
      ElmTextDersTwelve.titleTwelveTherteen,
    ],
    texts: [
      ElmTextDersTwelve.elmTextTwelveTherteen_1,
      ElmTextDersTwelve.elmTextTwelveTherteen_2
    ],
    ayahs: [
      ElmTextDersTwelve.ayahHadithTwelveTherteen_1,
    ],
    order: ''',
    titles,texts,ayahs
    ''',
  ),

  // 14
  ElmModelNewOrder(
    titles: [
      ElmTextDersTwelve.titleTwelveFourteen,
    ],
    ayahs: [
      ElmTextDersTwelve.ayahHadithTwelveFourteen_1,
      ElmTextDersTwelve.ayahHadithTwelveFourteen_2,
    ],
    texts: [
      ElmTextDersTwelve.elmTextTwelveFourteen_1,
    ],
    footer: ElmTextDersTwelve.footerTwelveFourteen,
    order: ''',
    titles,ayahs,texts,
    ayahs,footer
    ''',
  ),

  // 15
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwelve.elmTextTwelveFifteen_1,
      ElmTextDersTwelve.elmTextTwelveFifteen_2,
      ElmTextDersTwelve.elmTextTwelveFifteen_3,
    ],
    ayahs: [
      ElmTextDersTwelve.ayahHadithTwelveFifteen_1,
      ElmTextDersTwelve.ayahHadithTwelveFifteen_2,
    ],
    footer: ElmTextDersTwelve.footerTwelveFifteen,
    // getPageFifteenText(){}
    order: '''
text,ayah,
text,ayah,
text,footer
''',
  ),

  // 16
  ElmModelNewOrder(
    titles: [
      ElmTextDersTwelve.titleTwelveSeventeen,
    ],
    ayahs: [
      ElmTextDersTwelve.ayahHadithTwelveSixteen_1,
      ElmTextDersTwelve.ayahHadithTwelveSixteen_2,
      ElmTextDersTwelve.ayahHadithTwelveSixteen_3,
      ElmTextDersTwelve.ayahHadithTwelveSixteen_4,
    ],
    texts: [
      ElmTextDersTwelve.elmTextTwelveSixteen_1,
      ElmTextDersTwelve.elmTextTwelveSixteen_2,
      ElmTextDersTwelve.elmTextTwelveSixteen_3,
    ],
    footer: ElmTextDersTwelve.footerTwelveSixteen,
    // getPageSixteenText(){}
    order: '''
      titles,ayahs,texts,
      ayahs,texts,
      ayahs,texts,footer
      ''',
  ),

  // 17
  ElmModelNewOrder(
    titles: [
      ElmTextDersTwelve.titleTwelveSeventeen,
    ],
    texts: [
      ElmTextDersTwelve.elmTwelveSeventeen_1,
      ElmTextDersTwelve.elmTwelveSeventeen_2,
      ElmTextDersTwelve.elmTwelveSeventeen_3,
    ],
    ayahs: [
      ElmTextDersTwelve.ayahHadithTwelveSeventeen_1,
      ElmTextDersTwelve.ayahHadithTwelveSeventeen_2,
      ElmTextDersTwelve.ayahHadithTwelveSeventeen_3,
    ],
    // getpageSeventeenText(){}
    order: '''
      titles,texts,ayahs,
      texts,ayahs,
      texts,ayahs
      ''',
  ),

  // 18
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwelve.elmTwelveEighteen_1,
      ElmTextDersTwelve.elmTextTwelveEighteen_2,
      ElmTextDersTwelve.elmTextTwelveEighteen_3,
    ],
    ayahs: [
      ElmTextDersTwelve.ayahHadithTwelveEighteen_1,
    ],
    // getPageEighteenText(){}
    order: '''
      texts,texts,ayahs
      texts,
      ''',
  ),
];
