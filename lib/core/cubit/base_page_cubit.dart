import 'package:khatir/core/data/model/khatira_model_order.dart';
import 'package:khatir/core/data/repository/khatira_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:khatir/core/cubit/base_page_state.dart';

class BasePageCubit extends Cubit<BasePageState> {
  final KhatiraRepository _repository;
  final int chapterId;
  int currentPageIndex = 0;
  double fontSize = 21.0;
  List<KhatiraModelOrder> _data = [];

  BasePageCubit({
    required KhatiraRepository repository,
    required this.chapterId,
  })  : _repository = repository,
        super(PageDataLoading()) {
    _loadChapter();
  }

  List<KhatiraModelOrder> get data => _data;

  void _loadChapter() {
    emit(PageDataLoading());
    _repository.getChapter(chapterId).then((chapterData) {
      _data = chapterData;
      emit(PageDataLoaded(data: chapterData));
    });
  }

  void resetCounter() {
    emit(PageUpdated(updatedCounter: 0));
  }

  void increaseFontSize() {
    if (fontSize < 37.0) {
      fontSize += 2.0;
      emit(PageFontSizeChanged(fontSize));
    }
  }

  void decreaseFontSize() {
    if (fontSize > 21.0) {
      fontSize -= 2.0;
      emit(PageFontSizeChanged(fontSize));
    }
  }

  void onPageChanged(int index) {
    currentPageIndex = index;
    emit(PageChanged(index));
  }
}
