// TextDersPre
import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/core/data/static/text/khatira_text_ders_pre.dart';

List<KhatiraModelNewOrder> khatiraListPreNewOrder = [
  // 1
  KhatiraModelNewOrder(
    titles: [
      KhatiraTextPre.titlePreOne,
    ],
    ayahs: [
      KhatiraTextPre.ayahHadithPreOne_1,
    ],
    texts: [
      KhatiraTextPre.elmTextPreOne_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // 2
  KhatiraModelNewOrder(
    titles: [
      KhatiraTextPre.titlePreTwo,
    ],
    subtitles: [
      KhatiraTextPre.subtitlePreTwo_1,
    ],
    texts: [
      KhatiraTextPre.elmTextPreTwo_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.subtitles,
      EnOrder.texts,
    ],
  ),
  // 3
  KhatiraModelNewOrder(
    ayahs: [
      KhatiraTextPre.ayahHadithPreThree_1,
      KhatiraTextPre.ayahHadithPreThree_2,
      KhatiraTextPre.ayahHadithPreThree_3,
    ],
    texts: [
      KhatiraTextPre.elmTextPreThree_1,
      KhatiraTextPre.elmTextPreThree_2,
      KhatiraTextPre.elmTextPreThree_3,
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
