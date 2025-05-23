import 'package:elm/core/data/model/elm_model_new_order.dart';

abstract class BasePageState {}

class PageInitial extends BasePageState {}

class PageFontSizeChanged extends BasePageState {
  final double fontSize;
  PageFontSizeChanged(this.fontSize);
}

class PageChanged extends BasePageState {
  final int pageIndex;
  PageChanged(this.pageIndex);
}

class PageUpdated extends BasePageState {
  final int updatedCounter;
  PageUpdated({required this.updatedCounter});
}

class PageShareSuccess extends BasePageState {
  late final String message;
  PageShareSuccess({this.message = "Content shared successfully!"});
}

class PageShareFailure extends BasePageState {
  late final String errorMessage;
  PageShareFailure({required this.errorMessage});
}

// الحالات الخاصة بالبحث والمشاركة
class PageSearchResults extends BasePageState {
  final List<ElmModelNewOrder> results;
  PageSearchResults(this.results);
}
