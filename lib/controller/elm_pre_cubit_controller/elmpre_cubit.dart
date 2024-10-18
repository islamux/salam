import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elm/controller/elm_pre_cubit_controller/elm_pre_cubit_state.dart';

class ElmPreCubit extends Cubit<ElmPreState> {
  int currentPageIndex = 0; // Initialize the currentPageIndex
  PageController pageControllerAssma = PageController();

  ElmPreCubit() : super(ElmPreInitial());

  double fontSize = 21.0;
// Define the page counter or whatever value you want to reset
  int counter = 0;

  void resetCounter() {
    counter = 0; // Reset your counter or state logic here
    emit(ElmPreStateUpdated(
        updatedCounter: counter)); // Emit new state after resetting
  }

  void increasFontSize() {
    if (fontSize <= 37.0) {
      fontSize += 2.0;
      emit(ElmPreFontSizeChanged(fontSize));
    }
  }

  void decreaseFontSize() {
    if (fontSize > 21.0) {
      fontSize -= 2.0;
      emit(ElmPreFontSizeChanged(fontSize));
    }
  }

  void onPageChanged(int index) {
    currentPageIndex = index;
    emit(ElmPrePageChanged(index));
  }

  void goToPage(int index) {
    pageControllerAssma.jumpToPage(index);
    currentPageIndex = index;
    emit(ElmPrePageChanged(index));
  }

  customShareContent() {}
}
