import 'package:elm/core/data/model/page_content.dart';

class ElmModel {
  // Dont Repeat Your Self
  final PageContent pageOne;
  final PageContent pageTwo;
  final PageContent pageThree;

  // Constructor (named to make allow rearange them like i want)
  ElmModel({
    required this.pageOne,
    required this.pageTwo,
    required this.pageThree,
  });

  get elmText => null;
}
