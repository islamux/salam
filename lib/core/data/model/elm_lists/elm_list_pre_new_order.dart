import 'package:elm/core/data/model/elm_model_new_order.dart';

import '../../static/text/elm_text_ders_pre.dart';

List<ElmModelNewOrder> elmListPreNewOrder = [
  // page 1
  ElmModelNewOrder(
    titles: [
      ElmTextPre.titlePreOne,
    ],
    ayahs: [
      ElmTextPre.ayahHadithPreOne_1,
    ],
    texts: [ElmTextPre.elmTextPreOne_1],
    order: 'titles,ayahs,texts',
  ),
  // page 2
  ElmModelNewOrder(
    titles: [
      ElmTextPre.titlePreTwo,
    ],
    subtitles: [
      ElmTextPre.subtitlePreTwo_1,
    ],
    texts: [
      ElmTextPre.elmTextPreTwo_1,
    ],
    order: 'titles,subtitles,texts',
  ),

  //page 3
  ElmModelNewOrder(
    ayahs: [
      ElmTextPre.ayahHadithPreThree_1,
      ElmTextPre.ayahHadithPreThree_2,
      ElmTextPre.ayahHadithPreThree_3,
      ElmTextPre.ayah_1,
      ElmTextPre.ayah_2,
    ],
    texts: [
      ElmTextPre.elmTextPreThree_1,
      ElmTextPre.elmTextPreThree_2,
      ElmTextPre.elmTextPreThree_3,
      ElmTextPre.text_2,
    ],
    titles: [ElmTextPre.title_1],
    subtitles: [ElmTextPre.subtitle_1],
    order: '''ayahs,texts,
              ayahs,texts,
              ayahs,texts,
              ayahs,ayahs,titles,subtitles,texts,
    ''',
  )
];
