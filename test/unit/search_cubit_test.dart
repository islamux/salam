import 'package:flutter_test/flutter_test.dart';
import 'package:khatir/core/data/model/khatira_model_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/features/search/cubit/search_cubit.dart';
import 'package:khatir/features/search/cubit/search_state.dart';

void main() {
  group('SearchCubit', () {
    late SearchCubit cubit;
    late List<KhatiraModelOrder> testData;

    setUp(() {
      cubit = SearchCubit();
      testData = [
        KhatiraModelOrder(
          titles: ['Test Title 1', 'Test Title 2'],
          subtitles: ['Test Subtitle 1'],
          texts: ['Test text 1', 'Test text 2', 'Test text 3'],
          ayahs: ['Test Ayah 1', 'Test Ayah 2'],
          footer: 'Test Footer',
          order: [EnOrder.titles, EnOrder.texts, EnOrder.ayahs],
        ),
        KhatiraModelOrder(
          titles: ['Test Title 2'],
          texts: ['Another text'],
          order: [EnOrder.titles, EnOrder.texts],
        ),
      ];
    });

    test('initial state is SearchInitial', () {
      expect(cubit.state, isA<SearchInitial>());
    });

    test('searchContent finds matching titles', () {
      cubit.searchContent('Test Title', testData);
      final state = cubit.state;
      expect(state, isA<SearchResults>());
      expect((state as SearchResults).results.length, 2);
    });

    test('searchContent finds matching texts', () {
      cubit.searchContent('text', testData);
      final state = cubit.state;
      expect(state, isA<SearchResults>());
      expect((state as SearchResults).results.length, 2);
    });

    test('searchContent finds matching ayahs', () {
      cubit.searchContent('Ayah', testData);
      final state = cubit.state;
      expect(state, isA<SearchResults>());
      expect((state as SearchResults).results.length, 1);
    });

    test('searchContent returns empty for no matches', () {
      cubit.searchContent('Nonexistent', testData);
      final state = cubit.state;
      expect(state, isA<SearchResults>());
      expect((state as SearchResults).results.isEmpty, true);
    });

    test('searchContent emits SearchInitial for empty query', () {
      cubit.searchContent('', testData);
      expect(cubit.state, isA<SearchInitial>());
    });
  });
}
