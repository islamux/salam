// TextDersPre
import 'package:khatir/core/data/model/khatira_model_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/features/khatira/data/static/text/khatira_text_ders_pre.dart';

List<KhatiraModelOrder> khatiraListPreOrder = [
  // 1
  KhatiraModelOrder(titles: [KhatiraTextPre.titlePreOne], order: [EnOrder.titles, ]),
  // 2
  KhatiraModelOrder(
    ayahs: [
      KhatiraTextPre.ayahHadithPreOne_1,
    ],
    texts: [
      KhatiraTextPre.khatiraTextPreOne_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // 3
  KhatiraModelOrder(
    titles: [
      KhatiraTextPre.titlePreTwo,
    ],
    subtitles: [
      KhatiraTextPre.subtitlePreTwo_1,
    ],
    texts: [
      KhatiraTextPre.khatiraTextPreTwo_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.subtitles,
      EnOrder.texts,
    ],
  ),
  // 4
  KhatiraModelOrder(
    ayahs: [
      KhatiraTextPre.ayahHadithPreThree_1,
      KhatiraTextPre.ayahHadithPreThree_2,
      KhatiraTextPre.ayahHadithPreThree_3,
    ],
    texts: [
      KhatiraTextPre.khatiraTextPreThree_1,
      KhatiraTextPre.khatiraTextPreThree_2,
      KhatiraTextPre.khatiraTextPreThree_3,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
];
