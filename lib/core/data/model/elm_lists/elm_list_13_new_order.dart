// TextDerseTherteen
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_therteen.dart';

List<ElmModelNewOrder> elmList13NewOrder = [
  // 1
  ElmModelNewOrder(
    titles: [
      ElmTextDersTherteen.titleThirteenOne,
    ],
    ayahs: [
      ElmTextDersTherteen.ayahHadithThirteenOne_1,
      ElmTextDersTherteen.ayahHadithThirteenOne_2,
      ElmTextDersTherteen.ayahHadithTherteenOne_3,
    ],
    texts: [
      ElmTextDersTherteen.elmTextTherteenOne_1,
      ElmTextDersTherteen.elmTextTherteenOne_2,
      ElmTextDersTherteen.elmTextTherteenOne_3,
    ],
    footer: ElmTextDersTherteen.footerTherteen,
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.footer,
    ],
    // getPageOneTexts(){}
//     order: '''
//       titles,ayahs,texts,
//       ayahs,texts,
//       ayahs,texts,
//  ''',
  ),

  // 2
  ElmModelNewOrder(
    texts: [
      ElmTextDersTherteen.elmTextTherteenTwo_1,
      ElmTextDersTherteen.elmTextTherteenTwo_2,
      ElmTextDersTherteen.elmTextTherteenTwo_3,
    ],
    ayahs: [
      ElmTextDersTherteen.ayahHadithTherteenTwo_1,
      ElmTextDersTherteen.ayahHadithTherteenTwo_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts
    ],
    // getPageOneTexts(){}
    // order: '''
    // texts,ayahs,
    // texts,ayahs,
    // texts
    // ''',
  ),
  // 3
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersTherteen.ayahHadithTherteenThree_1,
      ElmTextDersTherteen.ayahHadithTherteenThree_2,
      ElmTextDersTherteen.ayahHadithTherteenThree_3,
    ],
    texts: [
      ElmTextDersTherteen.elmTextTherteenThree_1,
      ElmTextDersTherteen.elmTextTherteenThree_2,
      ElmTextDersTherteen.elmTextTherteenThree_3,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // order: '''
    //     ayash,texts,
    //     ayahs,texts,
    //     ayahs,texts,
    //     ''',
  ),
  // 4
  ElmModelNewOrder(
    texts: [
      ElmTextDersTherteen.elmTextTherteenFour_1,
      ElmTextDersTherteen.elmTextTherteenFour_2,
      ElmTextDersTherteen.elmTextTherteenFour_3,
      ElmTextDersTherteen.elmTextTherteenFour_4,
    ],
    subtitles: [
      ElmTextDersTherteen.subtitleTherteenFour_1,
      ElmTextDersTherteen.subtitleTherteenFour_2,
      ElmTextDersTherteen.subtitleTherteenFour_3,
      ElmTextDersTherteen.subtitleTherteenFour_4,
    ],
    ayahs: [
      ElmTextDersTherteen.ayahHadithTherteenFour_1,
      ElmTextDersTherteen.ayahHadithTherteenFour_2,
      ElmTextDersTherteen.ayahHadithTherteenFour_3,
    ],
    order: [
      EnOrder.texts,
      //
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.subtitles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.subtitles,
    ],
    //From getPageFourTexts(){}
//     order: '''
//     texts,
//     subtitles,texts,ayahs,
//     subtitles,texts,ayahs,
//     subtitles,texts,ayahs,
//     subtitles,
//  ''',
  ),
  // 5
  ElmModelNewOrder(
    texts: [
      ElmTextDersTherteen.elmTextTherteenFive_1,
      ElmTextDersTherteen.elmTextTherteenFive_2,
      ElmTextDersTherteen.elmTextTherteenFive_3,
      ElmTextDersTherteen.elmTextTherteenFive_4,
    ],
    ayahs: [
      ElmTextDersTherteen.ayahHadithTherteenFive_1,
      ElmTextDersTherteen.ayahHadithTherteenFive_2,
      ElmTextDersTherteen.ayahHadithTherteenFive_3,
      ElmTextDersTherteen.ayahHadithTherteenFive_4,
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
      //
      EnOrder.texts,
      EnOrder.ayahs,
    ],
    // getPageFiveTexts(){}
//     order: '''
//       texts,ayahs,
//       texts,ayahs,
//       texts,ayahs,
//       texts,ayahs,
// ''',
  ),
  // 6
  ElmModelNewOrder(
    texts: [
      ElmTextDersTherteen.elmTextTherteenSix_1,
      ElmTextDersTherteen.elmTextTherteenSix_2,
      ElmTextDersTherteen.elmTextTherteenSix_3,
      ElmTextDersTherteen.elmTextTherteenSix_4,
    ],
    ayahs: [
      ElmTextDersTherteen.ayahHadithTherteenSix_1,
      ElmTextDersTherteen.ayahHadithTherteenSix_2,
      ElmTextDersTherteen.ayahHadithTherteenSix_3,
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
      //
      EnOrder.texts,
    ],
    // order: ''',

    //   texts,ayahs,
    //   texts,ayahs,
    //   texts,ayahs,
    //   texts,
    // ''',
  ),
  // 7
  ElmModelNewOrder(
    texts: [
      ElmTextDersTherteen.elmTextTherteenSeven_1,
      ElmTextDersTherteen.elmTextTherteenSeven_2,
    ],
    ayahs: [
      ElmTextDersTherteen.ayahHadithTherteenSeven_1,
      ElmTextDersTherteen.ayahHadithTherteenSeven_2,
    ],
    footer: ElmTextDersTherteen.footerTherteenSeven,
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.footer,
    ],
    // order: ''',
    //   texts,ayahs,
    //   texts,ayahs,
    //   footer,
    // ''',
  ),

  //8
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersTherteen.ayahHadithTherteenEight_1,
      ElmTextDersTherteen.ayahHadithTherteenEight_2,
    ],
    texts: [
      ElmTextDersTherteen.elmTextTherteenEight_1,
    ],
    footer: ElmTextDersTherteen.footerTherteenEight,
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      //
      EnOrder.ayahs,
      EnOrder.footer,
    ],
    // order: ''',
    //   ayahs,texts,
    //   ayahs,footer,
    // ''',
  ),
  // 9
  ElmModelNewOrder(
    texts: [
      ElmTextDersTherteen.elmTextTherteenNine_1,
    ],
    order: [
      EnOrder.texts,
    ],
    // order: 'texts',
  ),
  // 10
  ElmModelNewOrder(
    texts: [
      ElmTextDersTherteen.elmTextTherteenTen_1,
      ElmTextDersTherteen.elmTextTherteenTen_2,
      ElmTextDersTherteen.elmTextTherteenTen_3,
    ],
    ayahs: [
      ElmTextDersTherteen.ayahHadithTherteenTen_1,
      ElmTextDersTherteen.ayahHadithTherteenTen_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // order: ''',
    //   texts,ayahs,
    //   texts,ayahs,
    //   texts,
    // ''',
  ),
  //11
  ElmModelNewOrder(
    texts: [
      ElmTextDersTherteen.elmTextTherteenEleven_1,
    ],
    order: [
      EnOrder.texts,
    ],
    // order: 'texts',
  ),

  // 12
  ElmModelNewOrder(
    titles: [
      ElmTextDersTherteen.titleTherteenTwelve_1,
    ],
    texts: [
      ElmTextDersTherteen.elmTextTherteenTwelve_1,
      ElmTextDersTherteen.elmTextTherteenTwelve_2,
      ElmTextDersTherteen.elmTextTherteenTwelve_3,
    ],
    ayahs: [
      ElmTextDersTherteen.ayahHadithTherteenTwelve_1,
      ElmTextDersTherteen.ayahHadithTherteenTwelve_2,
    ],
    subtitles: [
      ElmTextDersTherteen.subtitleTherteenTwelve_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.subtitles,
      //
      EnOrder.texts,
      EnOrder.ayahs,
    ],
    // order: ''',
    //  titles,texts,ayahs,
    //   texts,subtitles
    //   texts,ayahs
    // ''',
  ),
  // 13
  ElmModelNewOrder(
    texts: [
      ElmTextDersTherteen.elmTextTherteenTherteen_1,
      ElmTextDersTherteen.elmTextTherteenTherteen_2,
      ElmTextDersTherteen.elmTextTherteenTherteen_3,
    ],
    subtitles: [
      ElmTextDersTherteen.subtitleTherteenTherteen_1,
      ElmTextDersTherteen.subtitleTherteenTherteen_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.subtitles,
      //
      EnOrder.texts,
      EnOrder.subtitles,
      //
      EnOrder.texts,
    ],
    // order: ''',
    //   texts,subtitles,
    //   texts,subtitles
    //   texts
    // ''',
  ),
];
