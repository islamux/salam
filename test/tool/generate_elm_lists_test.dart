import 'package:flutter_test/flutter_test.dart';
import '../../tool/generate_elm_lists.dart';

void main() {
  group('inferFieldType', () {
    test('identifies titles', () {
      expect(inferFieldType('titleOneOne'), FieldType.titles);
      expect(inferFieldType('titlePreOne_1'), FieldType.titles);
      expect(inferFieldType('titleFInalPageFour_1'), FieldType.titles);
    });

    test('identifies subtitles', () {
      expect(inferFieldType('subtitleOneOne'), FieldType.subtitles);
      expect(inferFieldType('subtitlePreOne_1'), FieldType.subtitles);
    });

    test('identifies khatiraText fields', () {
      expect(inferFieldType('khatiraTextOneOne_1'), FieldType.texts);
      expect(inferFieldType('khatiraTextTwentyTwo_1'), FieldType.texts);
      expect(inferFieldType('khatiraTextPreOne_1'), FieldType.texts);
    });

    test('identifies text fields (short form)', () {
      expect(inferFieldType('textFInalPageOne_1'), FieldType.texts);
    });

    test('identifies ayahHadith fields', () {
      expect(inferFieldType('ayahHadithOneTwo_1'), FieldType.ayahs);
      expect(inferFieldType('ayahHadithTwentyOne_1'), FieldType.ayahs);
    });

    test('handles ayahHadith typo variants', () {
      expect(inferFieldType('ayaHadithOneOne_1'), FieldType.ayahs);
      expect(inferFieldType('ayahaHadithOneOne_1'), FieldType.ayahs);
      expect(inferFieldType('ayahHdithOneOne_1'), FieldType.ayahs);
    });

    test('identifies footer', () {
      expect(inferFieldType('footerOneOne'), FieldType.footer);
      expect(inferFieldType('footerPreOne'), FieldType.footer);
    });

    test('throws on unknown type', () {
      expect(() => inferFieldType('unknownField'), throwsArgumentError);
      expect(() => inferFieldType('xyzField'), throwsArgumentError);
    });
  });

  group('wordToNum', () {
    test('contains all expected word-to-number mappings', () {
      expect(wordToNum, containsPair('pre', 'pre'));
      expect(wordToNum, containsPair('final', 'final'));
      expect(wordToNum, containsPair('one', '1'));
      expect(wordToNum, containsPair('two', '2'));
      expect(wordToNum, containsPair('thirty_two', '32'));
    });

    test('has correct mapping for all 34 lesson names', () {
      final lessons = [
        'pre',
        'final',
        'one',
        'two',
        'three',
        'four',
        'five',
        'six',
        'seven',
        'eight',
        'nine',
        'ten',
        'eleven',
        'twelve',
        'therteen',
        'fourteen',
        'fifteen',
        'sixteen',
        'seventeen',
        'eighteen',
        'nineteen',
        'twenty',
        'twenty_one',
        'twenty_two',
        'twenty_three',
        'twenty_four',
        'twenty_five',
        'twenty_six',
        'twenty_seven',
        'twenty_eight',
        'twenty_nine',
        'thirty',
        'thirty_one',
        'thirty_two'
      ];
      for (final lesson in lessons) {
        expect(wordToNum, contains(lesson));
      }
    });
  });

  group('extractFields', () {
    test('extracts fields from a simple text snippet', () {
      final source = r'''
class TestDers {
  static const String titleOneOne = """Title content""";
  static const String khatiraTextOneOne_1 = """Text content""";
  static const String ayahHadithOneTwo_1 = """Ayah content""";
  static const String footerOneOne = """Footer""";
}
''';
      final fields = extractFields(source);
      expect(fields.length, 4);
      expect(fields[0].name, 'titleOneOne');
      expect(fields[0].type, FieldType.titles);
      expect(fields[1].name, 'khatiraTextOneOne_1');
      expect(fields[1].type, FieldType.texts);
      expect(fields[2].name, 'ayahHadithOneTwo_1');
      expect(fields[2].type, FieldType.ayahs);
      expect(fields[3].name, 'footerOneOne');
      expect(fields[3].type, FieldType.footer);
    });

    test('extracts fields without static const String type annotation', () {
      final source = r'''
class TestDers {
  const titleOneOne = """Title""";
  const khatiraTextOneOne_1 = """Text""";
}
''';
      final fields = extractFields(source);
      expect(fields.length, 2);
      expect(fields[0].name, 'titleOneOne');
      expect(fields[1].name, 'khatiraTextOneOne_1');
    });

    test('skips commented-out field definitions', () {
      final source = r'''
class TestDers {
  static const String titleOneOne = """Title""";
  //static const String khatiraTextOneOne_1 = """Text""";
  static const String ayahHadithOneTwo_1 = """Ayah""";
}
''';
      final fields = extractFields(source);
      expect(fields.length, 2);
      expect(fields[0].name, 'titleOneOne');
      expect(fields[1].name, 'ayahHadithOneTwo_1');
    });

    test('handles field with FInal typo in type inference', () {
      final source = r'''
class TestDers {
  static const String textFInalPageOne_1 = """Text""";
  static const String ayahHadithFInalPageTwo_1 = """Ayah""";
}
''';
      final fields = extractFields(source);
      expect(fields.length, 2);
      expect(fields[0].type, FieldType.texts);
      expect(fields[1].type, FieldType.ayahs);
    });

    test('preserves raw field names with FInal typo', () {
      final source = r'''
class TestDers {
  static const String textFInalPageOne_1 = """Text""";
}
''';
      final fields = extractFields(source);
      expect(fields.length, 1);
      expect(fields[0].name, 'textFInalPageOne_1');
    });
  });

  group('groupByPage', () {
    test('groups fields into pages by delimiter offsets', () {
      final source = r'''
// page 1
static const String titleOneOne = """Title""";
// page 2
static const String khatiraTextTwoOne_1 = """Text""";
''';
      final fields = extractFields(source);
      final delimiters = parseDelimiters(source);
      final result = groupByPage(source, fields, delimiters);
      expect(result.pages.length, 2);
      expect(result.pages[0].length, 1);
      expect(result.pages[0][0].name, 'titleOneOne');
      expect(result.pages[1].length, 1);
      expect(result.pages[1][0].name, 'khatiraTextTwoOne_1');
    });

    test('handles worded page delimiters', () {
      final source = r'''
// page one
static const String titleOneOne = """Title""";
// page two
static const String khatiraTextTwoOne_1 = """Text""";
''';
      final fields = extractFields(source);
      final delimiters = parseDelimiters(source);
      final result = groupByPage(source, fields, delimiters);
      expect(result.pages.length, 2);
      expect(result.labels[0], '1');
      expect(result.labels[1], '2');
    });

    test('handles bare number delimiters before worded ones', () {
      final source = r'''
// 1
static const String titleOneOne = """Title""";
// 2
static const String khatiraTextTwoOne_1 = """Text""";
''';
      final fields = extractFields(source);
      final delimiters = parseDelimiters(source);
      final result = groupByPage(source, fields, delimiters);
      expect(result.pages.length, 2);
    });

    test('returns empty result for empty fields', () {
      final result = groupByPage('', [], []);
      expect(result.pages, isEmpty);
      expect(result.labels, isEmpty);
    });
  });

  group('generateElmList', () {
    test('generates valid output with correct structure', () {
      final fields = [
        ParsedField('titleOneOne', 'Title', FieldType.titles, 0),
        ParsedField('khatiraTextOneOne_1', 'Text', FieldType.texts, 1),
        ParsedField('ayahHadithOneTwo_1', 'Ayah', FieldType.ayahs, 2),
      ];
      final pages = [
        [fields[0], fields[1]],
        [fields[2]],
      ];
      final output = generateElmList(
        className: 'KhatiraTextDersOne',
        fileName: '1',
        rawName: 'one',
        pages: pages,
        delimiters: [],
        pageLabels: ['1', '2'],
        renameToKhatira: true,
      );

      expect(output, contains('khatiraList1NewOrder'));
      expect(output, contains('KhatiraModelNewOrder'));
      expect(output, contains('KhatiraTextDersOne'));
    });

    test('uses khatira prefix when renameToKhatira is true', () {
      final output = generateElmList(
        className: 'KhatiraTextDersPre',
        fileName: 'pre',
        rawName: 'pre',
        pages: [],
        delimiters: [],
        pageLabels: [],
        renameToKhatira: true,
      );
      expect(
          output,
          contains(
              "import 'package:khatir/core/data/model/khatira_model_new_order.dart'"));
      expect(
          output,
          contains(
              "import 'package:khatir/core/data/static/text/khatira_text_ders_pre.dart'"));
    });

    test('includes order array in output', () {
      final fields = [
        ParsedField('titleOneOne', 'Title', FieldType.titles, 0),
        ParsedField('khatiraTextOneOne_1', 'Text', FieldType.texts, 1),
      ];
      final pages = [
        [fields[0], fields[1]],
      ];
      final output = generateElmList(
        className: 'KhatiraTextDersOne',
        fileName: '1',
        rawName: 'one',
        pages: pages,
        delimiters: [],
        pageLabels: ['1'],
        renameToKhatira: true,
      );
      expect(output, contains('EnOrder.titles'));
      expect(output, contains('EnOrder.texts'));
    });

    test('handles empty pages gracefully', () {
      final output = generateElmList(
        className: 'KhatiraTextDersOne',
        fileName: '1',
        rawName: 'one',
        pages: [],
        delimiters: [],
        pageLabels: [],
        renameToKhatira: true,
      );
      expect(output, isNotEmpty);
      expect(output, contains('];'));
    });
  });
}
