import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_twenty_one.dart';

// TextDersSeventeen
List<ElmModelNewOrder> elmList21NewOrder = [
  // page 1
  ElmModelNewOrder(
    titles: [
      ElmTextTwentyOne.titleTwentyOneOne,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneOne_1,
      ElmTextTwentyOne.elmTextTwentyOneOne_2,
      ElmTextTwentyOne.elmTextTwentyOneOne_3,
    ],
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneOne_1,
      ElmTextTwentyOne.ayahHadithTwentyOneOne_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
    ],
  ),

// page 2
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneTwo_1,
      ElmTextTwentyOne.ayahHadithTwentyOneTwo_2
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneTwo_1,
    ],
    subtitles: [
      ElmTextTwentyOne.subtitleTwentyOneTwo_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.subtitles,
      //
      EnOrder.ayahs,
    ],
  ),
  // page 3
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneThree_1,
      ElmTextTwentyOne.ayahHadithTwentyOneThree_2,
      ElmTextTwentyOne.ayahHadithTwentyOneThree_3,
    ],
    subtitles: [
      ElmTextTwentyOne.subtitleTwentyOneThree_1,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneThree_1,
      ElmTextTwentyOne.elmTextTwentyOneThree_2,
      ElmTextTwentyOne.elmTextTwentyOneThree_3,
      ElmTextTwentyOne.elmTextTwentyOneThree_4,
    ],
    order: [
      EnOrder.texts,
      EnOrder.subtitles,
      //
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
  // page 4
  ElmModelNewOrder(
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneFour_1,
      ElmTextTwentyOne.elmTextTwentyOneFour_2,
    ],
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneFour_1,
      ElmTextTwentyOne.ayahHadithTwentyOneFour_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // page 5
  ElmModelNewOrder(
    subtitles: [
      ElmTextTwentyOne.subtitleTwentyOneFive_1,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneFive_1,
      ElmTextTwentyOne.elmTextTwentyOneFive_2,
      ElmTextTwentyOne.elmTextTwentyOneFive_3,
    ],
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneFive_1,
      ElmTextTwentyOne.ayahHadithTwentyOneFive_2,
      ElmTextTwentyOne.ayahHadithTwentyOneFive_3,
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
  // page 6
  ElmModelNewOrder(
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneSix_1,
      ElmTextTwentyOne.elmTextTwentyOneSix_2,
      ElmTextTwentyOne.elmTextTwentyOneSix_3,
    ],
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneSix_1,
      ElmTextTwentyOne.ayahHadithTwentyOneSix_2,
    ],
    order: [
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
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneSeven_1,
      ElmTextTwentyOne.ayahHadithTwentyOneSeven_2,
      ElmTextTwentyOne.ayahHadithTwentyOneSeven_3,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneSeven_1,
      ElmTextTwentyOne.elmTextTwentyOneSeven_2,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
    ],
  ),
  // page 8
  ElmModelNewOrder(
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneEight_1,
      ElmTextTwentyOne.elmTextTwentyOneEight_2,
      ElmTextTwentyOne.elmTextTwentyOneEight_3,
      ElmTextTwentyOne.elmTextTwentyOneEight_4,
    ],
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneEight_1,
      ElmTextTwentyOne.ayahHadithTwentyOneEight_2,
      ElmTextTwentyOne.ayahHadithTwentyOneEight_3,
    ],
    order: [
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
  // page 9 -- under edit
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneNine_1,
      ElmTextTwentyOne.ayahHadithTwentyOneNine_2,
      ElmTextTwentyOne.ayahHadithTwentyOneNine_3,
      ElmTextTwentyOne.ayahHadithTwentyOneNine_4,
      ElmTextTwentyOne.ayahHadithTwentyOneNine_5,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneNine_1,
      ElmTextTwentyOne.elmTextTwentyOneNine_2,
      ElmTextTwentyOne.elmTextTwentyOneNine_3,
      ElmTextTwentyOne.elmTextTwentyOneNine_4,
      ElmTextTwentyOne.elmTextTwentyOneNine_5,
    ],
    order: [
      //
      EnOrder.ayahs,
      EnOrder.texts,
      // 2
      EnOrder.ayahs,
      EnOrder.texts,
      // 3
      EnOrder.ayahs,
      EnOrder.texts,
      //4
      EnOrder.ayahs,
      EnOrder.texts,
      //5
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // page 10
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneTen_1,
      ElmTextTwentyOne.ayahHadithTwentyOneTen_2,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneTen_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // page 11
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneEleven_1,
      ElmTextTwentyOne.ayahHadithTwentyOneEleven_2,
      ElmTextTwentyOne.ayahHadithTwentyOneEleven_3,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneEleven_1,
      ElmTextTwentyOne.elmTextTwentyOneEleven_2,
      ElmTextTwentyOne.elmTextTwentyOneEleven_3,
    ],
    order: [
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
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneTwelve_1,
      ElmTextTwentyOne.elmTextTwentyOneTwelve_2,
      ElmTextTwentyOne.elmTextTwentyOneTwelve_3,
    ],
    subtitles: [
      ElmTextTwentyOne.subtitleTwentyOneTwelve_1,
    ],
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneTwelve_1,
      ElmTextTwentyOne.ayahHadithTwentyOneTwelve_2
    ],
    order: [
      EnOrder.texts,
      EnOrder.subtitles,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // page 13
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneThirteen_1,
      ElmTextTwentyOne.ayahHadithTwentyOneThirteen_2,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneThirteen_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
    ],
  ),

  // page 14
  ElmModelNewOrder(
    subtitles: [
      ElmTextTwentyOne.subtitleTwentyOneFourteen_1,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneFourteen_1,
      ElmTextTwentyOne.elmTextTwentyOneFourteen_2,
    ],
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneFourteen_1,
      ElmTextTwentyOne.ayahHadithTwentyOneFourteen_2,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // page 15
  ElmModelNewOrder(
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneFifteen_1,
      ElmTextTwentyOne.elmTextTwentyOneFifteen_2,
      ElmTextTwentyOne.elmTextTwentyOneFifteen_3,
    ],
    subtitles: [
      ElmTextTwentyOne.subtitleTwentyOneFifteen_1,
    ],
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneFifteen_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.subtitles,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
    ],
  ),
  // page 16 -- under editing
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneSixteen_1,
      ElmTextTwentyOne.ayahHadithTwentyOneSixteen_2,
      ElmTextTwentyOne.ayahHadithTwentyOneSixteen_3,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneSixteen_1,
      ElmTextTwentyOne.elmTextTwentyOneSixteen_2,
      ElmTextTwentyOne.elmTextTwentyOneSixteen_3,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // page 17
  ElmModelNewOrder(
    subtitles: [
      ElmTextTwentyOne.subtitleTwentyOnSeventeen_1,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneSeventeen_1,
      ElmTextTwentyOne.elmTextTwentyOneSeventeen_2,
      ElmTextTwentyOne.elmTextTwentyOneSeventeen_3,
    ],
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneSeventeen_1,
      ElmTextTwentyOne.ayahHadithTwentyOneSeventeen_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.subtitles,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
    ],
  ),

  // page 18
  ElmModelNewOrder(
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneEighteen_1,
      ElmTextTwentyOne.elmTextTwentyOneEighteen_2,
      ElmTextTwentyOne.elmTextTwentyOneEighteen_3,
    ],
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneEighteen_1,
      ElmTextTwentyOne.ayahHadithTwentyOneEighteen_2,
      ElmTextTwentyOne.ayahHadithTwentyOneEighteen_3,
    ],
    order: [
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
  // page 19
  ElmModelNewOrder(
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneNineteen_1,
      ElmTextTwentyOne.elmTextTwentyOneNineteen_2,
      ElmTextTwentyOne.elmTextTwentyOneNineteen_3,
    ],
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneNineteen_1,
      ElmTextTwentyOne.ayahHadithTwentyOneNineteen_2,
      ElmTextTwentyOne.ayahHadithTwentyOneNineteen_3,
    ],
    subtitles: [
      ElmTextTwentyOne.subtitleTwentyOneNineteen_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.subtitles,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // page 20
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneTwenty_1,
      ElmTextTwentyOne.ayahHadithTwentyOneTwenty_2,
      ElmTextTwentyOne.ayahHadithTwentyOneTwenty_3,
      ElmTextTwentyOne.ayahHadithTwentyOneTwenty_4,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneTwenty_1,
      ElmTextTwentyOne.elmTextTwentyOneTwenty_2,
      ElmTextTwentyOne.elmTextTwentyOneTwenty_3,
      ElmTextTwentyOne.elmTextTwentyOneTwenty_4,
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
      EnOrder.ayahs,
    ],
  ),
  // page 21
  ElmModelNewOrder(
    subtitles: [
      ElmTextTwentyOne.subtitleTwentyOneTwentyOne_1,
      ElmTextTwentyOne.subtitleTwentyOneTwentyOne_2,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneTwentyOne_1,
      ElmTextTwentyOne.elmTextTwentyOneTwentyOne_2,
      ElmTextTwentyOne.elmTextTwentyOneTwentyOne_3,
    ],
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneTwentyOne_1,
      ElmTextTwentyOne.ayahHadithTwentyOneTwentyOne_2,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.subtitles,
      //
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // page 22
  ElmModelNewOrder(
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneTwentyTwo_1,
      ElmTextTwentyOne.elmTextTwentyOneTwentyTwo_2,
      ElmTextTwentyOne.elmTextTwentyOneTwentyTwo_3,
    ],
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneTwentyTwo_1,
      ElmTextTwentyOne.ayahHadithTwentyOneTwentyTwo_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
    ],
  ),

// page 23
  ElmModelNewOrder(
    titles: [
      ElmTextTwentyOne.titleTwentyOneOne,
    ],
    subtitles: [
      ElmTextTwentyOne.subtitleTwentyOneTwentyThree_1,
    ],
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneTwentyThree_1,
      ElmTextTwentyOne.ayahHadithTwentyOneTwentyThree_2,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneTwentyThree_1,
      ElmTextTwentyOne.elmTextTwentyOneTwentyThree_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.subtitles,
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
      //
    ],
  ),
// page 24
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneTwentyFour_1,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneTwentyFour_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
// page 25
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneTwentyFive_1,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneTwentyFive_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
// page 26
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwentyOne.ayahHadithTwentyOneTwentySix_1,
      ElmTextTwentyOne.ayahHadithTwentyOneTwentySix_2,
    ],
    subtitles: [
      ElmTextTwentyOne.subtitleTwentyOneTwentySix_1,
    ],
    texts: [
      ElmTextTwentyOne.elmTextTwentyOneTwentySix_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.subtitles,
      EnOrder.texts,
      //
      EnOrder.ayahs,
    ],
  ),
];
