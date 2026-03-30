import 'package:elm/view/pages/elm26.dart';
import 'package:elm/view/pages/elm27.dart';
import 'package:elm/view/pages/elm28.dart';
import 'package:elm/view/pages/elm29.dart';
import 'package:elm/view/pages/elm30.dart';
import 'package:elm/view/pages/elm31.dart';
import 'package:flutter/material.dart';

import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/view/pages/elm1.dart';
import 'package:elm/view/pages/elm10.dart';
import 'package:elm/view/pages/elm11.dart';
import 'package:elm/view/pages/elm12.dart';
import 'package:elm/view/pages/elm13.dart';
import 'package:elm/view/pages/elm14.dart';
import 'package:elm/view/pages/elm15.dart';
import 'package:elm/view/pages/elm16.dart';
import 'package:elm/view/pages/elm17.dart';
import 'package:elm/view/pages/elm18.dart';
import 'package:elm/view/pages/elm19.dart';
import 'package:elm/view/pages/elm2.dart';
import 'package:elm/view/pages/elm20.dart';
import 'package:elm/view/pages/elm21.dart';
import 'package:elm/view/pages/elm22.dart';
import 'package:elm/view/pages/elm23.dart';
import 'package:elm/view/pages/elm24.dart';
import 'package:elm/view/pages/elm25.dart';
import 'package:elm/view/pages/elm3.dart';
import 'package:elm/view/pages/elm4.dart';
import 'package:elm/view/pages/elm5.dart';
import 'package:elm/view/pages/elm6.dart';
import 'package:elm/view/pages/elm7.dart';
import 'package:elm/view/pages/elm8.dart';
import 'package:elm/view/pages/elm9.dart';
import 'package:elm/view/pages/elm_final.dart';
import 'package:elm/view/pages/elmpre_page.dart';
import 'package:elm/view/pages/home.dart';

class RouteApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstant.home:
        return MaterialPageRoute(builder: (_) => const Home());

      case RoutesConstant.elmPre:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => ElmPrePage(initialPage: args));

      case RoutesConstant.elm1:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm1Page(initialPage: args));

      case RoutesConstant.elm2:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm2Page(initialPage: args));

      case RoutesConstant.elm3:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm3Page(initialPage: args));

      case RoutesConstant.elm4:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm4Page(initialPage: args));

      case RoutesConstant.elm5:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm5Page(initialPage: args));

      case RoutesConstant.elm6:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm6Page(initialPage: args));

      case RoutesConstant.elm7:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm7Page(initialPage: args));

      case RoutesConstant.elm8:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm8Page(initialPage: args));

      case RoutesConstant.elm9:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm9Page(initialPage: args));

      case RoutesConstant.elm10:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm10Page(initialPage: args));

      case RoutesConstant.elm11:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm11Page(initialPage: args));

      case RoutesConstant.elm12:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm12Page(initialPage: args));

      case RoutesConstant.elm13:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm13Page(initialPage: args));

      case RoutesConstant.elm14:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm14Page(initialPage: args));

      case RoutesConstant.elm15:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm15Page(initialPage: args));

      case RoutesConstant.elm16:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm16Page(initialPage: args));

      case RoutesConstant.elm17:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm17Page(initialPage: args));

      case RoutesConstant.elm18:
        final elm18Args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm18Page(initialPage: elm18Args));

      case RoutesConstant.elm19:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm19Page(initialPage: args));

      case RoutesConstant.elm20:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm20Page(initialPage: args));

      case RoutesConstant.elm21:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm21Page(initialPage: args));

      case RoutesConstant.elm22:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm22Page(initialPage: args));

      case RoutesConstant.elm23:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm23Page(initialPage: args));

      case RoutesConstant.elm24:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm24Page(initialPage: args));

      case RoutesConstant.elm25:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm25Page(initialPage: args));

      case RoutesConstant.elm26:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm26Page(initialPage: args));

      case RoutesConstant.elm27:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm27Page(initialPage: args));

      case RoutesConstant.elm28:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm28Page(initialPage: args));

      case RoutesConstant.elm29:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm29Page(initialPage: args));

      case RoutesConstant.elm30:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm30Page(initialPage: args));

      case RoutesConstant.elm31:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Elm31Page(initialPage: args));

      case RoutesConstant.elmFinal:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => ElmFinalPage(initialPage: args));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}
