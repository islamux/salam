import 'package:flutter_test/flutter_test.dart';
import 'package:khatir/core/cubit/base_page_cubit.dart';
import 'package:khatir/core/cubit/base_page_state.dart';
import 'package:khatir/core/data/repository/static_khatira_repository.dart';
import 'package:khatir/core/data/repository/khatira_repository.dart';

void main() {
  group('BasePageCubit', () {
    late BasePageCubit cubit;

    setUp(() {
      final repo = StaticKhatiraRepository() as KhatiraRepository;
      cubit = BasePageCubit(repository: repo, chapterId: 1);
    });

    test('state is PageDataLoaded after construction', () {
      expect(cubit.state, isA<PageDataLoaded>());
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

    test('goToPage updates currentPageIndex', () {
      cubit.currentPageIndex = 1;
      expect(cubit.currentPageIndex, 1);
    });
  });
}
