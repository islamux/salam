import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_thirty_two.dart';

List<ElmModelNewOrder> elmList32NewOrder = [
  // page 1 - from elm 18 page 29
  ElmModelNewOrder(
    titles: [
      ElmTextDersThirtyTwo.titleThirtyTwoOne,
    ],
    texts: [
      ElmTextDersThirtyTwo.textThirtyTwoOne,
    ],
    ayahs: [
      ElmTextDersThirtyTwo.ayahThirtyTwoOne,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // page 2 - from elm 18 page 30
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyTwo.textThirtyTwoTwo,
    ],
    ayahs: [
      ElmTextDersThirtyTwo.ayahThirtyTwoTwo,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),

  // page 3 - from elm 18 page 31
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyTwo.textThirtyTwoThree,
      ElmTextDersThirtyTwo.textThirtyTwoFour,
      ElmTextDersThirtyTwo.textThirtyTwoFive,
      ElmTextDersThirtyTwo.textThirtyTwoSix,
    ],
    ayahs: [
      ElmTextDersThirtyTwo.ayahThirtyTwoFour,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),

  // page 4 - from elm 18 page 32
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyTwo.textThirtyTwoSeven,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

  // page 5 - from elm 18 page 33
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyTwo.textThirtyTwoEight,
    ],
    order: [
      EnOrder.texts,
    ],
  ),

  // page 6 - from elm 18 page 34
  ElmModelNewOrder(
    texts: [
      ElmTextDersThirtyTwo.textThirtyTwoNine,
    ],
    order: [
      EnOrder.texts,
    ],
  ),
];
