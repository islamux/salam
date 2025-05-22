// khatira 10
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_ten.dart';

List<ElmModelNewOrder> elmList10NewOrder = [
  // 1
  ElmModelNewOrder(
    titles: [
      ElmTextDersTen.titleTenOne,
    ],
    texts: [
      ElmTextDersTen.elmTexTenOne_1,
      ElmTextDersTen.elmTextTenOne_2,
      ElmTextDersTen.elmTextTenOne_3,
    ],
    ayahs: [
      ElmTextDersTen.ayahHadithTenOne_1,
      ElmTextDersTen.ayahHadithTenOne_2,
    ],
    order: [
      EnOrder.titles,
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
  // 2
  ElmModelNewOrder(
    ayahs: [ElmTextDersTen.ayahHadithTenTwo_1],
    texts: [
      ElmTextDersTen.elmTextTenTwo_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // 3
  ElmModelNewOrder(
    titles: [
      ElmTextDersTen.titleTenThree_1,
    ],
    ayahs: [
      ElmTextDersTen.ayahHadithTenThree_1,
      ElmTextDersTen.ayahHadithTenThree_2,
    ],
    texts: [
      ElmTextDersTen.elmTextTenThree_1,
      ElmTextDersTen.elmTextTenThree_2,
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

  // 4
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersTen.ayahHadithTenFour_1,
    ],
    texts: [
      ElmTextDersTen.elmTextTenFour_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),

  // 5
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersTen.ayahHadithTenFive_1,
      ElmTextDersTen.ayahHadithTenFive_2,
    ],
    texts: [
      ElmTextDersTen.elmTextTenFive_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // 6
  ElmModelNewOrder(
    texts: [
      ElmTextDersTen.elmTextTenSix_1,
    ],
    ayahs: [
      ElmTextDersTen.ayahHadithTenSix_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // 7
  ElmModelNewOrder(
    texts: [
      ElmTextDersTen.elmTextTenSeven_1,
      ElmTextDersTen.elmTextTenSeven_2,
      ElmTextDersTen.elmTextTenSeven_3,
    ],
    ayahs: [
      ElmTextDersTen.ayahHadithTenSeven_1,
      ElmTextDersTen.ayahHadithTenSeven_2,
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
  )
];
