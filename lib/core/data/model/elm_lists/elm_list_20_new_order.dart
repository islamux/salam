//TextDersSixTeen
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/static/text/elm_text_ders_twenty.dart';
import 'enum_order.dart';
// TextDersSeventeen

List<ElmModelNewOrder> elmList20NewOrder = [
  // page 1
  ElmModelNewOrder(texts: [
    ElmTextTwenty.elmTextTwentyOne_1,
    ElmTextTwenty.elmTextTwentyOne_2,
    ElmTextTwenty.elmTextTwentyOne_3,
  ], titles: [
    ElmTextTwenty.titleTwentyOne,
  ], ayahs: [
    ElmTextTwenty.ayahHadithTwentyOne1,
    ElmTextTwenty.ayahHadithTwentyOne_2,
  ], subtitles: [
    ElmTextTwenty.subtitleTwentyOne_1,
  ], order: [
    EnOrder.texts,
    EnOrder.titles,
    //
    EnOrder.texts,
    EnOrder.ayahs,
    EnOrder.subtitles,
    //
    EnOrder.texts, EnOrder.ayahs,
  ]),

// page 2
  ElmModelNewOrder(
    subtitles: [
      ElmTextTwenty.subtitleTwentyTwo_1,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyTwo_1,
      ElmTextTwenty.elmTextTwentyTwo_2,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyTwo_1,
    ],
    order: ''',
       subtitles,texts,ayahs,texts   
    ''',
  ),
  // page 3
  ElmModelNewOrder(
    subtitles: [
      ElmTextTwenty.subtitleTwentyThree_1,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyThree_1,
      ElmTextTwenty.elmTextTwentyThree_2,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyThree_1,
    ],
    order: 'subtitles,texts,ayahs,texts',
  ),
  // page 4
  ElmModelNewOrder(
    subtitles: [
      ElmTextTwenty.subtitleTwentyFour_1,
      ElmTextTwenty.subtitleTwentyFour_2
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyFour_1,
      ElmTextTwenty.elmTextTwentyFour_2,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyFour_1,
    ],
    order: ''',
    subtitles,texts,
    subtitles,texts,ayahs
    ''',
  ),
  // page 5
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentyFive_1,
      ElmTextTwenty.elmTextTwentyFive_2,
      ElmTextTwenty.elmTextTwentyFive_3,
      ElmTextTwenty.elmTextTwentyFive_4,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyFive_1,
      ElmTextTwenty.ayahHadithTwentyFive_2,
      ElmTextTwenty.ayahHadithTwentyFive_3,
      ElmTextTwenty.ayahHadithTwentyFive_4,
    ],
    order: ''',
    texts,ayahs,
    texts,ayahs,
    texts,ayahs,
    texts,ayahs,
    ''',
  ),

  // page 6
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentySix_1,
      ElmTextTwenty.elmTextTwentySix_2,
      ElmTextTwenty.ayahHadithTwentySix_2,
      ElmTextTwenty.elmTextTwentySix_3,
      ElmTextTwenty.elmTextTwentySix_4,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentySix_1,
      ElmTextTwenty.ayahHadithTwentySix_3,
    ],
    order: ''',
    texts,ayahs,
    texts,ayahs,
    texts,ayahs,
    texts,
    ''',
  ),
  // page 7
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwenty.ayahHadithTwentySeven_1,
      ElmTextTwenty.ayahHadithTwentySeven_2,
      ElmTextTwenty.ayahHadithTwentySeven_3,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentySeven_1,
      ElmTextTwenty.elmTextTwentySeven_2,
    ],
    order: ''',
    ayahs,texts,
    ayahs,texts,
    ayahs,
    ''',
  ),
  // page 8
  ElmModelNewOrder(
    subtitles: [
      ElmTextTwenty.subtitleTwentyEight_1,
    ],
    texts: [
      ElmTextTwenty.elmtTextTwentyEight_1,
    ],
    order: ''',
    subtitles,texts
    ''',
  ),
  // page 9
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyNine_1,
      ElmTextTwenty.ayahHadithTwentyNine_2,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyNine_1,
    ],
    order: 'ayahs,texts,ayahs',
  ),
  // page 10
  ElmModelNewOrder(
    titles: [
      ElmTextTwenty.titleTwentyTen,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyTen_1,
    ],
    order: 'titles,texts',
  ),
  // page 11
  ElmModelNewOrder(
    titles: [
      ElmTextTwenty.titleTwentyEleven,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyEleven_1,
      ElmTextTwenty.elmTextTwentyEleven_2,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyEleven_1,
    ],
    order: 'titles,texts,ayahs,texts',
  ),
  // page 12
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentyTwelve_1,
      ElmTextTwenty.elmTextTwentyTwelve_2,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyTwelve_1,
    ],
    order: 'texts,ayahs,texts',
  ),
// page 13
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentyThirteen_1,
      ElmTextTwenty.elmTextTwentyThirteen_2,
      ElmTextTwenty.elmTextTwenteThirteen_3,
    ],
    subtitles: [
      ElmTextTwenty.subtitleTwentyThirteen_1,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyThirteen_1,
    ],
    order: ''',
   texts,subtitles,
   texts,ayahs,
   texts,
    ''',
  ),
// page 14
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyFourteen_1,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyFourteen_1,
      ElmTextTwenty.elmTextTwentyFourteen_2,
    ],
    order: ''',
    ayahs,texts,
    texts,
    ''',
  ),
// page 15
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentyFifteen_1,
      ElmTextTwenty.elmTextTwentyFifteen_2,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyFifteen_1,
    ],
    order: ''',
    texts,ayahs,texts
    ''',
  ),

// page 16
  ElmModelNewOrder(
    titles: [
      ElmTextTwenty.titleTwentySixteen,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentySixteen_2,
    ],
    order: ''',
    titles,texts
    ''',
  ),

// page 17
  ElmModelNewOrder(texts: [
    ElmTextTwenty.elmTextTwentySeventeen_1,
  ], ayahs: [
    ElmTextTwenty.ayahHadithTwentySeventeen_1,
  ], order: ''',
    texts,ayahs
    '''),

// page 18
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentyEighteen_1,
    ],
    order: 'texts',
  ),

// page 19
  ElmModelNewOrder(
    titles: [
      ElmTextTwenty.titleTwentyNineteen,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyNineteen_1,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyNineteen_1,
    ],
    order: 'titles,texts,ayahs',
  ),

// page 20
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentyTwenty_1,
      ElmTextTwenty.elmTextTwentyTwenty_2,
      ElmTextTwenty.elmTextTwentyTwenty_3,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyTwenty_1,
      ElmTextTwenty.ayahHadithTwentyTwenty_2,
      ElmTextTwenty.ayahHadithTwentyTwenty_3,
    ],
    subtitles: [
      ElmTextTwenty.subtitleTwentyTwenty_1,
    ],
    order: ''',
    texts,ayah,
    texts,ayah,subtitles,
    texts,ayah,
    ''',
  ),

// page 21
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentyTwentyOne_1,
      ElmTextTwenty.elmTextTwentyTwentyOne_2,
      ElmTextTwenty.elmTextTwentyTwentyOne_3,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyTwentyOne_1,
    ],
    subtitles: [
      ElmTextTwenty.subtitleTwentyOne_1,
    ],
    order: ''',
    texts,ayah,
    texts,subtitles,
    texts,
    ''',
  ),

// page 22
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentyTwentyTwo_1,
      ElmTextTwenty.elmTextTwentyTwentyTwo_2,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyTwentyTwo_1,
    ],
    order: 'texts,ayahs,texts',
  ),

// page 23
  ElmModelNewOrder(
    subtitles: [
      ElmTextTwenty.subtitleTwentyTwentyThree_1,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyTwentyThree_1,
      ElmTextTwenty.elmTextTwentyTwentyThree_2,
      ElmTextTwenty.elmTextTwentyTwentyThree_3,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyTwentyThree_1,
      ElmTextTwenty.ayahHadithTwentyTwentyThree_2,
      ElmTextTwenty.ayahHadithTwentyTwentyThree_3,
    ],
    order: ''',
    subtitles,texts,ayahs,
    texts,ayahs,
    texts,ayahs,
    ''',
  ),

// page 24
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentyTwentyFour_1,
      ElmTextTwenty.elmTextTwentyTwentyFour_2,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyTwentyFour_1,
      ElmTextTwenty.ayahHadithTwentyTwentyFour_2,
    ],
    order: '',
  ),

// page 25
  ElmModelNewOrder(
    subtitles: [
      ElmTextTwenty.subtitleTwentyTwentyFive_1,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyTwentyFive_2,
    ],
    order: '',
  ),

// page 26
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyTwentySix_1,
      ElmTextTwenty.ayahHadithTwentyTwentySix_2
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyTwentySix_1,
    ],
    order: '',
  ),

// page 27
  ElmModelNewOrder(
    subtitles: [
      ElmTextTwenty.subtitleTwentyTwentySeven_1,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyTwentySeven_1,
      ElmTextTwenty.elmTextTwentyTwentySeven_2,
      ElmTextTwenty.elmTextTwentyTwentySeven_3,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyTwentySeven_1,
      ElmTextTwenty.ayahHadithTwentyTwentySeven_2,
      ElmTextTwenty.ayahHadithTwentyTwentySeven_3,
    ],
    order: '',
  ),

// page 28
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentyTwentyEight_1,
      ElmTextTwenty.elmTextTwentyTwentyEight_2,
      ElmTextTwenty.elmTextTwentyTwentyEight_3,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyTwentyEight_1,
      ElmTextTwenty.ayahHadithTwentyTwentyEight_2,
      ElmTextTwenty.ayahHadithTwentyTwentyEight_3,
    ],
    order: '',
  ),

// page 29
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentyTwentyNine_1,
      ElmTextTwenty.elmTextTwentyTwentyNine_2,
      ElmTextTwenty.elmTextTwentyTwentyNine_3,
      ElmTextTwenty.elmTextTwentyTwentyNine_4,
      ElmTextTwenty.elmTextTwentyTwentyNine_5,
      ElmTextTwenty.elmTextTwentyTwentyNine_6,
      ElmTextTwenty.elmTextTwentyTwentyNine_7,
      ElmTextTwenty.elmTextTwentyTwentyNine_8,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyTwentyNine_1,
      ElmTextTwenty.ayahHadithTwentyTwentyNine_2,
      ElmTextTwenty.ayahHadithTwentyTwentyNine_3,
      ElmTextTwenty.ayahHadithTwentyTwentyNine_4,
      ElmTextTwenty.ayahHadithTwentyTwentyNine_5,
      ElmTextTwenty.ayahHadithTwentyTwentyNine_6,
      ElmTextTwenty.ayahHadithTwentyTwentyNine_7,
      ElmTextTwenty.ayahHadithTwentyTwentyNine_8,
    ],
    order: '',
  ),

// page 30
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentyTherty_1,
      ElmTextTwenty.elmTextTwentyTherty_2,
      ElmTextTwenty.elmTextTwentyTherty_3,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyTherty_1,
      ElmTextTwenty.ayahHadithTwentyTherty_2,
    ],
    order: '',
  ),
  // page 31
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyThertyOne_1,
      ElmTextTwenty.ayahHadithTwentyThertyOne_2,
      ElmTextTwenty.ayahHadithTwentyThertyOne_3,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyThertyOne_1,
      ElmTextTwenty.elmTextTwentyThertyOne_2,
    ],
    order: '',
  ),
  // page 32
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentyThertyTwo_1,
    ],
    order: '',
  ),
// page 33
  ElmModelNewOrder(
    texts: [
      ElmTextTwenty.elmTextTwentyThertyThree_1,
      ElmTextTwenty.elmTextTwentyThertyThree_2,
      ElmTextTwenty.elmTextTwentyThertyThree_3,
    ],
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyThertyThree_1,
    ],
    subtitles: [
      ElmTextTwenty.subtitleTwentyThertyThree_1,
      ElmTextTwenty.subtitleTwentyThertyThree_2,
    ],
    order: '',
  ),

// page 34
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyThertyFour_1,
      ElmTextTwenty.ayahHadithTwentyThertyFour_2,
      ElmTextTwenty.ayahHadithTwentyThertyFour_3,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyThertyFour_1,
      ElmTextTwenty.elmTextTwentyThertyFour_2,
      ElmTextTwenty.elmTextTwentyThertyFour_3,
    ],
    order: '',
  ),
// page 35
  ElmModelNewOrder(
    ayahs: [
      ElmTextTwenty.ayahHadithTwentyThertyFive_1,
      ElmTextTwenty.ayahHadithTwentyThertyFive_2,
    ],
    texts: [
      ElmTextTwenty.elmTextTwentyThertyFive_1,
      ElmTextTwenty.elmTextTwentyThertyFive_2,
    ],
    order: '',
  ),
];
