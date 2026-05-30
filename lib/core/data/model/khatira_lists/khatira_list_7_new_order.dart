// TextDers7
import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/core/data/static/text/khatira_text_ders_seven.dart';

List<KhatiraModelNewOrder> khatiraList7NewOrder = [
  // 1
  KhatiraModelNewOrder(
    titles: [
      KhatiraTextDersSeven.titleSevenOne,
    ],
    texts: [
      KhatiraTextDersSeven.elmTextSevenOne_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),
  // 2
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersSeven.elmTextSevenTwo_1,
    ],
    ayahs: [
      KhatiraTextDersSeven.ayahHadithSevenTwo_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // 3
  KhatiraModelNewOrder(texts: [KhatiraTextDersSeven.elmTextSevenThree_1], order: [EnOrder.texts, ]),
  // 4
  KhatiraModelNewOrder(texts: [KhatiraTextDersSeven.elmTextSevenFour_1], order: [EnOrder.texts, ]),
  // 5
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersSeven.elmTextSevenFive_1,
    ],
    ayahs: [
      KhatiraTextDersSeven.ayahHadithSevenFive_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // 6
  KhatiraModelNewOrder(
    ayahs: [
      KhatiraTextDersSeven.ayahHadithSevenSix_1,
    ],
    texts: [
      KhatiraTextDersSeven.elmTextSevenSix_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // 7
  KhatiraModelNewOrder(texts: [KhatiraTextDersSeven.elmTextSevenSeven_1], order: [EnOrder.texts, ]),
  // 8
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersSeven.elmTextSevenEight_1,
      KhatiraTextDersSeven.elmTextSevenEight_2,
    ],
    ayahs: [
      KhatiraTextDersSeven.ayahHadithSevenEight_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // 9
  KhatiraModelNewOrder(
    ayahs: [
      KhatiraTextDersSeven.ayahHadithSevenNine_1,
    ],
    footer: KhatiraTextDersSeven.footerSevenNine,
    order: [
      EnOrder.ayahs,
      EnOrder.footer,
    ],
  ),
  // 10
  KhatiraModelNewOrder(
    titles: [
      KhatiraTextDersSeven.titleSevenTen,
    ],
    ayahs: [
      KhatiraTextDersSeven.ayahHadithSevenTen_1,
      KhatiraTextDersSeven.ayahHadithSevenTen_2,
      KhatiraTextDersSeven.ayahHadithSevenTen_3,
    ],
    texts: [
      KhatiraTextDersSeven.elmTextSevenTen_1,
      KhatiraTextDersSeven.elmTextSevenTen_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // 11
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersSeven.elmTextSevenEleven_1,
      KhatiraTextDersSeven.elmTextSevenEleven_2,
      KhatiraTextDersSeven.elmTextSevenEleven_3,
    ],
    ayahs: [
      KhatiraTextDersSeven.ayahHadithSevenEleven_1,
      KhatiraTextDersSeven.ayahHadithSevenEleven_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
];
