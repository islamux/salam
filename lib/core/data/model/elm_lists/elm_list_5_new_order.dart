import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_five.dart';

List<ElmModelNewOrder> elmList5NewOrder = [
//  page 1
  ElmModelNewOrder(
    titles: [
      ElmTextDersFive.titleFiveOne,
    ],
    ayahs: [
      ElmTextDersFive.ayahHadithFiveOne_1,
    ],
    texts: [
      ElmTextDersFive.elmTextFiveOne_1,
    ],
    footer: ElmTextDersFive.footerFiveOne,
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.footer,
    ],
  ),

//  page 2
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersFive.ayahHadithFiveTwo_1,
      ElmTextDersFive.ayahHadithFiveTwo_2,
    ],
    texts: [
      ElmTextDersFive.elmTextFiveTwo_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

//  page 3
  ElmModelNewOrder(
    texts: [
      ElmTextDersFive.elmTextFiveThree_1,
      ElmTextDersFive.elmTextFiveThree_2,
    ],
    ayahs: [
      ElmTextDersFive.ayahHadithFiveThree_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

//  page 4
  ElmModelNewOrder(
    texts: [
      ElmTextDersFive.elmTextFiveFour_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

//  page 5
  ElmModelNewOrder(
    texts: [
      ElmTextDersFive.elmTextsFiveFive_1,
      ElmTextDersFive.elmTextsFiveFive_2,
    ],
    ayahs: [
      ElmTextDersFive.ayahHadithFiveFive_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

//  page 6
  ElmModelNewOrder(
    texts: [
      ElmTextDersFive.elmTextFiveSix_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

//  page 7
  ElmModelNewOrder(
    texts: [
      ElmTextDersFive.elmTextFiveSeven_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

//  page 8
  ElmModelNewOrder(
    texts: [
      ElmTextDersFive.elmTextFiveEight_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

//  page 9
  ElmModelNewOrder(
    texts: [
      ElmTextDersFive.elmTextFiveNine_1,
    ],
    ayahs: [
      ElmTextDersFive.ayahHadithFiveNine_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

//  page 10
  ElmModelNewOrder(
    texts: [
      ElmTextDersFive.elmTextFiveTen_1,
      ElmTextDersFive.elmTextFiveTen_2,
    ],
    ayahs: [
      ElmTextDersFive.ayahHadithFiveTen_1,
      ElmTextDersFive.ayahHadithFiveTen_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

//  page 11
  ElmModelNewOrder(
    texts: [
      ElmTextDersFive.elmTextFiveEleven_1,
      ElmTextDersFive.elmTextFiveEleven_2,
    ],
    ayahs: [
      ElmTextDersFive.ayahHadithFiveEleven_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

//  page 12
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersFive.subtitleFiveTwelve_1,
    ],
    texts: [
      ElmTextDersFive.elmTextFiveTwelve_1,
      ElmTextDersFive.elmTextFiveTwelve_2,
    ],
    ayahs: [
      ElmTextDersFive.ayahHadithFiveTwelve_1,
      ElmTextDersFive.ayahHadithFiveTwelve_2,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
];
