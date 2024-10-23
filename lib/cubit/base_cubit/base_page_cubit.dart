import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/cubit/base_cubit/base_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

// BaseCubit: يحتوي على كل الدوال الأساسية
class BasePageCubit extends Cubit<BasePageState> {
  int currentPageIndex = 0;
  PageController pageController = PageController();
  double fontSize = 21.0;

  // late List<ElmModelNew> allTexts;
  // late List<ElmModelNew> searchedText;
  // bool isSearching = false;
  // final TextEditingController _searchTextController = TextEditingController();

  BasePageCubit() : super(PageInitial());

  // Methods
  // TextField buildSearchField() {
  //   return TextField(
  //     controller: _searchTextController,
  //     cursorColor: AppColor.grey,
  //     decoration: const InputDecoration(
  //       hintText: "البحث عن نص...",
  //       border: InputBorder.none,
  //       hintStyle: TextStyle(color: AppColor.grey, fontSize: 18),
  //     ),
  //     style: const TextStyle(color: AppColor.grey, fontSize: 18),
  //     onChanged: (searchedText) {
  //       addSearchedTextToSearchedList(searchedText);
  //     },
  //   );
  // }

  // void addSearchedTextToSearchedList(String searchedText) {
  //   searchedText = allTexts.where(test)  // todo : my model is list<string> and he wants only string
  // }

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
      final String shareText = getShareText(currentPageIndex, elmList);
      Share.share(shareText);
      emit(PageShareSuccess()); // Optionally handle the success case
    } catch (e) {
      emit(PageShareFailure(errorMessage: 'Failed to share!'));
    }
  }

  // getShareText method (to be used by all pages)
  String getShareText(int index, List<ElmModelNew> elmList) {
    if (index < 0 || index >= elmList.length) {
      return 'Invalid page';
    }

    final pageContent = elmList[index];
    String shareText = '';

    if (pageContent.titles != null) {
      shareText += '${pageContent.titles!.join('\n')}\n\n';
    }
    if (pageContent.subtitles != null) {
      shareText += '${pageContent.subtitles!.join('\n')}\n\n';
    }
    if (pageContent.ayahs != null) {
      shareText += '${pageContent.ayahs!.join('\n')}\n\n';
    }
    if (pageContent.texts != null) {
      shareText += '${pageContent.texts!.join('\n')}\n\n';
    }
    if (pageContent.footer != null) {
      shareText += pageContent.footer!;
    }

    return shareText.trim();
  }
}




  // // دالة مشاركة النص
  // void shareContent(int index) {
  //   try {
  //     final String shareText =
  //         getShareText(index); // استدعاء الدالة المتغيرة في الصفحات المختلفة
  //     Share.share(shareText);
  //     emit(PageShareSuccess());
  //   } catch (e) {
  //     emit(PageShareFailure(errorMessage: 'Failed to share!'));
  //   }
  // }

  // // دالة getShareText التي سيتم تعديلها في كل صفحة
  // String getShareText(int index) {
  //   // دالة افتراضية يمكن تجاوزها في cubits الفرعية
  //   return "Default shared content"; // محتوى افتراضي
  // }

