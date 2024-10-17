import 'package:elm/controller/elm_pre_cubit_controller/elmpre_cubit.dart';
import 'package:elm/view/pages/elmprecubit/elmpre_cubit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String elmPre = '/elmPre';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case elmPre:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => ElmPreCubit(),
            child: const ElmPreCubitPage(),
          ),
        );
    }
  }
}
