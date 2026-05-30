// TextDers10
import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/core/data/static/text/khatira_text_ders_ten.dart';

List<KhatiraModelNewOrder> khatiraList10NewOrder = [
  // 1
  KhatiraModelNewOrder(
    titles: [
      KhatiraTextDersTen.titleTenOne,
    ],
    texts: [
      KhatiraTextDersTen.elmTexTenOne_1,
      KhatiraTextDersTen.elmTextTenOne_2,
      KhatiraTextDersTen.elmTextTenOne_3,
    ],
    ayahs: [
      KhatiraTextDersTen.ayahHadithTenOne_1,
      KhatiraTextDersTen.ayahHadithTenOne_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // 2
  KhatiraModelNewOrder(
    ayahs: [
      KhatiraTextDersTen.ayahHadithTenTwo_1,
    ],
    texts: [
      KhatiraTextDersTen.elmTextTenTwo_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // 3
  KhatiraModelNewOrder(
    titles: [
      KhatiraTextDersTen.titleTenThree_1,
    ],
    ayahs: [
      KhatiraTextDersTen.ayahHadithTenThree_1,
      KhatiraTextDersTen.ayahHadithTenThree_2,
    ],
    texts: [
      KhatiraTextDersTen.elmTextTenThree_1,
      KhatiraTextDersTen.elmTextTenThree_2,
    ],
    order: [
      EnOrder.titles,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // 4
  KhatiraModelNewOrder(
    ayahs: [
      KhatiraTextDersTen.ayahHadithTenFour_1,
    ],
    texts: [
      KhatiraTextDersTen.elmTextTenFour_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
  // 5
  KhatiraModelNewOrder(
    ayahs: [
      KhatiraTextDersTen.ayahHadithTenFive_1,
      KhatiraTextDersTen.ayahHadithTenFive_2,
    ],
    texts: [
      KhatiraTextDersTen.elmTextTenFive_1,
    ],
    order: [
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // 6
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersTen.elmTextTenSix_1,
    ],
    ayahs: [
      KhatiraTextDersTen.ayahHadithTenSix_1,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
    ],
  ),
  // 7
  KhatiraModelNewOrder(
    texts: [
      KhatiraTextDersTen.elmTextTenSeven_1,
      KhatiraTextDersTen.elmTextTenSeven_2,
      KhatiraTextDersTen.elmTextTenSeven_3,
    ],
    ayahs: [
      KhatiraTextDersTen.ayahHadithTenSeven_1,
      KhatiraTextDersTen.ayahHadithTenSeven_2,
    ],
    order: [
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
      EnOrder.ayahs,
      EnOrder.texts,
    ],
  ),
];
