import 'package:elm/view/pages/elm25.dart';
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
        return MaterialPageRoute(builder: (_) => const ElmPrePage());

      case RoutesConstant.elm1:
        return MaterialPageRoute(builder: (_) => const Elm1Page());

      case RoutesConstant.elm2:
        return MaterialPageRoute(builder: (_) => const Elm2Page());

      case RoutesConstant.elm3:
        return MaterialPageRoute(builder: (_) => const Elm3Page());

      case RoutesConstant.elm4:
        return MaterialPageRoute(builder: (_) => const Elm4Page());

      case RoutesConstant.elm5:
        return MaterialPageRoute(builder: (_) => const Elm5Page());

      case RoutesConstant.elm6:
        return MaterialPageRoute(builder: (_) => const Elm6Page());

      case RoutesConstant.elm7:
        return MaterialPageRoute(builder: (_) => const Elm7Page());

      case RoutesConstant.elm8:
        return MaterialPageRoute(builder: (_) => const Elm8Page());

      case RoutesConstant.elm9:
        return MaterialPageRoute(builder: (_) => const Elm9Page());

      case RoutesConstant.elm10:
        return MaterialPageRoute(builder: (_) => const Elm10Page());

      case RoutesConstant.elm11:
        return MaterialPageRoute(builder: (_) => const Elm11Page());

      case RoutesConstant.elm12:
        return MaterialPageRoute(builder: (_) => const Elm12Page());

      case RoutesConstant.elm13:
        return MaterialPageRoute(builder: (_) => const Elm13Page());

      case RoutesConstant.elm14:
        return MaterialPageRoute(builder: (_) => const Elm14Page());

      case RoutesConstant.elm15:
        return MaterialPageRoute(builder: (_) => const Elm15Page());

      case RoutesConstant.elm16:
        return MaterialPageRoute(builder: (_) => const Elm16Page());

      case RoutesConstant.elm17:
        return MaterialPageRoute(builder: (_) => const Elm17Page());

      case RoutesConstant.elm18:
        return MaterialPageRoute(builder: (_) => const Elm18Page());

      case RoutesConstant.elm19:
        return MaterialPageRoute(builder: (_) => const Elm19Page());

      case RoutesConstant.elm20:
        return MaterialPageRoute(builder: (_) => const Elm20Page());

      case RoutesConstant.elm21:
        return MaterialPageRoute(builder: (_) => const Elm21Page());

      case RoutesConstant.elm22:
        return MaterialPageRoute(builder: (_) => const Elm22Page());

      case RoutesConstant.elm23:
        return MaterialPageRoute(builder: (_) => const Elm23Page());

      case RoutesConstant.elm24:
        return MaterialPageRoute(builder: (_) => const Elm24Page());

      case RoutesConstant.elm25:
        return MaterialPageRoute(builder: (_) => const Elm25Page());

      case RoutesConstant.elmFinal:
        return MaterialPageRoute(builder: (_) => const ElmFinalPage());

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
