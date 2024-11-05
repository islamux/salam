//TextDersSixTeen
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_nineteen.dart';
import 'package:intl/date_symbols.dart';

// TextDersSeventeen
List<ElmModelNewOrder> elmList19NewOrder = [
  // page 1
  ElmModelNewOrder(
    titles: [
      ElmTextNineteen.titleNineteenOne,
    ],
    texts: [
      ElmTextNineteen.elmTextNineteenOne_1,
    ],
    ayahs: [
      ElmTextNineteen.ayahHadithNineteenOne_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
    // 'titles,texts,ayahs',
  ),

// page 2
  ElmModelNewOrder(
    subtitles: [
      ElmTextNineteen.subtitleNineteenTwo_1,
      ElmTextNineteen.subtitleNineteenTwo_2,
    ],
    texts: [
      ElmTextNineteen.elmTextNineteenTwo_1,
      ElmTextNineteen.elmTextNineteenTwo_2,
    ],
    ayahs: [
      ElmTextNineteen.ayahHadithNineteenTwo_1,
      ElmTextNineteen.ayahHadithNineteenTwo_2,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
    // 'subtitles,texts,ayahs,subtitles,texts,ayahs',
  ),

  // page 3
  ElmModelNewOrder(
    texts: [
      ElmTextNineteen.elmTextNineteenThree_1,
      ElmTextNineteen.elmTextNineteenThree_2,
    ],
    ayahs: [
      ElmTextNineteen.ayahHadithNineteenThree_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // 'texts,ayahs,texts',
  ),
  // page 4
  ElmModelNewOrder(
    texts: [
      ElmTextNineteen.elmTextNineteenFour_1,
      ElmTextNineteen.elmTextNineteenFour_2,
      ElmTextNineteen.elmTextNineteenFour_3,
    ],
    ayahs: [
      ElmTextNineteen.ayahHadithNineteenFour_1,
      ElmTextNineteen.ayahHadithNineteenFour_2,
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
    // 'texts,ayahs,texts,ayahs,texts,',
  ),
  // page 5
  ElmModelNewOrder(
    ayahs: [
      ElmTextNineteen.ayahHadithNineteenFive_1,
      ElmTextNineteen.ayahHadithNineteenFive_2,
    ],
    texts: [
      ElmTextNineteen.elmTextNineteenFive_1,
      ElmTextNineteen.elmTextNineteenFive_2,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // 'ayahs,texts,ayahs,texts',
  ),
  // page 6
  ElmModelNewOrder(
    texts: [
      ElmTextNineteen.elmTextNineteenSix_1,
    ],
    ayahs: [
      ElmTextNineteen.ayahHadithNineteenSix_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
    // 'texts,ayahs',
  ),
  // page 7
  ElmModelNewOrder(
    texts: [
      ElmTextNineteen.elmTextNineteenSeven_1,
      ElmTextNineteen.elmTextNineteenSeven_2,
      ElmTextNineteen.elmTextNineteenSeven_3,
    ],
    ayahs: [
      ElmTextNineteen.ayahHadithNineteenSeven_1,
      ElmTextNineteen.ayahHadithNineteenSeven_2,
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
  // page 8
  ElmModelNewOrder(
    ayahs: [
      ElmTextNineteen.ayahHadithNineteenEight_1,
      ElmTextNineteen.ayahHadithNineteenEight_2,
    ],
    texts: [
      ElmTextNineteen.elmTextNineteenEight_1,
      ElmTextNineteen.elmTextNineteenEight_2,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // 'ayahs,texts,ayahs,texts',
  ),
  // page 9
  ElmModelNewOrder(
    texts: [
      ElmTextNineteen.elmTextNineteenNine_1,
    ],
    order: [
      EnOrder.texts,
    ],
    // 'texts',
  ),
  // page 10
  ElmModelNewOrder(
    texts: [
      ElmTextNineteen.elmTextNineteenTen_1,
      ElmTextNineteen.elmTextNineteenTen_2,
      ElmTextNineteen.elmTextNineteenTen_3,
    ],
    ayahs: [
      ElmTextNineteen.ayahHadithNineteenTen_1,
      ElmTextNineteen.ayahHadithNineteenTen_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.texts,
    ],
    // 'texts,ayahs,texts,ayahs,texts,texts',
  ),
  // page 11
  ElmModelNewOrder(
    ayahs: [
      ElmTextNineteen.ayahHadithNineteenEleven_1,
      ElmTextNineteen.ayahHadithNineteenEleven_2,
    ],
    texts: [
      ElmTextNineteen.elmTextNineteenEleven_1,
      ElmTextNineteen.elmTextNineteenEleven_2,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // 'ayahs,texts,ayahs,texts',
  ),
  // page 12
  ElmModelNewOrder(
    ayahs: [
      ElmTextNineteen.ayahHadithNineteenTwelve_1,
      ElmTextNineteen.ayahHadithNineteenTwelve_2,
      ElmTextNineteen.ayahHadithNineteenTwelve_3,
    ],
    texts: [
      ElmTextNineteen.elmTextNineteenTwelve_1,
      ElmTextNineteen.elmTextNineteenTwelve_2,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
    ],
    // 'ayahs,texts,ayahs,texts,ayahs',
  ),
// page 13
  ElmModelNewOrder(
    texts: [
      ElmTextNineteen.elmTextNineteenThirteen_1,
      ElmTextNineteen.elmTextNineteenThirteen_2,
      ElmTextNineteen.elmTextNineteenThirteen_3,
    ],
    ayahs: [
      ElmTextNineteen.ayahHadithNineteenThreaten_1,
      ElmTextNineteen.ayahHadithNineteenThirteen_2,
    ],
    subtitles: [
      ElmTextNineteen.subtitleNineteenThirteen_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.subtitles,
      EnOrder.texts,
    ],
    // 'texts,ayahs,texts,ayahs,subtitles,texts',
  ),
// page 14
  ElmModelNewOrder(
    ayahs: [
      ElmTextNineteen.ayahHadithNineteenFourteen_1,
    ],
    texts: [
      ElmTextNineteen.elmTextNineteenFourteen_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // 'ayahs,texts',
  ),
// page 15
  ElmModelNewOrder(
    subtitles: [
      ElmTextNineteen.subtitleNineteenFifteen_1,
    ],
    texts: [
      ElmTextNineteen.elmTextNineteenFifteen_1,
      ElmTextNineteen.elmTextNineteenFifteen_2,
      ElmTextNineteen.elmTextNineteenFifteen_3,
    ],
    ayahs: [
      ElmTextNineteen.ayahHadithNineteenFifteen_1,
      ElmTextNineteen.ayahHadithNineteenFifteen_2,
    ],
    order: [
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
    ],
    // 'subtitles,texts,ayahs,texts,ayahs,texts,',
  ),
// page 16
  ElmModelNewOrder(
    titles: [
      ElmTextNineteen.titleNineteenSixteen,
    ],
    subtitles: [
      ElmTextNineteen.subtitleNineteenSixteen_1,
    ],
    texts: [
      ElmTextNineteen.elmTextNineteenSixteen_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.subtitles,
      EnOrder.texts,
    ],
    // 'titles,subtitles,texts',
  ),
];
