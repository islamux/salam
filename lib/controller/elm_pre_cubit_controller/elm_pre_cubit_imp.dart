abstract class ElmpreState {}

class ElmPreInitial extends ElmpreState {}

class ElmPreFontSizeChanged extends ElmpreState {
  final double fontSize;
  ElmPreFontSizeChanged(this.fontSize);
}

class ElmPrePageChanged extends ElmpreState {
  final int pageIndex;
ElmPrePageChanged(this.pageIndex);
}
