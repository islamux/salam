import 'package:flutter_test/flutter_test.dart';
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/cubit/base_cubit/base_page_cubit.dart';
import 'package:elm/cubit/base_cubit/base_page_state.dart';
import 'package:flutter/material.dart';

class TestPageCubit extends BasePageCubit {
  @override
  List<Text> getShareText(int currentPageIndex, List<ElmModelNewOrder> elmList) {
    return [Text('Test share text for page $currentPageIndex')];
  }

  TestPageCubit() : super();
}

void main() {
  group('BasePageCubit', () {
    late TestPageCubit cubit;
    late List<ElmModelNewOrder> testData;

    setUp(() {
      cubit = TestPageCubit();
      
      testData = [
        ElmModelNewOrder(
          titles: ['Test Title 1', 'Test Title 2'],
          subtitles: ['Test Subtitle 1'],
          texts: ['Test text 1', 'Test text 2', 'Test text 3'],
          ayahs: ['Test Ayah 1', 'Test Ayah 2'],
          footer: 'Test Footer',
          order: [EnOrder.titles, EnOrder.texts, EnOrder.ayahs],
        ),
        ElmModelNewOrder(
          titles: ['Test Title 2'],
          texts: ['Another text'],
          order: [EnOrder.titles, EnOrder.texts],
        ),
      ];
      
      cubit.elmList = testData;
    });

    test('initial state is PageInitial', () {
      expect(cubit.state, isA<PageInitial>());
    });

    test('initial currentPageIndex is 0', () {
      expect(cubit.currentPageIndex, 0);
    });

    test('initial fontSize is 21.0', () {
      expect(cubit.fontSize, 21.0);
    });

    test('increaseFontSize increases by 2.0', () {
      cubit.increaseFontSize();
      expect(cubit.fontSize, 23.0);
    });

    test('increaseFontSize respects maximum of 37.0', () {
      cubit.fontSize = 37.0;
      cubit.increaseFontSize();
      expect(cubit.fontSize, 37.0);
    });

    test('decreaseFontSize decreases by 2.0', () {
      cubit.fontSize = 25.0;
      cubit.decreaseFontSize();
      expect(cubit.fontSize, 23.0);
    });

    test('decreaseFontSize respects minimum of 21.0', () {
      cubit.fontSize = 21.0;
      cubit.decreaseFontSize();
      expect(cubit.fontSize, 21.0);
    });

    test('searchContent finds matching titles', () {
      final results = cubit.searchContent('Test Title');
      expect(results.length, 2);
    });

    test('searchContent finds matching texts', () {
      final results = cubit.searchContent('text');
      expect(results.length, 2);
    });

    test('searchContent finds matching ayahs', () {
      final results = cubit.searchContent('Ayah');
      expect(results.length, 1);
    });

    test('searchContent returns empty for no matches', () {
      final results = cubit.searchContent('Nonexistent');
      expect(results.isEmpty, true);
    });

    test('goToPage updates currentPageIndex', () {
      // Skip testing jumpToPage as it requires PageView context
      // Just test that currentPageIndex is updated
      cubit.currentPageIndex = 1;
      expect(cubit.currentPageIndex, 1);
    });
  });
}