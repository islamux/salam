// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/cubit/share/get_page_text_for_sharing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import 'package:khatir/cubit/base_cubit/base_page_state.dart';

class BasePageCubit extends Cubit<BasePageState> {
  int currentPageIndex = 0;
  PageController pageController = PageController();
  double fontSize = 21.0;
  BasePageCubit() : super(PageInitial());

  // Methods -- //todo : move it from logic to ui
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

  void customShareContent(
      int currentPageIndex, List<KhatiraModelNewOrder> khatiraList) {
    try {
      final List<Text> shareText =
          getPageTextsForSharing(currentPageIndex, khatiraList);
      final String joinedText = shareText.map((text) => text.data).join('\n');

      SharePlus.instance.share(ShareParams(text: joinedText));
      emit(PageShareSuccess());
    } catch (e) {
      emit(PageShareFailure(errorMessage: 'Failed to share!'));
    }
  }
}
