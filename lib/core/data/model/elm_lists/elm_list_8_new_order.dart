import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_eight.dart';

List<ElmModelNewOrder> elmList8NewOrder = [
  // 1
  ElmModelNewOrder(
    titles: [
      ElmTextDersEight.titleEightOne,
    ],
    texts: [
      ElmTextDersEight.elmTextEightOne_1,
    ],
    ayahs: [
      ElmTextDersEight.ayahHadithOne_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
//    order: 'titles,texts,ayahs',
  ),
  // 2
  ElmModelNewOrder(
    texts: [
      ElmTextDersEight.elmTextEightTwo_1,
      ElmTextDersEight.elmTextEightTwo_2,
    ],
    ayahs: [
      ElmTextDersEight.ayahHadithTwo_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // order: '''
    //   texts,ayahs,
    //   texts
    //   ''',
  ),
  // 3
  ElmModelNewOrder(
    texts: [
      ElmTextDersEight.elmTextEightThree_1,
    ],
    ayahs: [
      ElmTextDersEight.ayahHadithThree_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
    // order: 'texts,ayahs',
  ),
  // 4
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersEight.ayahHadithFour_1,
      ElmTextDersEight.ayahHadithFour_2,
    ],
    texts: [
      ElmTextDersEight.elmTextEightFour_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
    // order: '''
    // ayahs,texts,
    // ayahs,
    // ''',
  ),

  // 5
  ElmModelNewOrder(
    texts: [
      ElmTextDersEight.elmTextEightFive_1,
    ],
    ayahs: [
      ElmTextDersEight.ayahHadithFour_2,
    ],
    order: [],
    // order: 'texts,ayahs',
  ),

  // 6
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersEight.subtitleEightSix_1,
    ],
    texts: [
      ElmTextDersEight.elmTextDersEightSix_1,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
    ],
    // order: 'subtitles,texts',
  ),
  // 7
  ElmModelNewOrder(
    texts: [
      ElmTextDersEight.elmTextDersEigthtSeven_1,
    ],
    footer: ElmTextDersEight.footerEightSeven_1,
    order: [
      EnOrder.texts,
      EnOrder.footer,
    ],
    // order: 'texts,footer',
  ),

  // 8
  ElmModelNewOrder(
    titles: [
      ElmTextDersEight.titleEightEigh,
    ],
    subtitles: [
      ElmTextDersEight.subtitleEightEight_1,
      ElmTextDersEight.subtitleEightEight_2,
    ],
    ayahs: [
      ElmTextDersEight.ayahHadithEightEight_1,
      ElmTextDersEight.ayahHadithEightEight_2,
    ],
    texts: [
      ElmTextDersEight.elmTextEightEight_1,
      ElmTextDersEight.elmTextEightEight_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.subtitles,
//
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.subtitles,
      EnOrder.texts,
    ],
    // order: '''
    // titles,subtitles,ayahs,texts,
    // ayahs,subtitles,texts,
    // ''',
  ),
  // 9
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersEight.ayahHadithEightNine_1,
      ElmTextDersEight.ayahHadithEightNine_1,
    ],
    texts: [
      ElmTextDersEight.elmTextEightNine_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    //  order: ''',

    //   ayahs,texts,
    //   ayahs,texts,
    // '''
  ),

  // 10
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersEight.ayahHadithEightTen_1,
      ElmTextDersEight.ayahHadithEightTen_2,
    ],
    texts: [
      ElmTextDersEight.elmTextEightTen_1,
      ElmTextDersEight.elmTextEightTen_2,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    //  order: ''',
    //   ayahs,texts,
    //   ayahs,texts,
    //   '''),
  ),
];
