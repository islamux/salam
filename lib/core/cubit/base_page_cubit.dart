import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/core/data/repository/khatira_repository.dart';
import 'package:khatir/core/services/get_page_text_for_sharing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import 'package:khatir/core/cubit/base_page_state.dart';

class BasePageCubit extends Cubit<BasePageState> {
  final KhatiraRepository _repository;
  final int chapterId;
  int currentPageIndex = 0;
  PageController pageController = PageController();
  double fontSize = 21.0;
  List<KhatiraModelNewOrder> _data = [];

  BasePageCubit({
    required KhatiraRepository repository,
    required this.chapterId,
  })  : _repository = repository,
        super(PageDataLoading()) {
    _loadChapter();
  }

  List<KhatiraModelNewOrder> get data => _data;

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

  void goToPage(int index) {
    pageController.jumpToPage(index);
    currentPageIndex = index;
    emit(PageChanged(index));
  }

  void goToPageAfterBuild(int index) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      goToPage(index);
    });
  }

  void customShareContent(int currentPageIndex) {
    try {
      final List<Text> shareText =
          getPageTextsForSharing(currentPageIndex, _data);
      final String joinedText = shareText.map((text) => text.data).join('\n');

      SharePlus.instance.share(ShareParams(text: joinedText));
      emit(PageShareSuccess());
    } catch (e) {
      emit(PageShareFailure(errorMessage: 'Failed to share!'));
    }
  }
}
