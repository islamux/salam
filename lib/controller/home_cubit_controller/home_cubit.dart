import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // Navigation functions
  void goToElmPre(BuildContext context) {
    // Navigate to the ElmPre page
    Navigator.pushNamed(context, '/elmPre');
  }

  void goToElm1(BuildContext context) {
    // Navigate to the Elm1 page
    Navigator.pushNamed(context, '/elm1');
  }

  void goToElm2(BuildContext context) {
    // Navigate to the Elm2 page
    Navigator.pushNamed(context, '/elm2');
  }

  void goToElm3(BuildContext context) {
    // Navigate to the Elm3 page
    Navigator.pushNamed(context, '/elm3');
  }

  void goToElm4(BuildContext context) {
    // Navigate to the Elm4 page
    Navigator.pushNamed(context, '/elm4');
  }

  void goToElm5(BuildContext context) {
    // Navigate to the Elm5 page
    Navigator.pushNamed(context, '/elm5');
  }
}

// State Definitions
abstract class HomeState {}

class HomeInitial extends HomeState {}

// More state classes can be defined if needed
