import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:khatir/core/data/model/khatira_model_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';
import 'package:khatir/core/services/get_page_text_for_sharing.dart';

void main() {
  group('getPageTextsForSharing', () {
    test('returns texts in order specified by order field', () {
      final data = [
        KhatiraModelOrder(
          titles: ['Title 1', 'Title 2'],
          texts: ['Body text'],
          footer: 'Footnote',
          order: [EnOrder.titles, EnOrder.titles, EnOrder.texts, EnOrder.footer],
        ),
      ];

      final result = getPageTextsForSharing(0, data);

      expect(result.length, 4);
      expect((result[0] as Text).data, 'Title 1');
      expect((result[1] as Text).data, 'Title 2');
      expect((result[2] as Text).data, 'Body text');
      expect((result[3] as Text).data, 'Footnote');
    });

    test('returns texts in correct order when order is non-standard', () {
      final data = [
        KhatiraModelOrder(
          texts: ['First text'],
          titles: ['Second title'],
          order: [EnOrder.texts, EnOrder.titles],
        ),
      ];

      final result = getPageTextsForSharing(0, data);

      expect(result.length, 2);
      expect((result[0] as Text).data, 'First text');
      expect((result[1] as Text).data, 'Second title');
    });

    test('includes all field types', () {
      final data = [
        KhatiraModelOrder(
          titles: ['T'],
          subtitles: ['Sub'],
          texts: ['Text'],
          ayahs: ['Ayah'],
          footer: 'Foot',
          order: [
            EnOrder.titles,
            EnOrder.subtitles,
            EnOrder.texts,
            EnOrder.ayahs,
            EnOrder.footer,
          ],
        ),
      ];

      final result = getPageTextsForSharing(0, data);

      expect(result.length, 5);
      expect((result[0] as Text).data, 'T');
      expect((result[1] as Text).data, 'Sub');
      expect((result[2] as Text).data, 'Text');
      expect((result[3] as Text).data, 'Ayah');
      expect((result[4] as Text).data, 'Foot');
    });

    test('skips null fields gracefully', () {
      final data = [
        KhatiraModelOrder(
          titles: ['Only title'],
          order: [EnOrder.titles, EnOrder.texts, EnOrder.footer],
        ),
      ];

      final result = getPageTextsForSharing(0, data);

      expect(result.length, 1);
      expect((result[0] as Text).data, 'Only title');
    });

    test('handles empty lists in order', () {
      final data = [
        KhatiraModelOrder(
          titles: <String>[],
          texts: ['Text'],
          order: [EnOrder.titles, EnOrder.texts],
        ),
      ];

      final result = getPageTextsForSharing(0, data);

      expect(result.length, 1);
      expect((result[0] as Text).data, 'Text');
    });

    test('returns empty list when model has no matching fields', () {
      final data = [
        KhatiraModelOrder(
          order: [EnOrder.footer],
        ),
      ];

      final result = getPageTextsForSharing(0, data);

      expect(result, isEmpty);
    });

    test('handles multiple pages and returns correct page', () {
      final data = [
        KhatiraModelOrder(
          titles: ['Page 1 Title'],
          order: [EnOrder.titles],
        ),
        KhatiraModelOrder(
          texts: ['Page 2 Text'],
          order: [EnOrder.texts],
        ),
      ];

      final result = getPageTextsForSharing(1, data);

      expect(result.length, 1);
      expect((result[0] as Text).data, 'Page 2 Text');
    });
  });
}
