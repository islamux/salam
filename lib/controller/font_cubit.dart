import 'package:flutter_bloc/flutter_bloc.dart';

class FontCubit extends Cubit<double> {
  FontCubit() : super(21.0); // initial font size

  void increaseFontSize() {
    if (state < 37.0) emit(state + 2.0);
  }

  void decreaseFontSize() {
    if (state > 21.0) emit(state - 2.0);
  }
}
