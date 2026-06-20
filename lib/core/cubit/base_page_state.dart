import 'package:khatir/core/data/model/khatira_model_order.dart';

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

class PageDataLoaded extends BasePageState {
  final List<KhatiraModelOrder> data;
  PageDataLoaded({required this.data});
}

class PageDataLoading extends BasePageState {}
