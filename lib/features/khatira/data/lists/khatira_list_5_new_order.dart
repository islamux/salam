// TextDers5
import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/features/khatira/data/static/text/khatira_text_ders_five.dart';

List<KhatiraModelNewOrder> khatiraList5NewOrder = [
  // 1
  KhatiraModelNewOrder(
    titles: [
      KhatiraTextDersFive.titleFiveOne,
    ],
    ayahs: [
      KhatiraTextDersFive.ayahHadithFiveOne_1,
    ],
    texts: [
      KhatiraTextDersFive.khatiraTextFiveOne_1,
    ],
    footer: KhatiraTextDersFive.footerFiveOne,
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.footer,
    ],
  ),
  // 2
  KhatiraModelNewOrder(
    ayahs: [
      KhatiraTextDersFive.ayahHadithFiveTwo_1,
      KhatiraTextDersFive.ayahHadithFiveTwo_2,
    ],
    texts: [
      KhatiraTextDersFive.khatiraTextFiveTwo_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // 3
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersFive.khatiraTextFiveThree_1,
      KhatiraTextDersFive.khatiraTextFiveThree_2,
    ],
    ayahs: [
      KhatiraTextDersFive.ayahHadithFiveThree_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // 4
  KhatiraModelNewOrder(texts: [
    KhatiraTextDersFive.khatiraTextFiveFour_1
  ], order: [
    EnOrder.texts,
  ]),
  // 5
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersFive.khatiraTextsFiveFive_1,
      KhatiraTextDersFive.khatiraTextsFiveFive_2,
    ],
    ayahs: [
      KhatiraTextDersFive.ayahHadithFiveFive_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // 6
  KhatiraModelNewOrder(texts: [
    KhatiraTextDersFive.khatiraTextFiveSix_1
  ], order: [
    EnOrder.texts,
  ]),
  // 7
  KhatiraModelNewOrder(texts: [
    KhatiraTextDersFive.khatiraTextFiveSeven_1
  ], order: [
    EnOrder.texts,
  ]),
  // 8
  KhatiraModelNewOrder(texts: [
    KhatiraTextDersFive.khatiraTextFiveEight_1
  ], order: [
    EnOrder.texts,
  ]),
  // 9
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersFive.khatiraTextFiveNine_1,
    ],
    ayahs: [
      KhatiraTextDersFive.ayahHadithFiveNine_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // 10
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersFive.khatiraTextFiveTen_1,
      KhatiraTextDersFive.khatiraTextFiveTen_2,
    ],
    ayahs: [
      KhatiraTextDersFive.ayahHadithFiveTen_1,
      KhatiraTextDersFive.ayahHadithFiveTen_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // 11
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersFive.khatiraTextFiveEleven_1,
      KhatiraTextDersFive.khatiraTextFiveEleven_2,
    ],
    ayahs: [
      KhatiraTextDersFive.ayahHadithFiveEleven_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // 12
  KhatiraModelNewOrder(
    subtitles: [
      KhatiraTextDersFive.subtitleFiveTwelve_1,
    ],
    ayahs: [
      KhatiraTextDersFive.ayahHadithFiveTwelve_1,
      KhatiraTextDersFive.ayahHadithFiveTwelve_2,
    ],
    texts: [
      KhatiraTextDersFive.khatiraTextFiveTwelve_1,
      KhatiraTextDersFive.khatiraTextFiveTwelve_2,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
];
