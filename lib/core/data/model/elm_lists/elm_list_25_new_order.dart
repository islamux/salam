import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_twenty_five.dart';

List<ElmModelNewOrder> elmList25NewOrder = <ElmModelNewOrder>[
  // PageOne
  ElmModelNewOrder(
    subtitles: <String>[
      ElmTextTwentyFive.subtitleTwentyFivePageOne_1,
    ],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageOne_1,
      ElmTextTwentyFive.elmTextTwentyFivePageOne_2,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageOne_1,
    ],
    order: <EnOrder>[
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
    ],
  ),

// PageTwo
  ElmModelNewOrder(
    subtitles: <String>[
      ElmTextTwentyFive.subtitleTwentyFivePageTwo_1,
    ],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageTwo_1,
      ElmTextTwentyFive.elmTextTwentyFivePageTwo_2,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageTwo_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageTwo_2,
      ElmTextTwentyFive.ayahHadithTwentyFivePageTwo_3,
    ],
    order: <EnOrder>[
      EnOrder.ayahs,
      EnOrder.subtitles,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

// PageThree
  ElmModelNewOrder(
    subtitles: <String>[
      ElmTextTwentyFive.subtitleTwentyFivePageThree_1,
      ElmTextTwentyFive.subtitleTwentyFivePageThree_2,
    ],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageThree_1,
      ElmTextTwentyFive.elmTextTwentyFivePageThree_2,
      ElmTextTwentyFive.elmTextTwentyFivePageThree_3,
      ElmTextTwentyFive.elmTextTwentyFivePageThree_4,
      ElmTextTwentyFive.elmTextTwentyFivePageThree_5,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageThree_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageThree_2,
      ElmTextTwentyFive.ayahHadithTwentyFivePageThree_3,
      ElmTextTwentyFive.ayahHadithTwentyFivePageThree_4,
      ElmTextTwentyFive.ayahHadithTwentyFivePageThree_5,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      // 2
      EnOrder.texts,
      EnOrder.ayahs,
      // 3
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.subtitles,
      // 4
      EnOrder.texts,
      EnOrder.ayahs,
      // 5
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

// PageFour
  ElmModelNewOrder(
    subtitles: <String>[
      ElmTextTwentyFive.subtitleTwentyFivePageFour_1,
    ],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageFour_1,
      ElmTextTwentyFive.elmTextTwentyFivePageFour_2,
      ElmTextTwentyFive.elmTextTwentyFivePageFour_3,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageFour_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageFour_2,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      // 2
      EnOrder.texts,
      EnOrder.ayahs,
      // 3
      EnOrder.texts,
    ],
  ),

  // pageFive
  ElmModelNewOrder(
    subtitles: <String>[
      ElmTextTwentyFive.subtitleTwentyFivePageFive_1,
    ],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageFive_1,
      ElmTextTwentyFive.elmTextTwentyFivePageFive_2,
      ElmTextTwentyFive.elmTextTwentyFivePageFive_3,
      ElmTextTwentyFive.elmTextTwentyFivePageFive_4,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageFive_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageFive_2,
      ElmTextTwentyFive.ayahHadithTwentyFivePageFive_3,
      ElmTextTwentyFive.ayahHadithTwentyFivePageFive_4,
      ElmTextTwentyFive.ayahHadithTwentyFivePageFive_5,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.subtitles,
      EnOrder.ayahs,
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
    ],
  ),

// PageSix
  ElmModelNewOrder(
    subtitles: <String>[
      ElmTextTwentyFive.subtitleTwentyFivePageSix_1,
      ElmTextTwentyFive.subtitleTwentyFivePageSix_2,
      ElmTextTwentyFive.subtitleTwentyFivePageSix_3,
      ElmTextTwentyFive.subtitleTwentyFivePageSix_4,
    ],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageSix_1,
      ElmTextTwentyFive.elmTextTwentyFivePageSix_2,
      ElmTextTwentyFive.elmTextTwentyFivePageSix_3,
      ElmTextTwentyFive.elmTextTwentyFivePageSix_4,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageSix_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageSix_2,
      ElmTextTwentyFive.ayahHadithTwentyFivePageSix_3,
      ElmTextTwentyFive.ayahHadithTwentyFivePageSix_4,
      ElmTextTwentyFive.ayahHadithTwentyFivePageSix_5,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      // 2
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.subtitles,
      // 3
      EnOrder.ayahs,
      EnOrder.subtitles,
      // 4
      EnOrder.ayahs,
      EnOrder.subtitles,
      EnOrder.texts,
      // 5
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

// PageSeven
  ElmModelNewOrder(
    subtitles: <String>[
      ElmTextTwentyFive.subtitleTwentyFivePageSeven_1,
    ],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageSeven_1,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageSeven_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageSeven_2,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.subtitles,
      EnOrder.ayahs,
      EnOrder.texts,
      // 2
      EnOrder.ayahs,
    ],
  ),

// PageEight
  ElmModelNewOrder(
    subtitles: <String>[
      ElmTextTwentyFive.subtitleTwentyFivePageEight_1,
    ],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageEight_1,
      ElmTextTwentyFive.elmTextTwentyFivePageEight_2,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageEight_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageEight_2,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.subtitles,
      EnOrder.ayahs,
      EnOrder.texts,
      // 2
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

// PageNine
  ElmModelNewOrder(
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageNine_1,
      ElmTextTwentyFive.elmTextTwentyFivePageNine_2,
      ElmTextTwentyFive.elmTextTwentyFivePageNine_3,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageNine_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageNine_2,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.texts,
      EnOrder.ayahs,
      // 2
      EnOrder.texts,
      EnOrder.ayahs,
      // 3
      EnOrder.texts,
    ],
  ),

// PageTen
  ElmModelNewOrder(
    subtitles: <String>[
      ElmTextTwentyFive.subtitleTwentyFivePageTen_1,
    ],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageTen_1,
      ElmTextTwentyFive.elmTextTwentyFivePageTen_2,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageTen_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageTen_2,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.subtitles,
      EnOrder.ayahs,
      EnOrder.texts,
      // 2
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

// PageEleven
  ElmModelNewOrder(
    subtitles: <String>[
      ElmTextTwentyFive.subtitleTwentyFivePageEleven_1,
    ],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageEleven_1,
      ElmTextTwentyFive.elmTextTwentyFivePageEleven_2,
      ElmTextTwentyFive.elmTextTwentyFivePageEleven_3,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageEleven_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageEleven_2,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      // 2
      EnOrder.texts,
      EnOrder.ayahs,
      // 3
      EnOrder.texts,
    ],
  ),

// PageTwelve
  ElmModelNewOrder(
    subtitles: <String>[
      ElmTextTwentyFive.subtitleTwentyFivePageTwelve_1,
      ElmTextTwentyFive.subtitleTwentyFivePageTwelve_2,
    ],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageTwelve_1,
      ElmTextTwentyFive.elmTextTwentyFivePageTwelve_2,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.subtitles,
      EnOrder.texts,
      // 2
      EnOrder.subtitles,
      EnOrder.texts,
    ],
  ),

// PageTherteen
  ElmModelNewOrder(
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageTherteen_1,
      ElmTextTwentyFive.elmTextTwentyFivePageTherteen_2,
      ElmTextTwentyFive.elmTextTwentyFivePageTherteen_3,
      ElmTextTwentyFive.elmTextTwentyFivePageTherteen_4,
      ElmTextTwentyFive.elmTextTwentyFivePageTherteen_5,
      ElmTextTwentyFive.elmTextTwentyFivePageTherteen_6,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageTherteen_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageTherteen_2,
      ElmTextTwentyFive.ayahHadithTwentyFivePageTherteen_3,
      ElmTextTwentyFive.ayahHadithTwentyFivePageTherteen_4,
      ElmTextTwentyFive.ayahHadithTwentyFivePageTherteen_5,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.texts,
      EnOrder.ayahs,
      // 2
      EnOrder.texts,
      EnOrder.ayahs,
      // 3
      EnOrder.texts,
      EnOrder.ayahs,
      // 4
      EnOrder.texts,
      EnOrder.ayahs,
      // 5
      EnOrder.texts,
      EnOrder.ayahs,
      // 6
      EnOrder.texts
    ],
  ),

  // PageFourteen
  ElmModelNewOrder(
    subtitles: <String>[
      ElmTextTwentyFive.subtitleTwentyFivePageFourteen_1,
    ],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageFourteen_1,
      ElmTextTwentyFive.elmTextTwentyFivePageFourteen_2,
      ElmTextTwentyFive.elmTextTwentyFivePageFourteen_3,
      ElmTextTwentyFive.elmTextTwentyFivePageFourteen_4,
      ElmTextTwentyFive.elmTextTwentyFivePageFourteen_5,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageFourteen_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageFourteen_2,
      ElmTextTwentyFive.ayahHadithTwentyFivePageFourteen_3,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      // 2
      EnOrder.texts,
      EnOrder.ayahs,
      // 3
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.ayahs,
      // 4
      EnOrder.texts,
    ],
  ),

  // PageFifteen
  ElmModelNewOrder(
    subtitles: <String>[
      ElmTextTwentyFive.subtitleTwentyFivePageFifteen_1,
      ElmTextTwentyFive.subtitleTwentyFivePageFifteen_2,
      ElmTextTwentyFive.subtitleTwentyFivePageFifteen_3,
    ],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageFifteen_1,
      ElmTextTwentyFive.elmTextTwentyFivePageFifteen_2,
      ElmTextTwentyFive.elmTextTwentyFivePageFifteen_3,
      ElmTextTwentyFive.elmTextTwentyFivePageFifteen_4,
      ElmTextTwentyFive.elmTextTwentyFivePageFifteen_5,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageFifteen_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageFifteen_2,
      ElmTextTwentyFive.ayahHadithTwentyFivePageFifteen_3,
      ElmTextTwentyFive.ayahHadithTwentyFivePageFifteen_4,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.subtitles,
      EnOrder.texts,
      // 2
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.subtitles,
      EnOrder.ayahs,
      // 3
      EnOrder.texts,
      EnOrder.ayahs,
      // 4
      EnOrder.texts,
      EnOrder.ayahs,
      // 5
      EnOrder.texts,
    ],
  ),

// PageSixteen
  ElmModelNewOrder(
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageSixteen_1,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageSixteen_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageSixteen_2,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.ayahs,
      EnOrder.ayahs,
      // 2
      EnOrder.texts,
    ],
  ),

  // PageSeventeen
  ElmModelNewOrder(
    subtitles: <String>[
      ElmTextTwentyFive.subtitleTwentyFivePageSeventeen_1,
      ElmTextTwentyFive.subtitleTwentyFivePageSeventeen_2,
    ],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageSeventeen_1,
      ElmTextTwentyFive.elmTextTwentyFivePageSeventeen_2,
      ElmTextTwentyFive.elmTextTwentyFivePageSeventeen_3,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageSeventeen_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageSeventeen_2,
      ElmTextTwentyFive.ayahHadithTwentyFivePageSeventeen_3,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.ayahs,
      EnOrder.texts,
      // 2
      EnOrder.ayahs,
      EnOrder.subtitles,
      EnOrder.texts,
      // 3
      EnOrder.ayahs,
      EnOrder.subtitles,
      EnOrder.texts,
    ],
  ),

  // PageEighteen
  ElmModelNewOrder(
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageEighteen_1,
      ElmTextTwentyFive.elmTextTwentyFivePageEighteen_2,
      ElmTextTwentyFive.elmTextTwentyFivePageEighteen_3,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageEighteen_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageEighteen_2,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.texts,
      EnOrder.ayahs,
      // 2
      EnOrder.texts,
      EnOrder.ayahs,
      // 3
      EnOrder.texts,
    ],
  ),

  // PageNineteen
  ElmModelNewOrder(
    subtitles: <String>[],
    texts: <String>[
      ElmTextTwentyFive.elmTextTwentyFivePageNineteen_1,
      ElmTextTwentyFive.elmTextTwentyFivePageNineteen_2,
      ElmTextTwentyFive.elmTextTwentyFivePageNineteen_3,
    ],
    ayahs: <String>[
      ElmTextTwentyFive.ayahHadithTwentyFivePageNineteen_1,
      ElmTextTwentyFive.ayahHadithTwentyFivePageNineteen_2,
      ElmTextTwentyFive.ayahHadithTwentyFivePageNineteen_3,
      ElmTextTwentyFive.ayahHadithTwentyFivePageNineteen_4,
    ],
    order: <EnOrder>[
      // 1
      EnOrder.ayahs,
      EnOrder.texts,
      // 2
      EnOrder.ayahs,
      EnOrder.texts,
      // 3
      EnOrder.ayahs,
      EnOrder.texts,
      // 4
      EnOrder.ayahs,
    ],
  ),
];
