import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_eighteen.dart';

// TextDersSeventeen
List<ElmModelNewOrder> elmList18NewOrder = [
  // page 1
  ElmModelNewOrder(
    titles: [
      ElmTextDersEighteen.titleEighteenOne,
    ],
    texts: [
      ElmTextDersEighteen.elmTextEighteenOne_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
    ],
    // 'titles,texts',
  ),
  // page 2
  ElmModelNewOrder(
    texts: [
      ElmTextDersEighteen.elmTextEighteenTwo_1,
      ElmTextDersEighteen.elmTextEighteenTwo_2,
    ],
    ayahs: [
      ElmTextDersEighteen.ayahHadithEighteenTwo_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // 'texts,ayahs,texts',
  ),
  // page 3
  ElmModelNewOrder(
    texts: [
      ElmTextDersEighteen.elmTextEighteenThree_1,
    ],
    ayahs: [
      ElmTextDersEighteen.ayahHadithEighteenThree_1,
      ElmTextDersEighteen.ayahHadithEighteenThree_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.ayahs,
    ],
    // 'texts,ayahs,ayahs',
  ),

  // page 4
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersEighteen.ayahHadithTextEighteenFour_1,
    ],
    texts: [
      ElmTextDersEighteen.elmTextEighteenFour_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // 'ayahs,texts',
  ),
  // page 5
  ElmModelNewOrder(
    texts: [
      ElmTextDersEighteen.elmTextEighteenFive_1,
    ],
    order: [
      EnOrder.texts,
    ],
    // 'texts',
  ),
  // page 6
  ElmModelNewOrder(
    ayahs: [
      ElmTextDersEighteen.ayahHadithEighteenSix_1,
    ],
    texts: [
      ElmTextDersEighteen.elmTextEighteenSix_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // 'ayahs,texts',
  ),

  // page 7
  ElmModelNewOrder(
    texts: [
      ElmTextDersEighteen.elmTextEighteenSeven_1,
    ],
    order: [
      EnOrder.texts,
    ],
    // 'texts',
  ),
  // page 8
  ElmModelNewOrder(
    texts: [
      ElmTextDersEighteen.elmTextEighteenEight_1,
    ],
    order: [
      EnOrder.texts,
    ],
    // 'texts',
  ),
  // page 9
  ElmModelNewOrder(
    titles: [
      ElmTextDersEighteen.titleEighteenNine_1,
    ],
    ayahs: [
      ElmTextDersEighteen.ayahHadithEighteenNine_1,
    ],
    texts: [
      ElmTextDersEighteen.elmTextEighteenNine_1,
    ],
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
    // 'titles,ayahs,texts',
  ),
  // page 10
  ElmModelNewOrder(
    texts: [
      ElmTextDersEighteen.elmTextEighteenTen_1,
    ],
    order: [
      EnOrder.texts,
    ],
    // 'texts',
  ),
];
