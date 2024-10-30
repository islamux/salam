// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/cubit/base_cubit/base_page_state.dart';

// BaseCubit: يحتوي على كل الدوال الأساسية
abstract class BasePageCubit extends Cubit<BasePageState> {
  int currentPageIndex = 0;
  PageController pageController = PageController();
  double fontSize = 21.0;
  late List<ElmModelNew> elmList; // قائمة العناصر للنماذج
  BasePageCubit() : super(PageInitial());

  // Methods -- //todo : move it from logic to ui
  void resetCounter() {
    emit(PageUpdated(updatedCounter: 0));
  }

  void increaseFontSize() {
    if (fontSize <= 37.0) {
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

  // Share content function (reusable across all cubits)
  void customShareContent(int currentPageIndex, List<ElmModelNew> elmList) {
    try {
      final List<Text> shareText = getShareText(currentPageIndex, elmList);
      final String joinedText = shareText
          .map((text) => text.data)
          .join('\n'); // Join text elements with newline separator

      Share.share(joinedText);
      emit(PageShareSuccess()); // Optionally handle the success case
    } catch (e) {
      emit(PageShareFailure(errorMessage: 'Failed to share!'));
    }
  }

  List<Text> getShareText(int currentPageIndex, List<ElmModelNew> elmList);

  // البحث في محتوى `ElmModelNew`
  List<ElmModelNew> searchContent(String query) {
    final results = elmList.where((item) {
      bool containsInTitles =
          item.titles?.any((title) => title.contains(query)) ?? false;
      bool containsInSubtitles =
          item.subtitles?.any((subtitle) => subtitle.contains(query)) ?? false;
      bool containsInTexts =
          item.texts?.any((text) => text.contains(query)) ?? false;
      bool containsInAyahs =
          item.ayahs?.any((ayah) => ayah.contains(query)) ?? false;
      bool containsInFooter = item.footer?.contains(query) ?? false;

      return containsInTitles ||
          containsInSubtitles ||
          containsInTexts ||
          containsInAyahs ||
          containsInFooter;
    }).toList();

    emit(PageSearchResults(results));
    return results;
  }
}
