import 'package:khatir/features/home/presentation/home.dart';
import 'package:flutter/material.dart';

import 'package:khatir/core/routing/routes_constant.dart';
import 'package:khatir/features/khatira/presentation/khatira1.dart';
import 'package:khatir/features/khatira/presentation/khatira10.dart';
import 'package:khatir/features/khatira/presentation/khatira11.dart';
import 'package:khatir/features/khatira/presentation/khatira12.dart';
import 'package:khatir/features/khatira/presentation/khatira13.dart';
import 'package:khatir/features/khatira/presentation/khatira14.dart';
import 'package:khatir/features/khatira/presentation/khatira15.dart';
import 'package:khatir/features/khatira/presentation/khatira16.dart';
import 'package:khatir/features/khatira/presentation/khatira17.dart';
import 'package:khatir/features/khatira/presentation/khatira18.dart';
import 'package:khatir/features/khatira/presentation/khatira19.dart';
import 'package:khatir/features/khatira/presentation/khatira2.dart';
import 'package:khatir/features/khatira/presentation/khatira20.dart';
import 'package:khatir/features/khatira/presentation/khatira21.dart';
import 'package:khatir/features/khatira/presentation/khatira22.dart';
import 'package:khatir/features/khatira/presentation/khatira23.dart';
import 'package:khatir/features/khatira/presentation/khatira24.dart';
import 'package:khatir/features/khatira/presentation/khatira25.dart';
import 'package:khatir/features/khatira/presentation/khatira26.dart';
import 'package:khatir/features/khatira/presentation/khatira27.dart';
import 'package:khatir/features/khatira/presentation/khatira28.dart';
import 'package:khatir/features/khatira/presentation/khatira29.dart';
import 'package:khatir/features/khatira/presentation/khatira3.dart';
import 'package:khatir/features/khatira/presentation/khatira30.dart';
import 'package:khatir/features/khatira/presentation/khatira31.dart';
import 'package:khatir/features/khatira/presentation/khatira32.dart';
import 'package:khatir/features/khatira/presentation/khatira4.dart';
import 'package:khatir/features/khatira/presentation/khatira5.dart';
import 'package:khatir/features/khatira/presentation/khatira6.dart';
import 'package:khatir/features/khatira/presentation/khatira7.dart';
import 'package:khatir/features/khatira/presentation/khatira8.dart';
import 'package:khatir/features/khatira/presentation/khatira9.dart';
import 'package:khatir/features/khatira/presentation/khatira_final.dart';
import 'package:khatir/features/khatira/presentation/khatira_pre_page.dart';

class RouteApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstant.home:
        return MaterialPageRoute(builder: (_) => const Home());

      case RoutesConstant.khatiraPre:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => KhatiraPrePage(initialPage: args));

      case RoutesConstant.khatira1:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira1Page(initialPage: args));

      case RoutesConstant.khatira2:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira2Page(initialPage: args));

      case RoutesConstant.khatira3:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira3Page(initialPage: args));

      case RoutesConstant.khatira4:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira4Page(initialPage: args));

      case RoutesConstant.khatira5:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira5Page(initialPage: args));

      case RoutesConstant.khatira6:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira6Page(initialPage: args));

      case RoutesConstant.khatira7:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira7Page(initialPage: args));

      case RoutesConstant.khatira8:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira8Page(initialPage: args));

      case RoutesConstant.khatira9:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira9Page(initialPage: args));

      case RoutesConstant.khatira10:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira10Page(initialPage: args));

      case RoutesConstant.khatira11:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira11Page(initialPage: args));

      case RoutesConstant.khatira12:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira12Page(initialPage: args));

      case RoutesConstant.khatira13:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira13Page(initialPage: args));

      case RoutesConstant.khatira14:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira14Page(initialPage: args));

      case RoutesConstant.khatira15:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira15Page(initialPage: args));

      case RoutesConstant.khatira16:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira16Page(initialPage: args));

      case RoutesConstant.khatira17:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira17Page(initialPage: args));

      case RoutesConstant.khatira18:
        final khatira18Args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira18Page(initialPage: khatira18Args));

      case RoutesConstant.khatira19:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira19Page(initialPage: args));

      case RoutesConstant.khatira20:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira20Page(initialPage: args));

      case RoutesConstant.khatira21:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira21Page(initialPage: args));

      case RoutesConstant.khatira22:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira22Page(initialPage: args));

      case RoutesConstant.khatira23:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira23Page(initialPage: args));

      case RoutesConstant.khatira24:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira24Page(initialPage: args));

      case RoutesConstant.khatira25:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira25Page(initialPage: args));

      case RoutesConstant.khatira26:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira26Page(initialPage: args));

      case RoutesConstant.khatira27:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira27Page(initialPage: args));

      case RoutesConstant.khatira28:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira28Page(initialPage: args));

      case RoutesConstant.khatira29:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira29Page(initialPage: args));

      case RoutesConstant.khatira30:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira30Page(initialPage: args));

      case RoutesConstant.khatira31:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira31Page(initialPage: args));

      case RoutesConstant.khatira32:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => Khatira32Page(initialPage: args));

      case RoutesConstant.khatiraFinal:
        final args = settings.arguments as int?;
        return MaterialPageRoute(
            builder: (_) => KhatiraFinalPage(initialPage: args));

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
