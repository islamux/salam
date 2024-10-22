import 'package:elm/app_routes.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:elm/cubit/pages_cubits/home_cubit.dart';
import 'package:elm/cubit/font_cubit.dart'; // Import your FontCubit
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  // Splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // After splash screen, now you can run the app
  runApp(const ElmApp());

  // Wait 2 seconds before removing the splash screen
  Future.delayed(const Duration(seconds: 2), () {
    FlutterNativeSplash.remove();
  });
}

class ElmApp extends StatelessWidget {
  const ElmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()), // Initialize HomeCubit
        BlocProvider(create: (_) => FontCubit()), // Initialize FontCubit
        // Add more Cubits/Blocs here as needed
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
