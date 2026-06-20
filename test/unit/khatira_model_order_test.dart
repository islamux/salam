import 'package:flutter_test/flutter_test.dart';
import 'package:khatir/core/data/model/khatira_model_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';

void main() {
  group('KhatiraModelOrder', () {
    final baseOrder = [EnOrder.titles, EnOrder.texts];
    final testModel = KhatiraModelOrder(
      titles: ['Title 1', 'Title 2'],
      subtitles: ['Sub 1'],
      texts: ['Text 1', 'Text 2', 'Text 3'],
      ayahs: ['Ayah 1'],
      footer: 'Footer text',
      order: baseOrder,
    );

    test('constructor assigns all fields', () {
      expect(testModel.titles, ['Title 1', 'Title 2']);
      expect(testModel.subtitles, ['Sub 1']);
      expect(testModel.texts, ['Text 1', 'Text 2', 'Text 3']);
      expect(testModel.ayahs, ['Ayah 1']);
      expect(testModel.footer, 'Footer text');
      expect(testModel.order, baseOrder);
    });

    test('optional fields default to null', () {
      final minimal = KhatiraModelOrder(order: [EnOrder.footer]);
      expect(minimal.titles, isNull);
      expect(minimal.subtitles, isNull);
      expect(minimal.texts, isNull);
      expect(minimal.ayahs, isNull);
      expect(minimal.footer, isNull);
      expect(minimal.order, [EnOrder.footer]);
    });

    group('copyWith', () {
      test('returns identical model with no args', () {
        final copy = testModel.copyWith();
        expect(copy, testModel);
      });

      test('overrides specified fields', () {
        final copy = testModel.copyWith(titles: ['New Title']);
        expect(copy.titles, ['New Title']);
        expect(copy.subtitles, testModel.subtitles);
        expect(copy.texts, testModel.texts);
      });

      test('does not mutate original', () {
        testModel.copyWith(titles: ['New Title']);
        expect(testModel.titles, ['Title 1', 'Title 2']);
      });
    });

    group('equality', () {
      test('identical objects are equal', () {
        expect(testModel == testModel, isTrue);
        expect(testModel, testModel);
      });

    test('same values are equal', () {
      final same = KhatiraModelOrder(
        titles: ['Title 1', 'Title 2'],
        subtitles: ['Sub 1'],
        texts: ['Text 1', 'Text 2', 'Text 3'],
        ayahs: ['Ayah 1'],
        footer: 'Footer text',
        order: [EnOrder.titles, EnOrder.texts],
      );
      expect(same, testModel);
    });

      test('different values are not equal', () {
        final different = KhatiraModelOrder(
          titles: ['Different'],
          order: baseOrder,
        );
        expect(testModel == different, isFalse);
      });

      test('different type is not equal', () {
        expect(testModel == 'string', isFalse);
      });
    });

    group('hashCode', () {
      test('consistent for same object', () {
        final hash1 = testModel.hashCode;
        final hash2 = testModel.hashCode;
        expect(hash1, hash2);
      });

      test('same values produce same hash', () {
        final same = KhatiraModelOrder(
          titles: ['Title 1', 'Title 2'],
          subtitles: ['Sub 1'],
          texts: ['Text 1', 'Text 2', 'Text 3'],
          ayahs: ['Ayah 1'],
          footer: 'Footer text',
          order: baseOrder,
        );
        expect(testModel.hashCode, same.hashCode);
      });

      test('different values produce different hash', () {
        final different = KhatiraModelOrder(titles: ['X'], order: [EnOrder.titles]);
        expect(testModel.hashCode == different.hashCode, isFalse);
      });
    });

    group('toString', () {
      test('contains class name', () {
        expect(testModel.toString(), contains('KhatiraModelOrder'));
      });

      test('contains field values', () {
        final str = testModel.toString();
        expect(str, contains('Title 1'));
        expect(str, contains('Footer text'));
      });
    });
  });
}
