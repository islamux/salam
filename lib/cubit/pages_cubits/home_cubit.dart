import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/cubit/base_cubit/base_page_cubit.dart';
import 'package:flutter/material.dart';

// Define HomeCubit
class HomeCubit extends BasePageCubit {
  // Navigation functions
  void goToElmPre(BuildContext context) {
    Navigator.pushNamed(context, RoutesConstant.elmPre);
  }

  void goToElm1(BuildContext context) {
    Navigator.pushNamed(context, RoutesConstant.elm1);
  }

  void goToElm2(BuildContext context) {
    Navigator.pushNamed(context, RoutesConstant.elm2);
  }

  void goToElm3(BuildContext context) {
    Navigator.pushNamed(context, RoutesConstant.elm3);
  }

  void goToElm4(BuildContext context) {
    Navigator.pushNamed(context, RoutesConstant.elm4);
  }

  void goToElm5(BuildContext context) {
    Navigator.pushNamed(context, RoutesConstant.elm5);
  }
}
