import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/view/pages/elmpre_page.dart';
import 'package:elm/view/pages/home.dart';
import 'package:elm/view/pages/elm1_page.dart'; // Import your Elm1 page
import 'package:elm/view/pages/elm2_page.dart'; // Import your Elm2 page
import 'package:elm/view/pages/elm3_page.dart'; // Import your Elm3 page
import 'package:elm/view/pages/elm4_page.dart'; // Import your Elm4 page
import 'package:elm/view/pages/elm5_page.dart'; // Import your Elm5 page
import 'package:elm/view/pages/elm6_page.dart'; // Import your Elm6 page
import 'package:elm/view/pages/elm7_page.dart'; // Import your Elm7 page
import 'package:elm/view/pages/elm8_page.dart'; // Import your Elm8 page
import 'package:elm/view/pages/elm9_page.dart'; // Import your Elm9 page
import 'package:elm/view/pages/elm10_page.dart'; // Import your Elm10 page
import 'package:elm/view/pages/elm11_page.dart'; // Import your Elm11 page
import 'package:elm/view/pages/elm12_page.dart'; // Import your Elm12 page
import 'package:elm/view/pages/elm13_page.dart'; // Import your Elm13 page
import 'package:elm/view/pages/elm14_page.dart'; // Import your Elm14 page
import 'package:elm/view/pages/elm15_page.dart'; // Import your Elm15 page
import 'package:elm/view/pages/elm16_page.dart'; // Import your Elm16 page
import 'package:elm/view/pages/elm17_page.dart'; // Import your Elm17 page
import 'package:elm/view/pages/elm18_page.dart'; // Import your Elm18 page
import 'package:elm/view/pages/elm19_page.dart'; // Import your Elm19 page
import 'package:elm/view/pages/elm20_page.dart'; // Import your Elm20 page
import 'package:elm/view/pages/elm21_page.dart'; // Import your Elm21 page
import 'package:elm/view/pages/elm22_page.dart'; // Import your Elm22 page
import 'package:elm/view/pages/elm23_page.dart'; // Import your Elm23 page
import 'package:flutter/material.dart';

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
