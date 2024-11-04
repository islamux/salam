// TextDersThree (new)
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_three.dart';

List<ElmModelNewOrder> elmList3NewOrder = [
  // Page 1
  ElmModelNewOrder(
    titles: [
      ElmTextDersThree.titleThreeOne,
    ],
    texts: [
      ElmTextDersThree.elmTexThreeOne_1,
      ElmTextDersThree.elmTextThreeOne_2,
    ],
    ayahs: [
      ElmTextDersThree.ayaHadithThreeOne_1,
      ElmTextDersThree.ayahHadithThreeOne_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
      //
      EnOrder.texts,
      EnOrder.ayahs,
    ],
//     order: '''
//       titles,texts,ayahs,
//       texts,ayahs,
//  ''',
  ),

  // page 2
  ElmModelNewOrder(
    texts: [
      ElmTextDersThree.elmTextThreeTwo_1,
      ElmTextDersThree.elmTextThreeTwo_2,
      ElmTextDersThree.elmTextThreeTwo_3,
    ],
    ayahs: [
      ElmTextDersThree.ayahHadithThreeTwo_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // order: '''
    //   texts,texts,
    //   ayahs,texts,
    //  ''',
  ),

  // page 3
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersThree.ayahHadithThreeThree_1,
    ],
    texts: [
      ElmTextDersThree.elmTextThreeThree_1,
      ElmTextDersThree.elmTextThreeThree_2,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.texts,
    ],
//     order: '''
//       ayahs,texts,
//       texts,

//  ''',
  ),
];
