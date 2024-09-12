// TextElmPre
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/text/elm_text_ders_pre.dart';

List<ElmModel> elmListPre = [
  // page 1
  ElmModel(
    title: ElmTextPre.titlePreOne,
    ayahs: [ElmTextPre.ayahHadithPreOne_1],
    texts: [ElmTextPre.elmTextPreOne_1],
  ),
  // page 2
  ElmModel(
    title: ElmTextPre.titlePreTwo,
    subtitles: [ElmTextPre.subtitlePreTwo_1],
    texts: [ElmTextPre.elmTextPreTwo_1],
  ),
  //page 3
  ElmModel(
    ayahs: [
      ElmTextPre.ayahHadithPreThree_1,
      ElmTextPre.ayahHadithPreThree_2,
      ElmTextPre.ayahHadithPreThree_3
    ],
    texts: [
      ElmTextPre.elmTextPreThree_1,
      ElmTextPre.elmTextPreThree_2,
      ElmTextPre.elmTextPreThree_3,
    ],
  ),
];
