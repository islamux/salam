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
    titles: [
      ElmTextDersThirtyOne.titleThirtyOnePageTwo_1,
    ],
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageTwo_2,
      ElmTextDersThirtyOne.textThirtyOnePageTwo_3,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),

  // Page 3
  ElmModelNewOrder(
    titles: [
      ElmTextDersThirtyOne.titleThirtyOnePageThree_1,
    ],
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageThree_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),

  // Page 4
  ElmModelNewOrder(
    titles: [
      ElmTextDersThirtyOne.titleThirtyOnePageFour_1,
    ],
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageFour_2,
    ],
    ayahs: [
      ElmTextDersThirtyOne.ayahHadithThirtyOnePageFour_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // Page 5
  ElmModelNewOrder(
    titles: [
      ElmTextDersThirtyOne.titleThirtyOnePageFive_1,
    ],
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageFive_2,
    ],
    order: [
      EnOrder.titles,
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
    titles: [
      ElmTextDersThirtyOne.titleThirtyOnePageEight_1,
    ],
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageEight_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),

  // Page 9
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyOne.textThirtyOnePageNine_1,
      ElmTextDersThirtyOne.textThirtyOnePageNine_2,
      ElmTextDersThirtyOne.ayahHadithThirtyOnePageNine_1,
      ElmTextDersThirtyOne.textThirtyOnePageTen_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),
];
