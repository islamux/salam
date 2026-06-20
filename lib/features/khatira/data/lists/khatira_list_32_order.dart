// TextDers32
import 'package:khatir/core/data/model/khatira_model_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/features/khatira/data/static/text/khatira_text_ders_thirty_two.dart';

List<KhatiraModelOrder> khatiraList32Order = [
  // 1
  KhatiraModelOrder(
    titles: [
      KhatiraTextDersThirtyTwo.titleThirtyTwoOne,
    ],
    texts: [
      KhatiraTextDersThirtyTwo.textThirtyTwoOne,
    ],
    ayahs: [
      KhatiraTextDersThirtyTwo.ayahThirtyTwoOne,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // 2
  KhatiraModelOrder(
    texts: [
      KhatiraTextDersThirtyTwo.textThirtyTwoTwo,
    ],
    ayahs: [
      KhatiraTextDersThirtyTwo.ayahThirtyTwoTwo,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // 3
  KhatiraModelOrder(texts: [KhatiraTextDersThirtyTwo.textThirtyTwoThree], order: [EnOrder.texts, ]),
  // 4
  KhatiraModelOrder(
    texts: [
      KhatiraTextDersThirtyTwo.textThirtyTwoFour,
    ],
    ayahs: [
      KhatiraTextDersThirtyTwo.ayahThirtyTwoFour,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // 5
  KhatiraModelOrder(texts: [KhatiraTextDersThirtyTwo.textThirtyTwoFive], order: [EnOrder.texts, ]),
  // 6
  KhatiraModelOrder(texts: [KhatiraTextDersThirtyTwo.textThirtyTwoSix], order: [EnOrder.texts, ]),
  // 7
  KhatiraModelOrder(texts: [KhatiraTextDersThirtyTwo.textThirtyTwoSeven], order: [EnOrder.texts, ]),
  // 8
  KhatiraModelOrder(texts: [KhatiraTextDersThirtyTwo.textThirtyTwoEight], order: [EnOrder.texts, ]),
  // 9
  KhatiraModelOrder(texts: [KhatiraTextDersThirtyTwo.textThirtyTwoNine], order: [EnOrder.texts, ]),
];
