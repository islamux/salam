import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:elm/route.dart';
import 'package:elm/view/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'binding.dart';
void main() {
  // splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // After splash screen now you could run app
  runApp(const Elm());
  // wait 2 second showing splash screen.
  Future.delayed(const Duration(seconds: 2), () {
    FlutterNativeSplash.remove();
  });
}

class FlutterNativeSplash {
  static void preserve({required WidgetsBinding widgetsBinding}) {}

  static void remove() {}
}

class Elm extends StatelessWidget {
  const Elm({super.key});
  @override
  Widget build(BuildContext context) {
    // Remove splash screen after after app run

    //check if there are images in all application that decrease performance.
    //debugInvertOversizeImages = true; // i disable it after check images

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elm',
      theme: AppTheme.goldenTheme,
      initialBinding: MyBinding(),
      home:  const Home(),
      // Routes
      getPages: routes,
    );
  }
}
