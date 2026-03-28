import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_thirty_one.dart';

List<ElmModelNewOrder> elmList31NewOrder = <ElmModelNewOrder>[
  // Page 1
  ElmModelNewOrder(
    titles: [
      ElmTextDersThirtyOne.titleThirtyOnePageOne_1,
    ],
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageOne_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),

  // Page 2
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageTwo_1,
      ElmTextDersThirtyOne.textThirtyOnePageTwo_2,
      ElmTextDersThirtyOne.textThirtyOnePageTwo_3,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),

  // Page 3
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageThree_1,
      ElmTextDersThirtyOne.textThirtyOnePageThree_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),

  // Page 4
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageFour_1,
      ElmTextDersThirtyOne.textThirtyOnePageFour_2,
    ],
    ayahs: [
      ElmTextDersThirtyOne.ayahHadithThirtyOnePageFour_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // Page 5
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageFive_1,
      ElmTextDersThirtyOne.textThirtyOnePageFive_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),

  // Page 6
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageSix_1,
    ],
    ayahs: [
      ElmTextDersThirtyOne.ayahHadithThirtyOnePageSix_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // Page 7
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageSeven_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

  // Page 8
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageEight_1,
      ElmTextDersThirtyOne.textThirtyOnePageEight_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),

  // Page 9
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageNine_1,
      ElmTextDersThirtyOne.textThirtyOnePageNine_2,
    ],
    ayahs: [
      ElmTextDersThirtyOne.ayahHadithThirtyOnePageNine_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // Page 10
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageTen_1,
    ],
    order: [
      EnOrder.texts,
    ],
  ),
];
