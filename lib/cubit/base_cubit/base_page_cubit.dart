import 'package:elm/cubit/base_cubit/base_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

// BaseCubit: يحتوي على كل الدوال الأساسية
class BasePageCubit extends Cubit<BasePageState> {
  int currentPageIndex = 0;
  PageController pageController = PageController();
  double fontSize = 21.0;

  BasePageCubit() : super(PageInitial());

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

  // دالة مشاركة النص
  void shareContent(int index) {
    try {
      final String shareText =
          getShareText(index); // استدعاء الدالة المتغيرة في الصفحات المختلفة
      Share.share(shareText);
      emit(PageShareSuccess());
    } catch (e) {
      emit(PageShareFailure(errorMessage: 'Failed to share!'));
    }
  }

  // دالة getShareText التي سيتم تعديلها في كل صفحة
  String getShareText(int index) {
    return "Default shared content"; // محتوى افتراضي
  }
}
