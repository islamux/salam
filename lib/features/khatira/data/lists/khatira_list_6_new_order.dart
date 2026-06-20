// TextDers6
import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/features/khatira/data/static/text/khatira_text_ders_six.dart';

List<KhatiraModelNewOrder> khatiraList6NewOrder = [
  // 1
  KhatiraModelNewOrder(
    titles: [
      KhatiraTextDersSix.titleSixOne,
      KhatiraTextDersSix.titleSixTwo_1,
    ],
    texts: [
      KhatiraTextDersSix.khatiraTextSixOne_1,
      KhatiraTextDersSix.khatiraTextSixTwo_1,
    ],
    ayahs: [
      KhatiraTextDersSix.ayahHadithSixOne_1,
      KhatiraTextDersSix.ayahHadithSixTwo_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // 2
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersSix.khatiraTextSixThree_1,
      KhatiraTextDersSix.khatiraTextSixThree_2,
    ],
    ayahs: [
      KhatiraTextDersSix.ayahHadithSixThree_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // 3
  KhatiraModelNewOrder(texts: [
    KhatiraTextDersSix.khatiraTextSixFour_1
  ], order: [
    EnOrder.texts,
  ]),
  // 4
  KhatiraModelNewOrder(
    titles: [
      KhatiraTextDersSix.titleSixFive,
    ],
    ayahs: [
      KhatiraTextDersSix.ayahHadithSixFive_1,
    ],
    texts: [
      KhatiraTextDersSix.khatiraTextSixFive_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
];
