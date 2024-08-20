import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/view/pages/home.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routes = [
//  GetPage(name: AppRoute.elm16, page: () => const Elm16()),
  GetPage(name: AppRoute.home, page: () => const Home()),
];
