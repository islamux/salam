//TextDersSixTeen
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_seventeen.dart';

// TextDersSeventeen
List<ElmModelNewOrder> elmList17NewOrder = [
  // page 1
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenOne_1,
      ElmTextDersSeventeen.elmTextSeventeenOne_2,
      ElmTextDersSeventeen.elmTextSeventeenOne_3,
    ],
    ayahs: [
      ElmTextDersSeventeen.ayahHadithSeventeenOne_1,
      ElmTextDersSeventeen.ayahHadithSeventeenOne_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
    ],
    // 'texts,ayahs,texts,ayahs,texts',
  ),

  // page 2
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersSeventeen.ayahHadithSeventeenTwo_1,
      ElmTextDersSeventeen.ayahHadithSeventeenTwo_2,
    ],
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenTwo_1,
      ElmTextDersSeventeen.elmTextSeventeenTwo_2,
    ],
    subtitles: [
      ElmTextDersSeventeen.subtitleSeventeenTwo_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.subtitles,
      //
      EnOrder.texts,
    ],
    // 'ayahs,texts,ayahs,subtitles,texts',
  ),

  // page 3
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersSeventeen.ayahHadithSeventeenThree_1,
      ElmTextDersSeventeen.ayahHadithSeventeenThree_2,
    ],
    subtitles: [
      ElmTextDersSeventeen.subtitleSeventeenThree_1,
    ],
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenThree_1,
      ElmTextDersSeventeen.elmTextSeventeenThree_2,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.subtitles,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
    ],
    // 'ayahs,subtitle,texts,ayahs,texts',
  ),

  // page 4
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenFour_1,
      ElmTextDersSeventeen.elmTextSeventeenFour_2,
    ],
    ayahs: [
      ElmTextDersSeventeen.ayahHadithSeventeenFour_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // 'texts,ayahs,texts',
  ),
  // page 5
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenFive_1,
      ElmTextDersSeventeen.elmTextSeventeenFive_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
    ],
  ),
  // 'texts,texts'
  // page 6
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenSix_1,
      ElmTextDersSeventeen.elmTextSeventeenSix_2,
      ElmTextDersSeventeen.elmTextSeventeenSix_3,
    ],
    ayahs: [
      ElmTextDersSeventeen.ayahHadithSeventeenSix_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // 'texts,texts,ayahs,texts',
  ),

  // page 7
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenSeven_1,
      ElmTextDersSeventeen.elmTextSeventeenSeven_2,
      ElmTextDersSeventeen.elmTextSeventeenSeven_3,
    ],
    ayahs: [
      ElmTextDersSeventeen.ayahHadithSeventeenSeven_1,
      ElmTextDersSeventeen.ayahHadithSeventeenSeven_2,
      ElmTextDersSeventeen.ayahHadithSeventeenSeven_3,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
    ],
    // '''texts,ayahs,
    // texts,ayahs,
    // texts,ayahs''',
  ),

  // page 8
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenEight_1,
    ],
    footer: ElmTextDersSeventeen.footerSeventeenEight,
    order: [
      EnOrder.texts,
      EnOrder.footer,
    ],
    // 'texts,footer',
  ),

  // page 9
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersSeventeen.subtitleSeventeenNine_1,
    ],
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenNine_1,
      ElmTextDersSeventeen.elmTextSeventeenNine_2,
    ],
    ayahs: [
      ElmTextDersSeventeen.ayahHadithSeventeenNine_1,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // 'subtitles,texts,ayahs,texts',
  ),

  // page 10
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenTen_1,
      ElmTextDersSeventeen.elmTextSeventeenTen_2,
    ],
    ayahs: [
      ElmTextDersSeventeen.ayahHadithSeventeenTen_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
    ],
  ),

  // copilot gpt4.1
  // ...existing code...

  // page 11
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersSeventeen.subtitleSeventeenEleven_1,
    ],
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenEleven_1,
    ],
    ayahs: [
      ElmTextDersSeventeen.ayahHadithSeventeenEleven_1,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenEleven_2,
    ],
    order: [
      EnOrder.texts,
    ],
  ),
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersSeventeen.subtitleSeventeenEleven_2,
    ],
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenEleven_3,
    ],
    ayahs: [
      ElmTextDersSeventeen.ayahHadithSeventeenEleven_2,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersSeventeen.subtitleSeventeenEleven_3,
    ],
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenEleven_4,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
    ],
  ),
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersSeventeen.subtitleSeventeenEleven_4,
    ],
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenEleven_5,
    ],
    ayahs: [
      ElmTextDersSeventeen.ayahHadithSeventeenEleven_3,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenEleven_6,
    ],
    ayahs: [
      ElmTextDersSeventeen.ayahHadithSeventeenEleven_4,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersSeventeen.subtitleSeventeenEleven_5,
    ],
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenEleven_7,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
    ],
  ),
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersSeventeen.subtitleSeventeenEleven_6,
    ],
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenEleven_8,
    ],
    ayahs: [
      ElmTextDersSeventeen.ayahHadithSeventeenEleven_5,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  ElmModelNewOrder(
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenEleven_9,
    ],
    order: [
      EnOrder.texts,
    ],
  ),
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersSeventeen.subtitleSeventeenEleven_7,
    ],
    ayahs: [
      ElmTextDersSeventeen.ayahHadithSeventeenEleven_6,
      ElmTextDersSeventeen.ayahHadithSeventeenEleven_7,
    ],
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenEleven_10,
      ElmTextDersSeventeen.elmTextSeventeenEleven_11,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  ElmModelNewOrder(
    subtitles: [
      ElmTextDersSeventeen.subtitleSeventeenEleven_8,
    ],
    texts: [
      ElmTextDersSeventeen.elmTextSeventeenEleven_12,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
    ],
  ),
];
