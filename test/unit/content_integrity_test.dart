import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import '../../tool/generate_elm_lists.dart';

int _fnv1a(String s) {
  const prime = 0x01000193;
  int hash = 0x811c9dc5;
  for (var i = 0; i < s.length; i++) {
    hash ^= s.codeUnitAt(i);
    hash = (hash * prime) & 0xFFFFFFFF;
  }
  return hash;
}

void main() {
  group('Content integrity', () {
    test('all chapter text content matches golden hashes', () {
      final textDir =
          Directory('lib/features/khatira/data/static/text');
      expect(textDir.existsSync(), isTrue,
          reason: 'Text directory must exist');

      final textFiles = textDir
          .listSync()
          .whereType<File>()
          .where((f) => f.path.endsWith('.dart'))
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path));

      expect(textFiles.length, greaterThanOrEqualTo(34),
          reason: 'Expected at least 34 text source files');

      final chapterFieldList = <String, List<_OrderedField>>{};

      for (final file in textFiles) {
        final filename = file.path.split('/').last;
        final nameMatch = RegExp(r'(?:elm|khatira)_text_ders_(.+)\.dart')
            .firstMatch(filename);
        if (nameMatch == null) continue;

        final rawName = nameMatch.group(1)!;
        final chapterId = wordToNum[rawName] ?? rawName;

        final source = file.readAsStringSync();
        final fields = extractFields(source);

        chapterFieldList.putIfAbsent(chapterId, () => []);
        for (final f in fields) {
          chapterFieldList[chapterId]!
              .add(_OrderedField(filename, f.name, f.value));
        }
      }

      // Sort fields deterministically per chapter
      final Map<String, int> actualHashes = {};
      for (final entry in chapterFieldList.entries) {
        entry.value.sort((a, b) {
          final fileCmp = a.filename.compareTo(b.filename);
          if (fileCmp != 0) return fileCmp;
          return a.fieldName.compareTo(b.fieldName);
        });

        final combined = entry.value.map((f) => f.value).join('\x00');
        actualHashes[entry.key] = _fnv1a(combined);
      }

      // Load golden hashes
      final goldenFile = File('test/goldens/content_hashes.json');
      expect(goldenFile.existsSync(), isTrue,
          reason: 'Golden hashes file must exist');

      final goldenJson = goldenFile.readAsStringSync();
      final goldenMap =
          (json.decode(goldenJson) as Map<String, dynamic>).map(
        (k, v) => MapEntry(k, (v as num).toInt()),
      );

      // Compare every chapter
      expect(actualHashes.length, goldenMap.length,
          reason:
              'Chapter count mismatch: ${actualHashes.length} actual vs ${goldenMap.length} golden');

      for (final entry in goldenMap.entries) {
        final chapterId = entry.key;
        final goldenHash = entry.value;
        final actualHash = actualHashes[chapterId];

        expect(actualHash, isNotNull,
            reason: 'Chapter "$chapterId" missing from text files');

        expect(
          actualHash,
          goldenHash,
          reason:
              'Chapter "$chapterId" text content has changed!\n'
              '  If this was intentional, run: dart run tool/compute_content_hashes.dart\n'
              '  Then commit the updated test/goldens/content_hashes.json',
        );
      }

      // Check for unexpected chapters (extra files)
      for (final entry in actualHashes.entries) {
        expect(goldenMap.containsKey(entry.key), isTrue,
            reason:
                'Unexpected chapter "${entry.key}" found in text files (not in golden)');
      }
    });
  });
}

class _OrderedField {
  final String filename;
  final String fieldName;
  final String value;
  _OrderedField(this.filename, this.fieldName, this.value);
}
