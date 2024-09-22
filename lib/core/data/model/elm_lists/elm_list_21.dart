//TextDersSixTeen
import 'dart:math';

import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/text/elm_text_ders_twenty_one.dart';

// TextDersSeventeen
List<ElmModel> elmList21 = [
  // page 1
  ElmModel(
    title: ElmTextTwentyOne.titleTwentyOneOne,
    text: ElmTextTwentyOne.elmTextTwentyOneOne_1,
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneOne_1,
    text2: ElmTextTwentyOne.elmTextTwentyOneOne_2,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneOne_2,
    text3: ElmTextTwentyOne.elmTextTwentyOneOne_3,
  ),

// page 2
  ElmModel(
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneTwo_1,
    text: ElmTextTwentyOne.elmTextTwentyOneTwo_1,
    subtitle: ElmTextTwentyOne.subtitleTwentyOneTwo_1,
    text2: ElmTextTwentyOne.elmTextTwentyOneTwo_2,
  ),
  // page 3
  ElmModel(
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneThree_1,
    subtitle: ElmTextTwentyOne.subtitleTwentyOneThree_1,
    text: ElmTextTwentyOne.elmTextTwentyOneThree_1,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneThree_2,
    text2: ElmTextTwentyOne.elmTextTwentyOneThree_2,
    ayah3: ElmTextTwentyOne.ayahHadithTwentyOneThree_3,
    text3: ElmTextTwentyOne.elmTextTwentyOneThree_3,
    ayah4: ElmTextTwentyOne.ayahHadithTwentyOneThree_4,
  ),
  // page 4
  ElmModel(
    text: ElmTextTwentyOne.elmTextTwentyOneFour_1,
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneFour_1,
    text2: ElmTextTwentyOne.elmTextTwentyOneFour_2,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneFour_2,
  ),
  // page 5
  ElmModel(
    subtitle: ElmTextTwentyOne.subtitleTwentyOneFive_1,
    text: ElmTextTwentyOne.elmtTextTwentyOneFive_1,
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneFive_1,
    text2: ElmTextTwentyOne.elmTextTwentyOneFive_2,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneFive_2,
    text3: ElmTextTwentyOne.elmTextTwentyOneFive_3,
    ayah3: ElmTextTwentyOne.ayahHadithTwentyOneFive_3,
  ),
  // page 6
  ElmModel(
    text: ElmTextTwentyOne.elmTextTwentyOneSix_1,
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneSix_1,
    text2: ElmTextTwentyOne.elmTextTwentyOneSix_2,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneSix_2,
    text3: ElmTextTwentyOne.elmTextTwentyOneSix_3,
  ),
  // page 7
  ElmModel(
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneSeven_1,
    text: ElmTextTwentyOne.elmTextTwentyOneSeven_1,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneSeven_2,
    text2: ElmTextTwentyOne.elmTextTwentyOneSeven_2,
    ayah3: ElmTextTwentyOne.ayahHadithTwentyOneSeven_3,
  ),
  // page 8
  ElmModel(
    text: ElmTextTwentyOne.elmTextTwentyOneEight_1,
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneEight_1,
    text2: ElmTextTwentyOne.elmTextTwentyOneEight_2,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneEight_2,
    text3: ElmTextTwentyOne.elmTextTwentyOneEight_3,
    ayah3: ElmTextTwentyOne.ayahHadithTwentyOneEight_3,
    text4: ElmTextTwentyOne.elmTextTwentyOneEigth_4,
  ),
  // page 9
  ElmModel(
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneNine_1,
    text: ElmTextTwentyOne.elmTextTwentyOneNine_1,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneNine_2,
    text2: ElmTextTwentyOne.elmTextTwentyOneNine_2,
    ayah3: ElmTextTwentyOne.ayahHadithTwentyOneNine_3,
    subtitle: ElmTextTwentyOne.subtitleTwentyOneNine_1,
    text3: ElmTextTwentyOne.elmtTextTwentyOneNine_3,
  ),
  // page 10
  ElmModel(
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneTen_1,
    text: ElmTextTwentyOne.elmTextTwentyOneTen_1,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneTen_2,
  ),
  // page 11
  ElmModel(
    title: ElmTextTwentyOne.titleTwentyEleven,
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneEleven_1,
    text: ElmTextTwentyOne.elmTextTwentyOneEleven_1,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneEleven_2,
    text2: ElmTextTwentyOne.elmTextTwentyOneEleven_2,
    ayah3: ElmTextTwentyOne.ayahHadithTwentyOneEleven_3,
  ),
  // page 12
  ElmModel(
      text: ElmTextTwentyOne.elmTextTwentyOneTwelve_1,
      subtitle: ElmTextTwentyOne.subtitleTwentyOneTwelve_1,
      text2: ElmTextTwentyOne.elmTextTwentyOneTwelve_2,
      ayah: ElmTextTwentyOne.ayahHadithTwentyOneTwelve_1,
      text3: ElmTextTwentyOne.elmTextTwentyOneTwelve_3,
      ayah2: ElmTextTwentyOne.ayahHadithTwentyOneTwelve_2),

  // page 13
  ElmModel(
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneTherteen_1,
    text: ElmTextTwentyOne.elmTextTwentyOneeTherteen_1,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneTherteen_2,
  ),

  // page 14
  ElmModel(
    subtitle: ElmTextTwentyOne.subtitleTwentyOneFourteen_1,
    text: ElmTextTwentyOne.elmTextTwentyOneFourteen_1,
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneFourteen_1,
    text2: ElmTextTwentyOne.elmTextTwentyOneFourteen_2,
    ayah3: ElmTextTwentyOne.ayahHadithTwentyOneFourteen_3,
  ),

  // page 15
  ElmModel(
    text: ElmTextTwentyOne.elmTextTwentyOneFifteen_1,
    subtitle: ElmTextTwentyOne.subtitleTwentyOneFifteen_1,
    text2: ElmTextTwentyOne.elmTextTwentyOneFifteen_2,
    ayah: ElmTextTwentyOne.ayahHdithTwentyOneFifteen_1,
    text3: ElmTextTwentyOne.elmTextTwentyOneFifteen_3,
  ),
  // page 16
  ElmModel(
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneSixteen_1,
    text: ElmTextTwentyOne.elmTextTwentyOneSixteen_1,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneSixteen_2,
    text2: ElmTextTwentyOne.elmTextTwentyOneSixteen_2,
    ayah3: ElmTextTwentyOne.ayahHadithTwentyOneSixteen_3,
    text3: ElmTextTwentyOne.elmTextTwentyOneSixteen_3,
    ayah4: ElmTextTwentyOne.ayahHadithTwentyOneSixteen_4,
    text4: ElmTextTwentyOne.elmTextTwentyOneSixteen_4,
  ),
  // page 17
  ElmModel(
    subtitle: ElmTextTwentyOne.subtitleTwentyOneSeventeen_1,
    text: ElmTextTwentyOne.elmTextTwentyOneSeventeen_1,
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneSeventeen_1,
    subtitle2: ElmTextTwentyOne.subtitleTwentyOnSeventeen_2,
    text2: ElmTextTwentyOne.elmTextTwentyOneSeventeen_2,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneSeventeen_2,
    text3: ElmTextTwentyOne.elmTextTwentyOneSeventeen_3,
  ),

  // page 18
  ElmModel(
    text: ElmTextTwentyOne.elmTextTwentyOneEighteen_1,
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneEighteen_1,
    text2: ElmTextTwentyOne.elmTextTwentyOneEighteen_2,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneEighteen_2,
    text3: ElmTextTwentyOne.elmTextTwentyOneEighteen_3,
    ayah3: ElmTextTwentyOne.ayahHadithTwentyOneEighteen_3,
  ),
  // page 19
  ElmModel(
    text: ElmTextTwentyOne.elmTextTwentyOneNinteen_1,
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneNinteen_1,
    subtitle: ElmTextTwentyOne.subtitleTwentyOneNinteen_1,
    text2: ElmTextTwentyOne.elmTextTwentyOneNinteen_2,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneNinteen_2,
    text3: ElmTextTwentyOne.elmTextTwentyOneNinteen_3,
    ayah3: ElmTextTwentyOne.ayahHadithTwentyOneNinteen_3,
  ),
  // page 20
  ElmModel(
    subtitle: ElmTextTwentyOne.subtitleTwentyOneTwenty_1,
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneTwenty_1,
    text: ElmTextTwentyOne.elmTextTwentyOneTwenty_1,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneTwenty_2,
    text2: ElmTextTwentyOne.elmTextTwentyOneTwenty_2,
    ayah3: ElmTextTwentyOne.ayahHadithTwentyOneTwenty_3,
    text3: ElmTextTwentyOne.elmTextTwentyOneTwenty_3,
    ayah4: ElmTextTwentyOne.ayahHadithTwentyOneTwenty_4,
  ),
  // page 21
  ElmModel(
    subtitle: ElmTextTwentyOne.subtitleTwentyOneTwentyOne_1,
    text: ElmTextTwentyOne.elmTextTwentyOneTwentyOne_1,
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneTwentyOne_1,
    text2: ElmTextTwentyOne.elmTextTwentyOneTwentyOne_2,
    subtitle2: ElmTextTwentyOne.subtitleTwentyOneTwentyOne_2,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneTwentyOne_2,
  ),
  // page 22
  ElmModel(
    text: ElmTextTwentyOne.elmTextTwentyOneTwentyTwo_1,
    ayah: ElmTextTwentyOne.ayahHadithTwentyOneTwentyTwo_1,
    text2: ElmTextTwentyOne.elmTextTwentyOneTwentyTwo_2,
    ayah2: ElmTextTwentyOne.ayahHadithTwentyOneTwentyTwo_2,
    text3: ElmTextTwentyOne.elmTextTwentyOneTwentyTwo_3,
  ),
];
