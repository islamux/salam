// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/cubit/base_cubit/base_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

// BaseCubit: يحتوي على كل الدوال الأساسية
abstract class BasePageCubit extends Cubit<BasePageState> {
  int currentPageIndex = 0;
  PageController pageController = PageController();
  double fontSize = 21.0;

  // late List<ElmModelNew> allTexts;
  // late List<ElmModelNew> searchedText;
  // bool isSearching = false;
  // final TextEditingController _searchTextController = TextEditingController();

  BasePageCubit() : super(PageInitial());

  // Methods -- //todo : move it from logic to ui

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
}
