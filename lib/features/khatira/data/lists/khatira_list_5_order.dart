// TextDers5
import 'package:khatir/core/data/model/khatira_model_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/features/khatira/data/static/text/khatira_text_ders_five.dart';

List<KhatiraModelOrder> khatiraList5Order = [
  // 1
  KhatiraModelOrder(
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
  KhatiraModelOrder(
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
  KhatiraModelOrder(
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
  KhatiraModelOrder(texts: [KhatiraTextDersFive.khatiraTextFiveFour_1], order: [EnOrder.texts, ]),
  // 5
  KhatiraModelOrder(
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
  KhatiraModelOrder(texts: [KhatiraTextDersFive.khatiraTextFiveSix_1], order: [EnOrder.texts, ]),
  // 7
  KhatiraModelOrder(texts: [KhatiraTextDersFive.khatiraTextFiveSeven_1], order: [EnOrder.texts, ]),
  // 8
  KhatiraModelOrder(texts: [KhatiraTextDersFive.khatiraTextFiveEight_1], order: [EnOrder.texts, ]),
  // 9
  KhatiraModelOrder(
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
  KhatiraModelOrder(
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
  KhatiraModelOrder(
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
  KhatiraModelOrder(
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
