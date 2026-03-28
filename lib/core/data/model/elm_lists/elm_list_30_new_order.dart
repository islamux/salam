import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_thirty.dart';

List<ElmModelNewOrder> elmList30NewOrder = <ElmModelNewOrder>[
  // Page 1
  ElmModelNewOrder(
    titles: [
      ElmTextDersThirty.titleThirtyPageOne_1,
    ],
    texts: [
      ElmTextDersThirty.textThirtyPageOne_1,
      ElmTextDersThirty.textThirtyPageOne_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),

  // Page 2
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirty.textThirtyPageTwo_1,
      ElmTextDersThirty.textThirtyPageTwo_2,
      ElmTextDersThirty.textThirtyPageTwo_3,
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
      ElmTextDersThirty.textThirtyPageThree_1,
    ],
    ayahs: [
      ElmTextDersThirty.ayahHadithThirtyPageThree_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // Page 4
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirty.textThirtyPageFour_1,
      ElmTextDersThirty.textThirtyPageFour_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),

  // Page 5
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirty.textThirtyPageFive_1,
      ElmTextDersThirty.textThirtyPageFive_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),
];
