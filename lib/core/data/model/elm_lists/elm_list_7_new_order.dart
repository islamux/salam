// TextDersSeven
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_seven.dart';

List<ElmModelNewOrder> elmList7NewOrder = [
  // page 1
  ElmModelNewOrder(
    titles: [
      ElmTextDersSeven.titleSevenOne,
    ],
    texts: [
      ElmTextDersSeven.elmTextSevenOne_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),

  // page 2
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeven.elmTextSevenTwo_1,
    ],
    ayahs: [
      ElmTextDersSeven.ayahHadithSevenTwo_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // page 3
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeven.elmTextSevenThree_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

  // page 4
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeven.elmTextSevenFour_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

  // page 5
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeven.elmTextSevenFive_1,
    ],
    ayahs: [
      ElmTextDersSeven.ayahHadithSevenFive_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // page 6
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersSeven.ayahHadithSevenSix_1,
    ],
    texts: [
      ElmTextDersSeven.elmTextSevenSix_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // page 7
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeven.elmTextSevenSeven_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

  // page 8
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeven.elmTextSevenEight_1,
      ElmTextDersSeven.elmTextSevenEight_2,
    ],
    ayahs: [
      ElmTextDersSeven.ayahHadithSevenEight_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // page 9
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersSeven.ayahHadithSevenNine_1,
    ],
    footer: ElmTextDersSeven.footerSevenNine,
    order: [
      EnOrder.ayahs,
      EnOrder.footer,
    ],
  ),

  // page 10
  ElmModelNewOrder(
    titles: [
      ElmTextDersSeven.titleSevenTen,
    ],
    ayahs: [
      ElmTextDersSeven.ayahHadithSevenTen_1,
      ElmTextDersSeven.ayahHadithSevenTen_2,
      ElmTextDersSeven.ayahHadithSevenTen_3,
    ],
    texts: [
      ElmTextDersSeven.elmTextSevenTen_1,
      ElmTextDersSeven.elmTextSevenTen_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
    ],
  ),

  // page 11
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeven.elmTextSevenEleven_1,
      ElmTextDersSeven.elmTextSevenEleven_2,
      ElmTextDersSeven.elmTextSevenEleven_3,
    ],
    ayahs: [
      ElmTextDersSeven.ayahHadithSevenEleven_1,
      ElmTextDersSeven.ayahHadithSevenEleven_2,
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
];
