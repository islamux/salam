import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/view/pages/elmpre_page.dart';
import 'package:flutter/material.dart';
import 'package:elm/view/pages/home.dart';

class RouteApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstant.home:
        return MaterialPageRoute(builder: (_) => const Home());

      case RoutesConstant.elmPre:
        return MaterialPageRoute(builder: (_) => const ElmPrePage());

      // case '/elm1':
      //   return MaterialPageRoute(builder: (_) => const Elm1Page());

      // case '/elm2':
      //   return MaterialPageRoute(builder: (_) => const Elm2Page());

      // case '/elm3':
      //   return MaterialPageRoute(builder: (_) => const Elm3Page());

      // case '/elm4':
      //   return MaterialPageRoute(builder: (_) => const Elm4Page());

      // case '/elm5':
      //   return MaterialPageRoute(builder: (_) => const Elm5Page());

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
