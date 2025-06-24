import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_two.dart';

List<ElmModelNewOrder> elmList2NewOrder = [
  // TwoOne
  ElmModelNewOrder(
    titles: [ElmTextDersTwo.titleTwoOne_1],
    ayahs: [ElmTextDersTwo.ayahHadithTwoOne_1],
    texts: [ElmTextDersTwo.elmTextTwoOne_1],
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // TwoTwo
  ElmModelNewOrder(
    ayahs: [ElmTextDersTwo.ayahHadithTwoTwo_1],
    texts: [ElmTextDersTwo.elmTextTwoTwo_1],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // TwoThree
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoThree_1,
      ElmTextDersTwo.ayahHadithTwoThree_2,
      ElmTextDersTwo.ayahHadithTwoThree_3,
    ],
    texts: [
      ElmTextDersTwo.elmTextTwoThree_1,
      ElmTextDersTwo.elmTextTwoThree_2,
      ElmTextDersTwo.elmTextTwoThree_3,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // TwoFour
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoFour_1,
      ElmTextDersTwo.elmTextTwoFour_2,
    ],
    ayahs: [ElmTextDersTwo.ayahHadithTwoFour_1],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // TwoFive
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoFive_1,
      ElmTextDersTwo.elmTextTwoFive_2,
      ElmTextDersTwo.elmTextTwoFive_3,
      ElmTextDersTwo.elmTextTwoFive_4,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoFive_1,
      ElmTextDersTwo.ayahHadithTwoFive_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // TwoSix
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoSix_1,
      ElmTextDersTwo.elmTextTwoSix_2,
      ElmTextDersTwo.elmTextTwoSix_3,
      ElmTextDersTwo.elmTextTwoSix_4,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoSix_1,
      ElmTextDersTwo.ayahHadithTwoSix_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // TwoSeven
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextSeven_1,
      ElmTextDersTwo.elmTextSeven_2,
    ],
    titles: [ElmTextDersTwo.titleTwoSeven_1],
    ayahs: [ElmTextDersTwo.ayahHadithTwoSeven_1],
    order: [
      EnOrder.texts,
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // TwoEight
  ElmModelNewOrder(
    titles: [ElmTextDersTwo.titleTwoEight_2],
    texts: [
      ElmTextDersTwo.elmTextTwoEight_1,
      ElmTextDersTwo.elmTextTwoEight_2,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoEight_1,
      ElmTextDersTwo.ayahHadithTwoEight_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // TwoNine
  ElmModelNewOrder(
    titles: [
      ElmTextDersTwo.titleTwoNine_1,
      ElmTextDersTwo.titleTwoNine_2,
    ],
    texts: [
      ElmTextDersTwo.elmTextTwoNine_1,
      ElmTextDersTwo.elmTextTwoNine_2,
      ElmTextDersTwo.elmTextTwoNine_3,
      ElmTextDersTwo.elmTextTwoNine_4,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoNine_1,
      ElmTextDersTwo.ayahHadithTwoNine_2,
      ElmTextDersTwo.ayahHadithTwoNine_3,
      ElmTextDersTwo.ayahHadithTwoNine_4,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // TwoTen
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoTen_1,
      ElmTextDersTwo.elmTextTwoTen_2,
      ElmTextDersTwo.elmTextTwoTen_3,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoTen_1,
      ElmTextDersTwo.ayahHadithTwoTen_2,
      ElmTextDersTwo.ayahHadithTwoTen_3,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // TwoEleven (moved up)
  ElmModelNewOrder(
    titles: [ElmTextDersTwo.titleTwoEleven_1],
    texts: [ElmTextDersTwo.elmTextTwoEleven_1],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),

  // TwoTwelve (was Eleven)
  ElmModelNewOrder(
    titles: [
      ElmTextDersTwo.titleTwoTwelve_1,
    ],
    texts: [
      ElmTextDersTwo.elmTextTwoTwelve_1,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoTwelve_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // TwoThirteen (was Twelve)
  ElmModelNewOrder(
    titles: [
      ElmTextDersTwo.titleTwoThirteen_1,
      ElmTextDersTwo.titleTwoThirteen_2,
    ],
    texts: [
      ElmTextDersTwo.elmTextTwoThirteen_1,
      ElmTextDersTwo.elmTextTwoThirteen_2,
    ],
    subtitles: [
      ElmTextDersTwo.subtitleTwoThirteen_1,
      ElmTextDersTwo.subtitleTwoThirteen_2,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoThirteen_1,
      ElmTextDersTwo.ayahHadithTwoThirteen_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.subtitles,
      EnOrder.ayahs,
      EnOrder.subtitles,
      EnOrder.ayahs,
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),
];
