// TextDers31
import 'package:khatir/core/data/model/khatira_model_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/features/khatira/data/static/text/khatira_text_ders_thirty_one.dart';

List<KhatiraModelOrder> khatiraList31Order = [
  // 1
  KhatiraModelOrder(
    titles: [
      KhatiraTextDersThirtyOne.titleThirtyOnePageOne_1,
    ],
    texts: [
      KhatiraTextDersThirtyOne.textThirtyOnePageOne_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),
  // 2
  KhatiraModelOrder(
    titles: [
      KhatiraTextDersThirtyOne.titleThirtyOnePageTwo_1,
    ],
    texts: [
      KhatiraTextDersThirtyOne.textThirtyOnePageTwo_2,
      KhatiraTextDersThirtyOne.textThirtyOnePageTwo_3,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),
  // 3
  KhatiraModelOrder(
    titles: [
      KhatiraTextDersThirtyOne.titleThirtyOnePageThree_1,
    ],
    texts: [
      KhatiraTextDersThirtyOne.textThirtyOnePageThree_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),
  // 4
  KhatiraModelOrder(
    titles: [
      KhatiraTextDersThirtyOne.titleThirtyOnePageFour_1,
    ],
    texts: [
      KhatiraTextDersThirtyOne.textThirtyOnePageFour_2,
    ],
    ayahs: [
      KhatiraTextDersThirtyOne.ayahHadithThirtyOnePageFour_1,
    ],
    footer: KhatiraTextDersThirtyOne.footerThirtyOnePageFour_1,
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.footer,
    ],
  ),
  // 5
  KhatiraModelOrder(
    titles: [
      KhatiraTextDersThirtyOne.titleThirtyOnePageFive_1,
    ],
    texts: [
      KhatiraTextDersThirtyOne.textThirtyOnePageFive_2,
    ],
    ayahs: [
      KhatiraTextDersThirtyOne.ayahThirtyOnePageFive_1,
    ],
    footer: KhatiraTextDersThirtyOne.footerThirtyOnePageFive_1,
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.footer,
    ],
  ),
  // 6
  KhatiraModelOrder(
    texts: [
      KhatiraTextDersThirtyOne.textThirtyOnePageSix_1,
    ],
    ayahs: [
      KhatiraTextDersThirtyOne.ayahHadithThirtyOnePageSix_1,
    ],
    footer: KhatiraTextDersThirtyOne.footerThirtyOnePageSix_1,
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.footer,
    ],
  ),
  // 7
  KhatiraModelOrder(texts: [KhatiraTextDersThirtyOne.textThirtyOnePageSeven_1], order: [EnOrder.texts, ]),
  // 8
  KhatiraModelOrder(
    titles: [
      KhatiraTextDersThirtyOne.titleThirtyOnePageEight_1,
    ],
    texts: [
      KhatiraTextDersThirtyOne.textThirtyOnePageEight_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
  ),
  // 9
  KhatiraModelOrder(
    texts: [
      KhatiraTextDersThirtyOne.textThirtyOnePageNine_1,
      KhatiraTextDersThirtyOne.textThirtyOnePageNine_2,
      KhatiraTextDersThirtyOne.textThirtyOnePageNine_3,
    ],
    ayahs: [
      KhatiraTextDersThirtyOne.ayahHadithThirtyOnePageNine_1,
    ],
    footer: KhatiraTextDersThirtyOne.footerThirtyOnePageNine_1,
    order: [
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.footer,
    ],
  ),
];
