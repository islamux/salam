abstract class ElmPreState {}

class ElmPreInitial extends ElmPreState {}

class ElmPreFontSizeChanged extends ElmPreState {
  final double fontSize;
  ElmPreFontSizeChanged(this.fontSize);
}

class ElmPrePageChanged extends ElmPreState {
  final int pageIndex;
  ElmPrePageChanged(this.pageIndex);
}

class ElmPreStateUpdated extends ElmPreState {
  // You can add additional properties here if needed, for example:
  final int updatedCounter;
  ElmPreStateUpdated({required this.updatedCounter});
}
