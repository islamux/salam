import 'dart:convert';
import 'dart:io';
import 'generate_elm_lists.dart';

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
  final scratchDir = Directory.current.path;
  final textDir = Directory('$scratchDir/lib/features/khatira/data/static/text');

  if (!textDir.existsSync()) {
    stderr.writeln('Error: text directory not found. Run from project root.');
    exit(1);
  }

  final textFiles = textDir
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  // Group fields by chapter identifier
  final chapterFieldList = <String, List<_OrderedField>>{};

  for (final file in textFiles) {
    final filename = file.path.split('/').last;
    final nameMatch =
        RegExp(r'(?:elm|khatira)_text_ders_(.+)\.dart').firstMatch(filename);
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
  final Map<String, int> hashes = {};
  for (final entry in chapterFieldList.entries) {
    entry.value.sort((a, b) {
      final fileCmp = a.filename.compareTo(b.filename);
      if (fileCmp != 0) return fileCmp;
      return a.fieldName.compareTo(b.fieldName);
    });

    final combined = entry.value.map((f) => f.value).join('\x00');
    hashes[entry.key] = _fnv1a(combined);
  }

  // Ensure all 34 chapters are present
  final expected = [
    'pre', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
    '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
    '21', '22', '23', '24', '25', '26', '27', '28', '29', '30',
    '31', '32', 'final',
  ];

  for (final ch in expected) {
    if (!hashes.containsKey(ch)) {
      stderr.writeln('Warning: chapter "$ch" has no text files');
    }
  }

  // Sort output by chapter order
  final orderedHashes = <String, int>{};
  for (final ch in expected) {
    if (hashes.containsKey(ch)) {
      orderedHashes[ch] = hashes[ch]!;
    }
  }

  // Write golden file
  final goldenPath = '$scratchDir/test/goldens/content_hashes.json';
  final encoder = JsonEncoder.withIndent('  ');
  File(goldenPath).writeAsStringSync(encoder.convert(orderedHashes));
  stderr.writeln('Wrote golden hashes to $goldenPath');
  stderr.writeln('${orderedHashes.length} chapters computed.');
}

class _OrderedField {
  final String filename;
  final String fieldName;
  final String value;
  _OrderedField(this.filename, this.fieldName, this.value);
}
