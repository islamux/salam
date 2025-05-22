import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_final.dart';

// TextDersSeventeen
List<ElmModelNewOrder> finalListNewOrder = [
  // page 1
  ElmModelNewOrder(
    texts: [
      ElmTextFInal.textFInalPageOne_1,
      ElmTextFInal.textFInalPageOne_2,
    ],
    ayahs: [
      ElmTextFInal.ayahFInalPageOne_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // page 2
  ElmModelNewOrder(
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageTwo_1,
      ElmTextFInal.ayahHadithFInalPageTwo_2,
      ElmTextFInal.ayahHadithFInalPageTwo_3,
    ],
    texts: [
      ElmTextFInal.textFInalPageTwo_1,
      ElmTextFInal.textFInalPageTwo_2,
    ],
    subtitles: [
      ElmTextFInal.subtitleFInalPageTwo_1,
      ElmTextFInal.subtitleFInalPageTwo_2
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.subtitles,
      //
      EnOrder.ayahs,
    ],
  ),

  // page 3
  ElmModelNewOrder(
    texts: [
      ElmTextFInal.textFInalPageThree_1,
      ElmTextFInal.textFInalPageThree_2,
      ElmTextFInal.textFInalPageThree_3,
    ],
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageThree_1,
    ],
    subtitles: [
      ElmTextFInal.subtitleFInalPageThree_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.subtitles,
      //
      EnOrder.texts,
    ],
  ),

  // page 4
  ElmModelNewOrder(
    titles: [
      ElmTextFInal.titleFInalPageFour_1,
    ],
    texts: [
      ElmTextFInal.textFInalPageFour_1,
      ElmTextFInal.textFInalPageFour_2,
    ],
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageFour_1,
      ElmTextFInal.ayahHadithFInalPageFour_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // page 5
  ElmModelNewOrder(
    texts: [
      ElmTextFInal.textFInalPageFive_1,
      ElmTextFInal.textFInalPageFive_2,
    ],
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageFive_1,
      ElmTextFInal.ayahHadithFInalPageFive_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
    ],
  ),

  // page 6
  ElmModelNewOrder(
    texts: [
      ElmTextFInal.textFInalPageSix_1,
      ElmTextFInal.textFInalPageSix_2,
      ElmTextFInal.textFInalPageSix_3,
      ElmTextFInal.textFInalPageSix_4,
    ],
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageSix_1,
      ElmTextFInal.ayahHadithFInalPageSix_2,
      ElmTextFInal.ayahHadithFInalPageSix_3,
    ],
    order: [
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
    ],
  ),

  // page 7
  ElmModelNewOrder(
    texts: [
      ElmTextFInal.textFInalPageSeven_1,
      ElmTextFInal.textFInalPageSeven_2,
    ],
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageSeven_1,
      ElmTextFInal.ayahHadithFInalPageSeven_2,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // page 8
  ElmModelNewOrder(
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageEight_1,
      ElmTextFInal.ayahHadithFInalPageEight_2,
      ElmTextFInal.ayahHadithFInalPageEight_3,
      ElmTextFInal.ayahHadithFInalPageEight_4,
      ElmTextFInal.ayahHadithFInalPageEight_5,
    ],
    texts: [
      ElmTextFInal.textFInalPageEight_1,
      ElmTextFInal.textFInalPageEight_2,
      ElmTextFInal.textFInalPageEight_3,
      ElmTextFInal.textFInalPageEight_4,
      ElmTextFInal.textFInalPageEight_5,
      ElmTextFInal.textFInalPageEight_6,
      ElmTextFInal.textFInalPageEight_7,
    ],
    subtitles: [
      ElmTextFInal.subtitleFInalPageEight_1,
      ElmTextFInal.subtitleFInalPageEight_2,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.subtitles,
      EnOrder.texts,
      // 2
      EnOrder.ayahs,
      EnOrder.texts,
      // 3
      EnOrder.ayahs,
      EnOrder.texts,
      // 4
      EnOrder.ayahs,
      EnOrder.texts,
      // 5
      EnOrder.ayahs,
      EnOrder.texts,
      // 6
      EnOrder.subtitles,
      EnOrder.texts,
    ],
  ),

  // page 9
  ElmModelNewOrder(
    subtitles: [
      ElmTextFInal.subtitleFInalPageNine_1,
    ],
    texts: [
      ElmTextFInal.textFInalPageNine_1,
      ElmTextFInal.textFInalPageNine_2,
      ElmTextFInal.textFInalPageNine_3,
      ElmTextFInal.textFInalPageNine_4,
      ElmTextFInal.textFInalPageNine_5,
    ],
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageNine_1,
      ElmTextFInal.ayahHadithFInalPageNine_2,
      ElmTextFInal.ayahHadithFInalPageNine_3,
      ElmTextFInal.ayahHadithFInalPageNine_4,
      ElmTextFInal.ayahHadithFInalPageNine_5,
    ],
    order: [
      //
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //2
      EnOrder.texts,
      EnOrder.ayahs,
      //3
      EnOrder.texts,
      EnOrder.ayahs,
      //4
      EnOrder.texts,
      EnOrder.ayahs,
      //5
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // page 10
  ElmModelNewOrder(
    subtitles: [
      ElmTextFInal.subtitleFInalPageTen_1,
      ElmTextFInal.subtitleFInalPageTen_2,
    ],
    texts: [
      ElmTextFInal.textFInalPageTen_1,
      ElmTextFInal.textFInalPageTen_2,
      ElmTextFInal.textFInalPageTen_3,
    ],
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageTen_1,
      ElmTextFInal.ayahHadithFInalPageTen_2,
      ElmTextFInal.ayahHdithFInalPageTen_3,
    ],
    order: [
      //
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // page 11
  ElmModelNewOrder(
    subtitles: [
      ElmTextFInal.subtitleFInalPageEleven_1,
    ],
    texts: [
      ElmTextFInal.textFInalPageEleven_1,
      ElmTextFInal.textFInalPageEleven_2,
      ElmTextFInal.textFInalPageEleven_3,
    ],
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageEleven_1,
      ElmTextFInal.ayahHadithFInalPageEleven_2,
      ElmTextFInal.ayahHadithFInalPageEleven_3,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // page 12
  ElmModelNewOrder(
    subtitles: [
      ElmTextFInal.subtitleFInalPageTwelve_1,
    ],
    texts: [
      ElmTextFInal.textFInalPageTwelve_1,
      ElmTextFInal.textFInalPageTwelve_2,
    ],
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageTwelve_1,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
    ],
  ),

  // page 13
  ElmModelNewOrder(
    subtitles: [
      ElmTextFInal.subtitleFInalPageThirteen_1,
    ],
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageThirteen_1,
    ],
    texts: [
      ElmTextFInal.textFInalPageThirteen_1,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // page 14
  ElmModelNewOrder(
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageFourteen_1,
      ElmTextFInal.ayahHadithFInalPageFourteen_4,
    ],
    subtitles: [
      ElmTextFInal.subtitleFInalPageFourteen_2,
    ],
    texts: [
      ElmTextFInal.textFInalPageFourteen_3,
      ElmTextFInal.textFInalPageFourteen_5,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.subtitles,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // page 15
  ElmModelNewOrder(
    subtitles: [
      ElmTextFInal.subtitleFInalPageFifteen_1,
    ],
    texts: [
      ElmTextFInal.textFInalPageFifteen_1,
      ElmTextFInal.textFInalPageFifteen_2,
    ],
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageFifteen_1,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
    ],
  ),

  // page 16
  ElmModelNewOrder(
    subtitles: [
      ElmTextFInal.subtitleFInalPageSixteen_1,
      ElmTextFInal.subtitleFInalPageSixteen_2,
    ],
    ayahs: [
      ElmTextFInal.ayahHadithFInalPageSixteen_1,
      ElmTextFInal.ayahHadithFInalPageSixteen_2,
    ],
    texts: [
      ElmTextFInal.textFInalPageSixteen_1,
      ElmTextFInal.textFInalPageSixteen_2,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.subtitles,
      EnOrder.texts,
    ],
  ),
];
