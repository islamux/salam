// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class ElmPreShareSuccess extends ElmPreState {
  late final String message;
  ElmPreShareSuccess({
    this.message = "Content shared succesfully!",
  });
}

class ElmPreShareFailure extends ElmPreState {
  late final String erroMessage;
  ElmPreShareFailure({
    required this.erroMessage,
  });
}
