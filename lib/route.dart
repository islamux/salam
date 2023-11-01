import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/view/pages/elm1.dart';
import 'package:elm/view/pages/elm10.dart';
import 'package:elm/view/pages/elm11.dart';
import 'package:elm/view/pages/elm12.dart';
import 'package:elm/view/pages/elm13.dart';
import 'package:elm/view/pages/elm14.dart';
import 'package:elm/view/pages/elm15.dart';
import 'package:elm/view/pages/elm16.dart';
import 'package:elm/view/pages/elm2.dart';
import 'package:elm/view/pages/elm3.dart';
import 'package:elm/view/pages/elm4.dart';
import 'package:elm/view/pages/elm5.dart';
import 'package:elm/view/pages/elm6.dart';
import 'package:elm/view/pages/elm7.dart';
import 'package:elm/view/pages/elm8.dart';
import 'package:elm/view/pages/elm9.dart';
import 'package:elm/view/pages/elmpre.dart';
import 'package:elm/view/pages/home.dart';
import 'package:get/get.dart';


List<GetPage<dynamic>> routes = [
  GetPage(name: AppRoute.elmPre, page: ()=> const ElmPre()),
  GetPage(name: AppRoute.elm1, page: () => const Elm1()),
  GetPage(name: AppRoute.elm2, page: () => const Elm2()),
  GetPage(name: AppRoute.elm3, page: () => const Elm3()),
  GetPage(name: AppRoute.elm4, page: () => const Elm4()),
  GetPage(name: AppRoute.elm5, page: () => const Elm5()),
  GetPage(name: AppRoute.elm6, page: () => const Elm6()),
  GetPage(name: AppRoute.elm7, page: () => const Elm7()),
  GetPage(name: AppRoute.elm8, page: () => const Elm8()),
  GetPage(name: AppRoute.elm9, page: () => const Elm9()),
  GetPage(name: AppRoute.elm10,page: () => const Elm10()),
  GetPage(name: AppRoute.elm11,page: () => const Elm11()),
  GetPage(name: AppRoute.elm12,page: () => const Elm12()),
  GetPage(name: AppRoute.elm12,page: () => const Elm12()),
  GetPage(name: AppRoute.elm13,page: () => const Elm13()),
  GetPage(name: AppRoute.elm14,page: () => const Elm14()),
  GetPage(name: AppRoute.elm15,page: () => const Elm15()),
  GetPage(name: AppRoute.elm16,page: () => const Elm16()),
  GetPage(name: AppRoute.home, page: () =>  const Home()),
];
