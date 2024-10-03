// TextElmPre
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/text/elm_text_ders_pre.dart';

List<ElmModelNew> elmListPre = [
  // page 1
  ElmModelNew(
    titles: [ElmTextPre.titlePreOne],
    ayahs: [
      ElmTextPre.ayahHadithPreOne_1,
      ElmTextPre.ayahPreOneTest_2,
    ],
    texts: [ElmTextPre.elmTextPreOne_1],
  ),
  // page 2
  ElmModelNew(
    titles: [ElmTextPre.titlePreTwo],
    subtitles: [
      ElmTextPre.subtitlePreTwo_1,
      ElmTextPre.subtitlePreTwoTest_2,
    ],
    texts: [ElmTextPre.elmTextPreTwo_1],
  ),
  //page 3
  ElmModelNew(
    ayahs: [
      // order not nececery here but in getPageThree()
      ElmTextPre.ayahHadithPreThree_1,
      ElmTextPre.ayahHadithPreThree_2,
      ElmTextPre.ayahHadithPreThree_3
    ],
    texts: [
      ElmTextPre.elmTextPreThree_1,
      ElmTextPre.elmTextPreThree_2,
      ElmTextPre.elmTextPreThree_3,
      ElmTextPre.elmTextPreThree_4, //testin
    ],
  ),

  // page 4 testing
  ElmModelNew(
    texts: [ElmTextPre.elmTextPreFourTesting_1],
    ayahs: [ElmTextPre.ayahPreFourTesting_2],
    titles: [ElmTextPre.titlelePreFourTesting_1],
  ),

// page 5
  ElmModelNew(
      subtitles: [ElmTextPre.subtitlelePreFiverTesting_1],
      ayahs: [ElmTextPre.ayahPreFiveTesteing_1],
      texts: [ElmTextPre.elmTextPreFivTesting_1])
];
