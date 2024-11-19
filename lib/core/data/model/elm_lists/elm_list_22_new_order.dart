//TextDersSixTeen

import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_twenty_two.dart';

// TextDersSeventeen
List<ElmModelNewOrder> elmList22NewOrder = [
  // PageOne
  ElmModelNewOrder(
    texts: [
      ElmTextTwentyTwo.elmTextTwentyTwoPageOne_1,
      ElmTextTwentyTwo.elmTextTwentyTwoPageOne_2,
    ],
    ayahs: [
      ElmTextTwentyTwo.elmTextTwentyTwoPageTwo_1,
      ElmTextTwentyTwo.elmTextTwentyTwoPageTwo_2,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // PageTwo
  ElmModelNewOrder(
    subtitles: [
      ElmTextTwentyTwo.subtitleTwentyTwoPageTwo_1,
    ],
    texts: [
      ElmTextTwentyTwo.elmTextTwentyTwoPageTwo_1,
      ElmTextTwentyTwo.elmTextTwentyTwoPageTwo_2,
      ElmTextTwentyTwo.elmTextTwentyTwoPageTwo_3,
    ],
    ayahs: [
      ElmTextTwentyTwo.ayahHadithTwentyTwoPageTwo_1,
      ElmTextTwentyTwo.ayahHadithTwentyTwoPageTwo_2,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // PageThree
  ElmModelNewOrder(
    titles: [],
    texts: [],
    ayahs: [],
    order: [],
  ),

  // PageFour
  ElmModelNewOrder(
    texts: [],
    subtitles: [],
    ayahs: [],
    order: [],
  ),

  // PageFive
  ElmModelNewOrder(
    subtitles: [],
    texts: [],
    ayahs: [],
    order: [],
  ),

  // PageSix
  ElmModelNewOrder(
    ayahs: [],
    texts: [],
    subtitles: [],
    order: [],
  ),

  // PageSeven
  ElmModelNewOrder(
    texts: [],
    ayahs: [],
    order: [],
  ),

  // PageEight
  ElmModelNewOrder(
    texts: [],
    ayahs: [],
    order: [],
  ),

  // PageNine
  ElmModelNewOrder(
    ayahs: [],
    titles: [],
    texts: [],
    order: [],
  ),

  // PageTen
  ElmModelNewOrder(
    ayahs: [],
    texts: [],
    order: [],
  ),

  // PageEleven
  ElmModelNewOrder(
    titles: [],
    texts: [],
    ayahs: [],
    order: [],
  ),

  // PageTwelve
  ElmModelNewOrder(
    titles: [],
    texts: [],
    ayahs: [],
    order: [],
  ),
  // PageThirteen
  ElmModelNewOrder(
    titles: [],
    ayahs: [],
    texts: [],
    subtitles: [],
    order: [],
  ),

  // PageFourteen
  ElmModelNewOrder(
    titles: [],
    texts: [],
    subtitles: [],
    order: [],
  ),

  // PageFifteen
  ElmModelNewOrder(
    titles: [],
    texts: [],
    subtitles: [],
    ayahs: [],
    order: [],
  ),

  // PageSixteen
  ElmModelNewOrder(
    titles: [],
    texts: [],
    ayahs: [],
    order: [],
  ),
];
