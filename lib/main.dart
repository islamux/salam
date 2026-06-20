import 'package:khatir/core/data/repository/static_khatira_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:khatir/app_routes.dart';
import 'package:khatir/core/data/repository/khatira_repository.dart';
import 'package:khatir/core/routing/routes_constant.dart';
import 'package:khatir/core/theme/app_them.dart';

void main() {
  runApp(const KhatiraApp());
}

class KhatiraApp extends StatelessWidget {
  const KhatiraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<KhatiraRepository>(
      create: (_) => StaticKhatiraRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Khatira',
        theme: AppTheme.goldenTheme,
        initialRoute: RoutesConstant.home, // Set the initial route to Home
        onGenerateRoute: RouteApp.generateRoute, // Use the route generator
      ),
    );
  }
}
