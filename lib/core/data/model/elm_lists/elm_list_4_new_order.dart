import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_four.dart';

List<ElmModelNewOrder> elmList4NewOrder = [
  // page 1
  ElmModelNewOrder(
    titles: [
      ElmTextDersFour.titleFourOne,
    ],
    texts: [
      ElmTextDersFour.elmTextFourOne_1,
    ],
    ayahs: [
      ElmTextDersFour.ayahHadithFourOne_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // page 2
  ElmModelNewOrder(
    texts: [
      ElmTextDersFour.elmTextFourTwo_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

  // page 3
  ElmModelNewOrder(
    texts: [
      ElmTextDersFour.elmTextFourThree_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),
  // page 4
  ElmModelNewOrder(
    texts: [
      ElmTextDersFour.elmTextFourFour_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),
  // page 5
  ElmModelNewOrder(
    texts: [
      ElmTextDersFour.elmTextFourFive_1,
      ElmTextDersFour.elmTextFourFive_2,
    ],
    ayahs: [
      ElmTextDersFour.ayahHadithFourFive_1,
      ElmTextDersFour.ayahHadithFourFive_2,
    ],
    footer: ElmTextDersFour.footerFourFive,
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.footer,
    ],
  ),
  // page 6
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersFour.subtitleFourSix_1,
    ],
    texts: [ElmTextDersFour.elmTextFourSix_1],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
    ],
  ),
  // page 7
  ElmModelNewOrder(
    texts: [
      ElmTextDersFour.elmTextFourSeven_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),
  // page 8
  ElmModelNewOrder(
    texts: [
      ElmTextDersFour.elmTextFourEight_1,
      ElmTextDersFour.elmTextFourEight_2
    ],
    ayahs: [
      ElmTextDersFour.ayahHadithFourEight_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // page 9
  ElmModelNewOrder(
    texts: [
      ElmTextDersFour.elmTextFourNine_1,
    ],
    ayahs: [
      ElmTextDersFour.ayahHadithFourNine_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // page 10
  ElmModelNewOrder(
    titles: [
      ElmTextDersFour.titleFourTen_1,
    ],
    texts: [
      ElmTextDersFour.elmTextFourTen_1,
    ],
    ayahs: [ElmTextDersFour.ayahHadithFourTen_1],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
];
