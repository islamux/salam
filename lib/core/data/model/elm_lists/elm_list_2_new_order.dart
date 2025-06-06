import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_two.dart';

List<ElmModelNewOrder> elmList2NewOrder = [
  // 1
  ElmModelNewOrder(
    titles: [ElmTextDersTwo.titleTwoOne],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoOne_1,
      ElmTextDersTwo.ayahHadithTwoOne_2,
    ],
    texts: [
      ElmTextDersTwo.elmTextTwoOne_1,
      ElmTextDersTwo.elmTextTwoOne_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // 2
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoTwo_1,
      ElmTextDersTwo.ayahHadithTwoTwo_2,
    ],
    texts: [
      ElmTextDersTwo.elmTextTwoTwo_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // 3
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoThree_1,
      ElmTextDersTwo.elmTextTwoThree_2,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoThree_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // 4
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextsTwoFour_1,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoFour_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // 5
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoFive_1,
    ],
    footer: ElmTextDersTwo.footerTwoFive,
    order: [
      EnOrder.texts,
      EnOrder.footer,
    ],
  ),

  // 6
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoSix_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

  // 7
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoSeven_1,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoSeven_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // 8
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoEight_1,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoEight_1,
    ],
    footer: ElmTextDersTwo.footerTwoEight,
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.footer,
    ],
  ),

  // 9
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoNine_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

  // 10
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoTen_1,
      ElmTextDersTwo.elmTextTwoTen_2,
    ],
    ayahs: [
      ElmTextDersTwo.ayhaHadithTwoTen_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // 11
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersTwo.ayhaHadithTowEleven_1,
    ],
    texts: [
      ElmTextDersTwo.elmTextTwoEleven_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // 12
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoTwelve_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

  // 13
  ElmModelNewOrder(
    titles: [
      ElmTextDersTwo.titleTwoThirteen,
    ],
    texts: [
      ElmTextDersTwo.elmTextTwoThirteen_1,
      ElmTextDersTwo.elmTextTwoThirteen_2,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoThirteen_1,
    ],
    subtitles: [
      ElmTextDersTwo.subtitleTwoThirteen_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.subtitles,
      EnOrder.texts,
    ],
  ),

  // 14
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoFourteen_1,
      ElmTextDersTwo.ayahHadithTwoFourteen_2,
      ElmTextDersTwo.ayahHadithTwoFourteen_3,
      ElmTextDersTwo.ayahHadithTwoFourteen_4,
      ElmTextDersTwo.ayahHadithTwoFourteen_5,
      ElmTextDersTwo.ayahHadithTwoFourteen_6,
      ElmTextDersTwo.ayahHadithTwoFourteen_7,
    ],
    texts: [
      ElmTextDersTwo.elmTextTwoFourteen_1,
      ElmTextDersTwo.elmTextTwoFourteen_2,
      ElmTextDersTwo.elmTextTwoFourteen_3,
      ElmTextDersTwo.elmTextTwoFourteen_4,
      ElmTextDersTwo.elmTextTwoFourteen_5,
      ElmTextDersTwo.elmTextTwoFourteen_6,
      ElmTextDersTwo.elmTextTwoFourteen_7,
    ],
    subtitles: [
      ElmTextDersTwo.subtitleTextTwoFourteen_1,
      ElmTextDersTwo.subtitleTextTwoFourteen_2,
    ],
    order: [
      EnOrder.ayahs, // 1
      EnOrder.texts, // 1
      EnOrder.ayahs, // 2
      EnOrder.texts, // 2
      EnOrder.ayahs, // 3
      EnOrder.subtitles, // 1
      EnOrder.texts, // 3
      EnOrder.ayahs, // 4
      EnOrder.subtitles, // 2
      EnOrder.texts, // 4
      EnOrder.ayahs, // 5
      EnOrder.texts, // 5
      EnOrder.ayahs, // 6
      EnOrder.texts, // 6
      EnOrder.ayahs, // 7
      EnOrder.texts, // 7
    ],
  ),

  // 15
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoFifteen_1,
      ElmTextDersTwo.ayahHadithTwoFifteen_2,
      ElmTextDersTwo.ayahHadithTwoFifteen_3,
      ElmTextDersTwo.ayahHadithTwoFifteen_4,
    ],
    texts: [
      ElmTextDersTwo.elmTextTwoFifteen_1,
      ElmTextDersTwo.elmTextTwoFifteen_2,
      ElmTextDersTwo.elmTextTwoFifteen_3,
    ],
    order: [
      EnOrder.ayahs, // 1
      EnOrder.texts, // 1
      EnOrder.ayahs, // 2
      EnOrder.texts, // 2
      EnOrder.ayahs, // 3
      EnOrder.texts, // 3
      EnOrder.ayahs, // 4
    ],
  ),

  // 16
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersTwo.subtitleDersSixteen_1,
      ElmTextDersTwo.subtitleDersSixteen_2,
    ],
    texts: [
      ElmTextDersTwo.elmTextDersSixteen_1,
      ElmTextDersTwo.elmTextDersSixteen_2,
      ElmTextDersTwo.elmTextDersSixteen_3,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithSixteen_1,
      ElmTextDersTwo.ayahHadithSixteen_2,
      ElmTextDersTwo.ayahHadithSixteen_3,
    ],
    order: [
      EnOrder.subtitles, // 1
      EnOrder.texts, // 1
      EnOrder.ayahs, // 1
      EnOrder.subtitles, // 2
      EnOrder.texts, // 2
      EnOrder.ayahs, // 2
      EnOrder.texts, // 3
      EnOrder.ayahs, // 3
    ],
  ),

  // 17
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextDersSeventeen_1,
      ElmTextDersTwo.elmTextDersSeventeen_2,
      ElmTextDersTwo.elmTextDersSeventeen_3,
      ElmTextDersTwo.elmTextDersSeventeen_4,
      ElmTextDersTwo.elmTextDersSeventeen_5,
      ElmTextDersTwo.elmTextDersSeventeen_6,
      ElmTextDersTwo.elmTextDersSeventeen_7,
      ElmTextDersTwo.elmTextDersSeventeen_8,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithSeventeen_1,
      ElmTextDersTwo.ayahHadithSeventeen_2,
      ElmTextDersTwo.ayahHadithSeventeen_3,
      ElmTextDersTwo.ayahHadithSeventeen_4,
      ElmTextDersTwo.ayahHadithSeventeen_5,
      ElmTextDersTwo.ayahHadithSeventeen_6,
      ElmTextDersTwo.ayahHadithSeventeen_7,
      ElmTextDersTwo.ayahHadithSeventeen_8,
    ],
    subtitles: [
      ElmTextDersTwo.subtitleDersSeventeen_1,
    ],
    order: [
      EnOrder.texts, // 1
      EnOrder.ayahs, // 1
      EnOrder.texts, // 2
      EnOrder.ayahs, // 2
      EnOrder.texts, // 3
      EnOrder.ayahs, // 3
      EnOrder.subtitles, // 1
      EnOrder.texts, // 4
      EnOrder.ayahs, // 4
      EnOrder.texts, // 5
      EnOrder.ayahs, // 5
      EnOrder.texts, // 6
      EnOrder.ayahs, // 6
      EnOrder.texts, // 7
      EnOrder.ayahs, // 7
      EnOrder.texts, // 8
      EnOrder.ayahs, // 8
    ],
  ),

  // 18
  ElmModelNewOrder(
    titles: [
      ElmTextDersTwo.titleTwoEighteen,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTowEighteen_1,
    ],
    texts: [
      ElmTextDersTwo.elmTextTwoEighteen_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // 19
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersTwo.subtitleTextTwoNinteen,
      ElmTextDersTwo.subtitleTextTwoNineteen_2,
      ElmTextDersTwo.subtitleTextTwoNineteen_3,
      ElmTextDersTwo.subtitleTextTwoNineteen_4,
      ElmTextDersTwo.subtitleTextTwoNineteen_5,
    ],
    texts: [
      ElmTextDersTwo.elmTextTwoNineteen_1,
      ElmTextDersTwo.elmTextTwoNineteen_2,
      ElmTextDersTwo.elmTextTwoNineteen_3,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoNineteen_1,
      ElmTextDersTwo.ayahHadithTwoNineteen_2,
    ],
    order: [
      EnOrder.subtitles, // 1
      EnOrder.texts, // 1
      EnOrder.subtitles, // 2
      EnOrder.ayahs, // 1
      EnOrder.subtitles, // 3
      EnOrder.ayahs, // 2
      EnOrder.subtitles, // 4
      EnOrder.texts, // 2
      EnOrder.subtitles, // 5
      EnOrder.texts, // 3
    ],
  ),
];
