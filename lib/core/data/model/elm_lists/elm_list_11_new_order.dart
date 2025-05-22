// TextDerseEleven
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_eleven.dart';

List<ElmModelNewOrder> elmList11NewOrder = [
  // page 1
  ElmModelNewOrder(
    titles: [
      ElmTextDersEleven.titleElevenOne,
    ],
    texts: [
      ElmTextDersEleven.elmTextElevenOne_1,
      ElmTextDersEleven.elmTextElevenOne_2,
    ],
    ayahs: [
      ElmTextDersEleven.ayahHadithElevenOne_1,
    ],
    order: [
      EnOrder.titles,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
    ],
  ),
  // page 2
  ElmModelNewOrder(
    titles: [
      ElmTextDersEleven.titleElevenTwo,
    ],
    texts: [
      ElmTextDersEleven.elmTextElevenTwo_1,
    ],
    ayahs: [
      ElmTextDersEleven.ayahHadithElevenTwo_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // page 3
  ElmModelNewOrder(
    texts: [
      ElmTextDersEleven.elmTextElevenThree_1,
      ElmTextDersEleven.elmTextElevenThree_2,
    ],
    ayahs: [
      ElmTextDersEleven.ayahHadithElevenThree_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // page 4
  ElmModelNewOrder(
    texts: [
      ElmTextDersEleven.elmTextElevenFour_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),
  // page 5
  ElmModelNewOrder(
    texts: [
      ElmTextDersEleven.elmTextElevenFive_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

  // page 6
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersEleven.ayahHadithElevenSix_1,
    ],
    texts: [
      ElmTextDersEleven.elmTextElevenSix_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // page 7
  ElmModelNewOrder(
    texts: [
      ElmTextDersEleven.elmTextElevenSeven_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

  // page 8
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersEleven.ayahHadithElevenEight_1,
    ],
    texts: [
      ElmTextDersEleven.elmTextElevenEight_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // page 9
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersEleven.ayahHadithElevenNine_1,
    ],
    texts: [
      ElmTextDersEleven.elmTextElevenNine_1,
      ElmTextDersEleven.elmTextElevenNine_2,
    ],
    subtitles: [
      ElmTextDersEleven.subtitleElevenNine,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.subtitles,
      //
      EnOrder.texts,
    ],
  ),
  // page 10,
  ElmModelNewOrder(
    titles: [
      ElmTextDersEleven.titleElevenTen,
    ],
    texts: [
      ElmTextDersEleven.elmTextElevenTen_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),
  // page 11,
  ElmModelNewOrder(
    texts: [
      ElmTextDersEleven.elmTextElevenEleven_1,
      ElmTextDersEleven.elmTextElevenEleven_2,
      ElmTextDersEleven.elmTextElevenEleven_3,
    ],
    ayahs: [
      ElmTextDersEleven.ayahHadithElevenEleven_1,
      ElmTextDersEleven.ayahHadithElevenEleven_2,
    ],
    footer: ElmTextDersEleven.footerElevenEleven,
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.footer,
    ],
  ),
  // page 12,
  ElmModelNewOrder(
    titles: [
      ElmTextDersEleven.titleElevenTweleve_1,
    ],
    texts: [
      ElmTextDersEleven.elmTextElevenTwelve_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),

  // page 13,
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersEleven.subtitleElevenTherteen,
      ElmTextDersEleven.subtitleElevenTherteen_2,
      ElmTextDersEleven.subtitleElevenTherteen_3,
    ],
    texts: [
      ElmTextDersEleven.elmTextElevenTherteen_1,
      ElmTextDersEleven.elmTextElevenTherteen_2,
      ElmTextDersEleven.elmTextElevenTherteen_3,
    ],
    ayahs: [
      ElmTextDersEleven.ayahHadithElevenTherteen_1,
      ElmTextDersEleven.ayahHadithElevenTherteen_2,
      ElmTextDersEleven.ayahHadithElevenTherteen_3,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // page 14,
  ElmModelNewOrder(
    titles: [
      ElmTextDersEleven.titleElevenFourteen,
    ],
    texts: [
      ElmTextDersEleven.elmTextElevenFourteen_1,
      ElmTextDersEleven.elmTextElevenFourteen_2,
      ElmTextDersEleven.elmTextElevenFourteen_3,
      ElmTextDersEleven.elmTextElevenFourteen_4,
    ],
    ayahs: [
      ElmTextDersEleven.ayahHadithElevenFourteen_1,
      ElmTextDersEleven.ayahHadithElevenFourteen_2,
    ],
    subtitles: [
      ElmTextDersEleven.subtitleElevenFourteen_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.subtitles,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
    ],
  ),

  // page 15,
  ElmModelNewOrder(
    titles: [
      ElmTextDersEleven.titleElevenFifteen,
    ],
    ayahs: [
      ElmTextDersEleven.ayahHadithElevenFifteen_1,
      ElmTextDersEleven.ayahHadithElevenFifteen_2,
    ],
    texts: [
      ElmTextDersEleven.elmTextElevenFifteen_1,
      ElmTextDersEleven.elmTextElevenFifteen_2,
      ElmTextDersEleven.elmTextElevenFifteen_3,
    ],
    subtitles: [
      ElmTextDersEleven.subtitleElevenFifteen_1,
    ],
    footer: ElmTextDersEleven.footerElevenFifteen_1,
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.footer,
    ],
  ),
  // page 16,
  ElmModelNewOrder(
    titles: [
      ElmTextDersEleven.titleElevenSixteen,
    ],
    ayahs: [
      ElmTextDersEleven.ayahHadithElevenSixteen_1,
      ElmTextDersEleven.ayahHadithElevenSixteen_2,
    ],
    subtitles: [
      ElmTextDersEleven.subtitleElevenSixteen_1,
    ],
    texts: [
      ElmTextDersEleven.elmTextElevenSixteen_3,
    ],
    footer: ElmTextDersEleven.footerElevenSixteen,
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.subtitles,
      //
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.footer,
    ],
  ),
  // page 17,
  ElmModelNewOrder(
    texts: [
      ElmTextDersEleven.elmTextElevenSeventeen_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),
  // page 18,
  ElmModelNewOrder(
    titles: [
      ElmTextDersEleven.titleElevenEighteen_1,
    ],
    ayahs: [
      ElmTextDersEleven.ayahHadithElevenEighteen_1,
    ],
    texts: [
      ElmTextDersEleven.elmTextElevenEighteen_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // page 19,
  ElmModelNewOrder(
    titles: [
      ElmTextDersEleven.titleElevenNineteen,
    ],
    texts: [
      ElmTextDersEleven.elmTextElevenNineteen,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),
  // page 20,
  ElmModelNewOrder(
    texts: [
      ElmTextDersEleven.elmTexElevenTwenty_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),
];
