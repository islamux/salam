// TextDers5
import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/core/data/static/text/khatira_text_ders_five.dart';

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
      KhatiraTextDersFive.elmTextFiveOne_1,
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
      KhatiraTextDersFive.elmTextFiveTwo_1,
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
      KhatiraTextDersFive.elmTextFiveThree_1,
      KhatiraTextDersFive.elmTextFiveThree_2,
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
  KhatiraModelNewOrder(texts: [KhatiraTextDersFive.elmTextFiveFour_1], order: [EnOrder.texts, ]),
  // 5
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersFive.elmTextsFiveFive_1,
      KhatiraTextDersFive.elmTextsFiveFive_2,
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
  KhatiraModelNewOrder(texts: [KhatiraTextDersFive.elmTextFiveSix_1], order: [EnOrder.texts, ]),
  // 7
  KhatiraModelNewOrder(texts: [KhatiraTextDersFive.elmTextFiveSeven_1], order: [EnOrder.texts, ]),
  // 8
  KhatiraModelNewOrder(texts: [KhatiraTextDersFive.elmTextFiveEight_1], order: [EnOrder.texts, ]),
  // 9
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersFive.elmTextFiveNine_1,
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
      KhatiraTextDersFive.elmTextFiveTen_1,
      KhatiraTextDersFive.elmTextFiveTen_2,
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
      KhatiraTextDersFive.elmTextFiveEleven_1,
      KhatiraTextDersFive.elmTextFiveEleven_2,
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
      KhatiraTextDersFive.elmTextFiveTwelve_1,
      KhatiraTextDersFive.elmTextFiveTwelve_2,
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
