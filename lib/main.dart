import 'package:elm/app_routes.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:elm/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // Splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // After splash screen now you can run the app
  runApp(const ElmApp());

  // Wait 2 seconds before removing the splash screen
  Future.delayed(const Duration(seconds: 2), () {
    FlutterNativeSplash.remove();
  });
}

class FlutterNativeSplash {
  static void preserve({required WidgetsBinding widgetsBinding}) {}

  static void remove() {}
}

class ElmApp extends StatelessWidget {
  const ElmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()), // Initialize HomeCubit
        // You can add more Cubits/Blocs here as needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Elm',
        theme: AppTheme.goldenTheme,
        initialRoute: RoutesConstant.home, // Set the initial route to Home

        onGenerateRoute: RouteApp.generateRoute, // Use the route generator
      ),
    );
  }
}
