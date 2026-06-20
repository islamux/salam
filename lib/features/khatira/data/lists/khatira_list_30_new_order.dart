// TextDers30
import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/features/khatira/data/static/text/khatira_text_ders_thirty.dart';

List<KhatiraModelNewOrder> khatiraList30NewOrder = [
  // 1
  KhatiraModelNewOrder(
    titles: [
      KhatiraTextDersThirty.titleThirtyPageOne_1,
    ],
    texts: [
      KhatiraTextDersThirty.textThirtyPageOne_1,
      KhatiraTextDersThirty.textThirtyPageOne_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),
  // 2
  KhatiraModelNewOrder(texts: [
    KhatiraTextDersThirty.textThirtyPageTwo_1,
    KhatiraTextDersThirty.textThirtyPageTwo_2,
    KhatiraTextDersThirty.textThirtyPageTwo_3
  ], order: [
    EnOrder.texts,
    EnOrder.texts,
    EnOrder.texts,
  ]),
  // 3
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersThirty.textThirtyPageThree_1,
    ],
    ayahs: [
      KhatiraTextDersThirty.ayahHadithThirtyPageThree_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // 4
  KhatiraModelNewOrder(texts: [
    KhatiraTextDersThirty.textThirtyPageFour_1,
    KhatiraTextDersThirty.textThirtyPageFour_2
  ], order: [
    EnOrder.texts,
    EnOrder.texts,
  ]),
  // 5
  KhatiraModelNewOrder(texts: [
    KhatiraTextDersThirty.textThirtyPageFive_1,
    KhatiraTextDersThirty.textThirtyPageFive_2
  ], order: [
    EnOrder.texts,
    EnOrder.texts,
  ]),
];
