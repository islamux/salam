// TextDersSix (new)
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_six.dart';

List<ElmModelNewOrder> elmList6NewOrder = [
  // page 1
  ElmModelNewOrder(
    titles: [
      ElmTextDersSix.titleSixOne,
    ],
    texts: [
      ElmTextDersSix.elmTextSixOne_1,
      ElmTextDersSix.elmTextSixOne_2,
    ],
    ayahs: [
      ElmTextDersSix.ayahHadithSixOne_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
//     order: '''
//     titles,texts,texts,ayahs
//  ''',
  ),
  // page 2
  ElmModelNewOrder(
    titles: [
      ElmTextDersSix.titleSixTwo_1,
    ],
    texts: [
      ElmTextDersSix.elmTextSixTwo_1,
    ],
    ayahs: [
      ElmTextDersSix.ayahHadithSixTwo_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
    // order: '''
//     titles,texts,ayahs
//  ''',
  ),
  // page 3
  ElmModelNewOrder(
    texts: [
      ElmTextDersSix.elmTextSixThree_1,
      ElmTextDersSix.elmTextSixThree_2,
    ],
    ayahs: [
      ElmTextDersSix.ayahHadithSixThree_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
//     order: '''
//     texts,ayahs,texts,
//  ''',
  ),
  // page 4
  ElmModelNewOrder(
    texts: [ElmTextDersSix.elmTextSixFour_1],
    order: [
      EnOrder.texts,
    ],
    // order: '''
    // texts,
    //  ''',
  ),

  // page 5
  ElmModelNewOrder(
    titles: [
      ElmTextDersSix.titleSixFive,
    ],
    ayahs: [
      ElmTextDersSix.ayahHadithSixFive_1,
    ],
    texts: [
      ElmTextDersSix.elmTextSixFive_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // order: '''
    // titles,ayahs,texts,
//  ''',
  )
];
