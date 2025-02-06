import 'package:flutter_bloc/flutter_bloc.dart';

class FontCubit extends Cubit<double> {
  // Default font size is 16.0
  FontCubit() : super(16.0);

  // Method to increase font size
  void increaseFontSize() => emit(state + 1);

  // Method to decrease font size
  void decreaseFontSize() => emit(state - 1);

  // Method to set a specific font size
  void setFontSize(double size) => emit(size);
}
