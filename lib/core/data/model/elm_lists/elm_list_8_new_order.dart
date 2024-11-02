import 'package:elm/core/data/model/elm_model_new_order.dart';
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
    order: 'titles,texts,ayahs',
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
    order: '''
      texts,ayahs,
      texts
      ''',
  ),
  // 3
  ElmModelNewOrder(
    texts: [
      ElmTextDersEight.elmTextEightThree_1,
    ],
    ayahs: [
      ElmTextDersEight.ayahHadithThree_1,
    ],
    order: 'texts,ayahs',
  ),
  // 4
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersEight.ayhaHadithFour_1,
      ElmTextDersEight.ayhaHadithFour_2,
    ],
    texts: [
      ElmTextDersEight.elmTextEightFour_1,
    ],
    order: '''
    ayahs,texts,
    ayahs,
    ''',
  ),

  // 5
  ElmModelNewOrder(
    texts: [
      ElmTextDersEight.elmTextEightFive_1,
    ],
    ayahs: [
      ElmTextDersEight.ayhaHadithFour_2,
    ],
    order: 'texts,ayahs',
  ),

  // 6
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersEight.subtitleEightSix_1,
    ],
    texts: [
      ElmTextDersEight.elmTextDersEightSix_1,
    ],
    order: 'subtitles,texts',
  ),
  // 7
  ElmModelNewOrder(
    texts: [
      ElmTextDersEight.elmTextDersEigthtSeven_1,
    ],
    footer: ElmTextDersEight.footerEightSeven_1,
    order: 'texts,footer',
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
    order: '''
    titles,subtitles,ayahs,texts,
    ayahs,subtitles,texts,
    ''',
  ),
  // 9
  ElmModelNewOrder(ayahs: [
    ElmTextDersEight.ayahHadithEightNine_1,
    ElmTextDersEight.ayahHadithEightNine_1,
  ], texts: [
    ElmTextDersEight.elmTextEightNine_1,
  ], order: ''',
    ayahs,texts,
    ayahs,texts,
  '''),

  // 10
  ElmModelNewOrder(ayahs: [
    ElmTextDersEight.ayahHadithEightTen_1,
    ElmTextDersEight.ayahHadithEightTen_2,
  ], texts: [
    ElmTextDersEight.elmTextEightTen_1,
    ElmTextDersEight.elmTextEightTen_2,
  ], order: ''',
    ayahs,texts,
    ayahs,texts,
    '''),
];
