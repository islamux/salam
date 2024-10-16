import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elm/controller/elm_pre_cubit_controller/elm_pre_cubit_imp.dart';

class ElmPreCubitControllerImp extends Cubit<ElmpreState> {
  ElmPreCubitControllerImp() : super(ElmPreInitial());

  double fontSize = 21.0;
  int currentIndex = 0;

  get resetCounter => null;

  get pageControllerAssma => null;

  get currentPageIndex => null;

  void increastFontSize() {
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
    currentIndex = index;
    emit(ElmPrePageChanged(index));
  }

  void goToPage(int index) {
    currentIndex = index;
    emit(ElmPrePageChanged(index));
  }

  customShareContent() {}
}
