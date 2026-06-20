// TextDers7
import 'package:khatir/core/data/model/khatira_model_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/features/khatira/data/static/text/khatira_text_ders_seven.dart';

List<KhatiraModelOrder> khatiraList7Order = [
  // 1
  KhatiraModelOrder(
    titles: [
      KhatiraTextDersSeven.titleSevenOne,
    ],
    texts: [
      KhatiraTextDersSeven.khatiraTextSevenOne_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),
  // 2
  KhatiraModelOrder(
    texts: [
      KhatiraTextDersSeven.khatiraTextSevenTwo_1,
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
  KhatiraModelOrder(texts: [KhatiraTextDersSeven.khatiraTextSevenThree_1], order: [EnOrder.texts, ]),
  // 4
  KhatiraModelOrder(texts: [KhatiraTextDersSeven.khatiraTextSevenFour_1], order: [EnOrder.texts, ]),
  // 5
  KhatiraModelOrder(
    texts: [
      KhatiraTextDersSeven.khatiraTextSevenFive_1,
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
  KhatiraModelOrder(
    ayahs: [
      KhatiraTextDersSeven.ayahHadithSevenSix_1,
    ],
    texts: [
      KhatiraTextDersSeven.khatiraTextSevenSix_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // 7
  KhatiraModelOrder(texts: [KhatiraTextDersSeven.khatiraTextSevenSeven_1], order: [EnOrder.texts, ]),
  // 8
  KhatiraModelOrder(
    texts: [
      KhatiraTextDersSeven.khatiraTextSevenEight_1,
      KhatiraTextDersSeven.khatiraTextSevenEight_2,
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
  KhatiraModelOrder(
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
  KhatiraModelOrder(
    titles: [
      KhatiraTextDersSeven.titleSevenTen,
    ],
    ayahs: [
      KhatiraTextDersSeven.ayahHadithSevenTen_1,
      KhatiraTextDersSeven.ayahHadithSevenTen_2,
      KhatiraTextDersSeven.ayahHadithSevenTen_3,
    ],
    texts: [
      KhatiraTextDersSeven.khatiraTextSevenTen_1,
      KhatiraTextDersSeven.khatiraTextSevenTen_2,
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
  KhatiraModelOrder(
    texts: [
      KhatiraTextDersSeven.khatiraTextSevenEleven_1,
      KhatiraTextDersSeven.khatiraTextSevenEleven_2,
      KhatiraTextDersSeven.khatiraTextSevenEleven_3,
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
