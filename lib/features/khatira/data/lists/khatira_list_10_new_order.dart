// TextDers10
import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/features/khatira/data/static/text/khatira_text_ders_ten.dart';

List<KhatiraModelNewOrder> khatiraList10NewOrder = [
  // 1
  KhatiraModelNewOrder(
    titles: [
      KhatiraTextDersTen.titleTenOne,
    ],
    texts: [
      KhatiraTextDersTen.elmTexTenOne_1,
      KhatiraTextDersTen.khatiraTextTenOne_2,
      KhatiraTextDersTen.khatiraTextTenOne_3,
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
      KhatiraTextDersTen.khatiraTextTenTwo_1,
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
      KhatiraTextDersTen.khatiraTextTenThree_1,
      KhatiraTextDersTen.khatiraTextTenThree_2,
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
      KhatiraTextDersTen.khatiraTextTenFour_1,
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
      KhatiraTextDersTen.khatiraTextTenFive_1,
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
      KhatiraTextDersTen.khatiraTextTenSix_1,
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
      KhatiraTextDersTen.khatiraTextTenSeven_1,
      KhatiraTextDersTen.khatiraTextTenSeven_2,
      KhatiraTextDersTen.khatiraTextTenSeven_3,
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
