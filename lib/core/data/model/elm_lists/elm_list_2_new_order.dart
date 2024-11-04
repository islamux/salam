// TextDersTwo
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_two.dart';

List<ElmModelNewOrder> elmList2NewOrder = [
  // 1
  ElmModelNewOrder(
    titles: [
      ElmTextDersTwo.titleTwoOne,
    ],
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
      //
      EnOrder.ayahs,
      EnOrder.texts,
    ],
//     order: '''
//       titles,ayahs,texts,
//       ayahs,texts,
//  ''',
  ),
  // 2
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoTwo_1,
    ],
    texts: [
      ElmTextDersTwo.elmTextTwoTwo_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
//     order: '''
//       ayahs,texts,
//  ''',
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
    // order: '''
    //   texts,ayahs,
    //   texts,

    // ''',
  ),
  // 4
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextsTwoFour_1,
      ElmTextDersTwo.elmTextTwoFour_2,
      ElmTextDersTwo.elmTextTwoFour_3,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTwoFour_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
//     order: '''
//       texts,texts,texts,ayahs
//  ''',
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
//     order: '''
//     texts,footer
//  ''',
  ),
  // 6
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoSix_1,
      ElmTextDersTwo.elmTextTowSix_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
    ],
//     order: '''
//     texts,texts,
//  ''',
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
//     order: '''
//     texts,ahash,
// ''',
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
      EnOrder.footer,
    ],
    // order: 'texts,ayahs,footer',
  ),
  // 9
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoNine_1,
      ElmTextDersTwo.elmTextTwoNine_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
    ],
    // order: 'texts,texts',
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
    // order: 'texts,ayahs,texts',
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
    // order: 'ayahs,texts',
  ),
  // 12
  ElmModelNewOrder(
    texts: [
      ElmTextDersTwo.elmTextTwoTwelve_1,
    ],
    order: [
      EnOrder.texts,
    ],
    // order: 'texts',
  ),
  // 13
  ElmModelNewOrder(
    titles: [
      ElmTextDersTwo.titleTwoThirteen,
    ],
    ayahs: [
      ElmTextDersTwo.ayahHadithTowThirteen_1,
    ],
    texts: [
      ElmTextDersTwo.elmTextTwoThirteen_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // order: '''
    // titles,ayahs,texts',
    //  ''',
  ),
];
