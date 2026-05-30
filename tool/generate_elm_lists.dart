import 'dart:io';
import 'dart:collection';

// ============================================================
// Data Types
// ============================================================

enum FieldType { titles, subtitles, texts, ayahs, footer }

class ParsedField {
  final String name;
  final String value;
  final FieldType type;
  final int offset;
  ParsedField(this.name, this.value, this.type, this.offset);
}

// ============================================================
// Configuration
// ============================================================

const wordToNum = {
  'pre': 'pre',
  'final': 'final',
  'one': '1',
  'two': '2',
  'three': '3',
  'four': '4',
  'five': '5',
  'six': '6',
  'seven': '7',
  'eight': '8',
  'nine': '9',
  'ten': '10',
  'eleven': '11',
  'twelve': '12',
  'therteen': '13',
  'fourteen': '14',
  'fifteen': '15',
  'sixteen': '16',
  'seventeen': '17',
  'eighteen': '18',
  'nineteen': '19',
  'twenty': '20',
  'twenty_one': '21',
  'twenty_two': '22',
  'twenty_three': '23',
  'twenty_four': '24',
  'twenty_five': '25',
  'twenty_six': '26',
  'twenty_seven': '27',
  'twenty_eight': '28',
  'twenty_nine': '29',
  'thirty': '30',
  'thirty_one': '31',
  'thirty_two': '32',
};

const typoMap = {
  'elmTextsFiveFive_1': 'elmTextFiveFive_1',
  'elmTextsFiveFive_2': 'elmTextFiveFive_2',
  'elmtTextTwentyEight_1': 'elmTextTwentyEight_1',
  'elmTextTwenteThirteen_3': 'elmTextTwentyThirteen_3',
  'ayahHadithTwentyOne1': 'ayahHadithTwentyOne_1',
  'ayahHdithFInalPageTen_3': 'ayahHadithFinalPageTen_3',
  'elmTextSeven_1': 'elmTextTwoSeven_1',
  'elmTextSeven_2': 'elmTextTwoSeven_2',
};

const outputDir = 'lib/core/data/model/elm_lists';

// ============================================================
// Field Extraction
// ============================================================

final fieldRegex = RegExp(
  r'''(?:static\s+)?const\s+(?:String\s+)?(\w+)\s*=\s*"""\s*([\s\S]*?)\s*"""''',
);

FieldType inferFieldType(String name) {
  if (name.startsWith('title')) return FieldType.titles;
  if (name.startsWith('subtitle')) return FieldType.subtitles;
  // elm* text patterns
  if (name.startsWith('elmText') ||
      name.startsWith('elmTex') ||
      name.startsWith('elmtText') ||
      name.startsWith('elmtext') ||
      name.startsWith('text'))
    return FieldType.texts;
  // elm without Text suffix (elm{Ders}{Page}_N) — only if first letter after 'elm' is uppercase
  if (name.startsWith('elm') &&
      name.length > 3 &&
      name[3] == name[3].toUpperCase())
    return FieldType.texts;
  // ayah* patterns (including typos like ayaHadith, ayahaHadith)
  if (name.startsWith('ayahHadith') ||
      name.startsWith('ayahHdith') ||
      name.startsWith('ayaHadith') ||
      name.startsWith('ayahaHadith') ||
      name.startsWith('ayah') ||
      name.startsWith('aya'))
    return FieldType.ayahs;
  if (name.startsWith('footer')) return FieldType.footer;
  throw ArgumentError('Unknown field type: $name');
}

List<ParsedField> extractFields(String source) {
  final fields = <ParsedField>[];
  final matches = fieldRegex.allMatches(source);
  for (final m in matches) {
    final rawName = m.group(1)!;
    // Fix FInal → Final in field names for type inference
    final name = rawName.replaceAll('FInal', 'Final');
    final value = m.group(2)!;
    final type = inferFieldType(name);
    fields.add(ParsedField(rawName, value, type, m.start));
  }
  return fields;
}

// ============================================================
// Page Delimiter Parsing
// ============================================================

final pageDelimiter = RegExp(
  r'//\s*-*\s*[Pp]age\s+\d+|' // // page N, // ---- Page 1
  r'//\s*//\s*[Pp]age\s+\d+|' // // // page N
  r'//\s*-*\s*[Pp]age[-\s]*(?:One|one|Two|two|Three|three|Four|four|Five|five|'
  r'Six|six|Seven|seven|Eight|eight|Nine|nine|Ten|ten|Eleven|eleven|Twelve|twelve|'
  r'Therteen|therteen|Fourteen|fourteen|Fifteen|fifteen|Sixteen|sixteen|Seventeen|'
  r'seventeen|Eighteen|eighteen|Nineteen|nineteen|Twenty|twenty|TwoTen|twoTen)(?!\w)|' // // page one, // pageThree
  r'//\s*(?:Two|One|three|four|five|six|seven|eight|nine|ten|eleven|twelve|therteen|fourteen|fifteen|sixteen|seventeen|eighteen|nineteen|twenty|twoTen)\w*|' // // TwoOne, // twoTen
  r'//\s*//\s*\d+|' // // // 5
  r'//\s*\d+', // // 5 (bare number)
);

class PageDelimiter {
  final int offset;
  final String label;
  final bool isWorded; // true if has word prefix (page/Page/Two/etc.), false if bare number
  PageDelimiter(this.offset, this.label, {this.isWorded = false});
}

final wordNumberRegex = RegExp(
    r'(?:One|one|Two|two|Three|three|Four|four|Five|five|Six|six|Seven|seven|'
    r'Eight|eight|Nine|nine|Ten|ten|Eleven|eleven|Twelve|twelve|Therteen|therteen|'
    r'Fourteen|fourteen|Fifteen|fifteen|Sixteen|sixteen|Seventeen|seventeen|'
    r'Eighteen|eighteen|Nineteen|nineteen|Twenty|twenty|TwoTen|twoTen)');

String extractWordNumber(String word) {
  final lc = word.toLowerCase();
  // Try exact match first
  if (wordToNum.containsKey(lc)) return wordToNum[lc]!;
  // Try matching known word number tokens within the text
  final tokenMatch = wordNumberRegex.firstMatch(word);
  if (tokenMatch != null) {
    final token = tokenMatch.group(0)!;
    if (wordToNum.containsKey(token.toLowerCase())) {
      return wordToNum[token.toLowerCase()]!;
    }
  }
  return word;
}

String extractDelimiterLabel(String match) {
  match = match.replaceAll(RegExp(r'//\s*'), '');
  // Strip trailing "// From Xxx" suffixes
  match = match.split(RegExp(r'\s*//')).first.trim();

  // Strip page/Page prefix
  match = match.replaceFirst(RegExp(r'^-*\s*[Pp]age[-\s]*'), '');

  // Check if it's a section-based name (TwoOne, TwoTwo, twoTen, etc.)
  // These use capitalized word numbers for sub-sections
  final sectionMatch = RegExp(
          r'^(?:Two|One|three|four|five|six|seven|eight|nine|ten|eleven|twelve|therteen|fourteen|fifteen|sixteen|seventeen|eighteen|nineteen|twenty|twoTen)(.+)$',
          caseSensitive: false)
      .firstMatch(match);
  if (sectionMatch != null) {
    final numWord = sectionMatch.group(1)!;
    final result = extractWordNumber(numWord);
    if (result != numWord) return result;
    return match;
  }

  // Extract number
  final numMatch = RegExp(r'(\d+)').firstMatch(match);
  if (numMatch != null) return numMatch.group(1)!;

  // Try word number
  final result = extractWordNumber(match);
  if (result != match) return result;

  // Try to parse as standalone number
  if (match.trim().contains(RegExp(r'^\d+$'))) return match.trim();

  return match;
}

final wordedDelimiter = RegExp(
  r'//\s*-*\s*[Pp]age\s+\d+|' // // page N, // ---- Page N
  r'//\s*//\s*[Pp]age\s+\d+|' // // // page N
  r'//\s*-*\s*[Pp]age[-\s]*(?:One|one|Two|two|Three|three|Four|four|Five|five|'
  r'Six|six|Seven|seven|Eight|eight|Nine|nine|Ten|ten|Eleven|eleven|Twelve|twelve|'
  r'Therteen|therteen|Fourteen|fourteen|Fifteen|fifteen|Sixteen|sixteen|Seventeen|'
  r'seventeen|Eighteen|eighteen|Nineteen|nineteen|Twenty|twenty|TwoTen|twoTen)(?!\w)|' // // page one, // pageThree
  r'//\s*(?:Two|One|three|four|five|six|seven|eight|nine|ten|eleven|twelve|therteen|fourteen|fifteen|sixteen|seventeen|eighteen|nineteen|twenty|twoTen)\w*',
);

List<PageDelimiter> parseDelimiters(String source, {bool verbose = false}) {
  final delimiters = <PageDelimiter>[];
  var pos = 0;
  while (pos < source.length) {
    final m = pageDelimiter.firstMatch(source.substring(pos));
    if (m == null) break;
    final absOffset = pos + m.start;
    final matchText = m.group(0)!;
    final isWorded = wordedDelimiter.hasMatch(matchText);
    final label = extractDelimiterLabel(matchText);
    if (verbose) {
      stderr.writeln('  Delimiter at $absOffset: "$matchText" → "$label" (${isWorded ? 'worded' : 'bare'})');
    }
    delimiters.add(PageDelimiter(absOffset, label, isWorded: isWorded));
    pos += m.end;
  }

  // If any worded delimiters exist, filter out bare-number delimiters
  // that appear AFTER the first worded delimiter.
  // Bare numbers before the first worded delimiter are real page boundaries.
  // Bare numbers after the first worded delimiter are sub-references within a page.
  final firstWordedIdx = delimiters.indexWhere((d) => d.isWorded);
  if (firstWordedIdx >= 0) {
    // Remove bare delimiters AFTER the first worded one
    final before = delimiters.sublist(0, firstWordedIdx);
    final fromFirstWorded = delimiters.sublist(firstWordedIdx);
    final filtered = fromFirstWorded.where((d) => d.isWorded).toList();
    delimiters
      ..clear()
      ..addAll(before)
      ..addAll(filtered);
  }

  return delimiters;
}

// ============================================================
// Page Grouping
// ============================================================

class PageGroupResult {
  final List<List<ParsedField>> pages;
  final List<String> labels;
  PageGroupResult(this.pages, this.labels);
}

PageGroupResult groupByPage(
  String source,
  List<ParsedField> fields,
  List<PageDelimiter> delimiters,
) {
  if (fields.isEmpty) return PageGroupResult([], []);

  // Group fields by delimiter INDEX (0 = before first delimiter)
  // Then merge groups whose consecutive delimiters share the same LABEL
  final pageGroups = <int, List<ParsedField>>{};
  final pageLabels = <int, String>{};

  // Assign each field to its nearest preceding delimiter (by index)
  for (final field in fields) {
    var bestIdx = -1; // -1 = before any delimiter
    for (var i = 0; i < delimiters.length; i++) {
      if (delimiters[i].offset < field.offset) bestIdx = i;
    }
    pageGroups.putIfAbsent(bestIdx, () => []);
    pageGroups[bestIdx]!.add(field);
    if (bestIdx >= 0) {
      pageLabels[bestIdx] = delimiters[bestIdx].label;
    }
  }

  // Build final pages: process delimiter indices in order, merging
  // consecutive delimiters with the same label
  final result = <List<ParsedField>>[];
  final labels = <String>[];
  var mergeBuffer = <ParsedField>[];
  String? mergeLabel;

  // Handle fields before first delimiter (idx = -1)
  if (pageGroups.containsKey(-1)) {
    if (pageGroups[-1]!.isNotEmpty && delimiters.isNotEmpty) {
      result.add(pageGroups[-1]!);
      labels.add('1');
      pageGroups.remove(-1);
    } else if (delimiters.isEmpty) {
      result.add(pageGroups[-1]!);
      labels.add('1');
      pageGroups.remove(-1);
      return PageGroupResult(result, labels);
    } else {
      pageGroups.remove(-1);
    }
  }

  // Process delimiters in order, merging same-label groups
  for (var i = 0; i < delimiters.length; i++) {
    final label = delimiters[i].label;
    final fieldsHere = pageGroups[i] ?? [];

    if (mergeLabel == null) {
      mergeBuffer.addAll(fieldsHere);
      mergeLabel = label;
      labels.add(label);
    } else if (label == mergeLabel) {
      mergeBuffer.addAll(fieldsHere);
    } else {
      result.add(mergeBuffer);
      mergeBuffer = [...fieldsHere];
      mergeLabel = label;
      labels.add(label);
    }
  }

  // Flush last group
  if (mergeBuffer.isNotEmpty) {
    result.add(mergeBuffer);
  }

  return PageGroupResult(result, labels);
}

// ============================================================
// Field Order in Page (for order array)
// ============================================================

List<FieldType> buildFieldOrder(List<ParsedField> fields) {
  return fields.map((f) => f.type).toList();
}

// ============================================================
// Output Writer
// ============================================================

String _toPascal(String s) {
  if (s == 'final') return 'Final';
  final parts = s.split('_');
  return parts.map((p) => p[0].toUpperCase() + p.substring(1)).join();
}

String _fieldList(List<ParsedField> fieldsOfType) {
  return fieldsOfType.map((f) => 'ElmTextDers${_refix(f.name)}.${f.name}')
      .join(',\n      ');
}

String _refix(String name) {
  // Extract prefix class name from field name
  // e.g., titleOneOne → OneOne → DersOne → ElmTextDersOne
  // e.g., textFInalPageOne_1 → FInal → Fixed to Final → DersFinal
  // etc. Actually, fields are already normalized, the class name is
  // determined by the file, not the field.
  return ''; // placeholder — handled by per-page class context
}

String _pageComment(List<PageDelimiter> delimiters, int pageIndex,
    String? pageLabel) {
  if (pageLabel != null && pageLabel.isNotEmpty) {
    // Check if it's a section-based name
    if (RegExp(r'^(Two|One|two|three|four|five|six|seven|eight|nine|ten)')
        .hasMatch(pageLabel)) {
      return '  // $pageLabel';
    }
    return '  // $pageLabel';
  }
  return '  // ${pageIndex + 1}';
}

String generateElmList({
  required String className,
  required String fileName,
  required List<List<ParsedField>> pages,
  required List<PageDelimiter> delimiters,
  required List<String> pageLabels,
  bool renameToKhatira = false,
}) {
  final prefix = renameToKhatira ? 'khatira' : 'elm';
  final listName = fileName; // e.g., "pre", "1", "2", "final"

  final buf = StringBuffer();

  if (listName == 'pre') {
    buf.writeln('// TextDersPre');
  } else if (listName == 'final') {
    buf.writeln('// TextDersFinal');
  } else {
    buf.writeln('// TextDers$listName');
  }
  buf.writeln(
      "import 'package:khatir/core/data/model/${prefix}_model_new_order.dart';");
  buf.writeln(
      "import 'package:khatir/core/data/model/enum_order.dart';");
  buf.writeln(
      "import 'package:khatir/core/data/static/text/${prefix}_text_ders_$fileName.dart';");
  buf.writeln();

  final varName = '${prefix}List${_toPascal(listName)}NewOrder';
  buf.writeln('List<${_toPascal(prefix)}ModelNewOrder> $varName = [');

  for (var i = 0; i < pages.length; i++) {
    final pageFields = pages[i];
    if (pageFields.isEmpty) continue;

    // Use page label from groupByPage result
    final label = i < pageLabels.length ? pageLabels[i] : '${i + 1}';

    // Group fields by type (in order of first appearance)
    final seenTypes = <FieldType>{};
    final orderedTypes = <FieldType>[];
    for (final f in pageFields) {
      if (!seenTypes.contains(f.type)) {
        seenTypes.add(f.type);
        orderedTypes.add(f.type);
      }
    }

    // Build per-type field lists preserving original field order
    final typeFieldMap = <FieldType, List<ParsedField>>{};
    for (final f in pageFields) {
      typeFieldMap.putIfAbsent(f.type, () => []);
      typeFieldMap[f.type]!.add(f);
    }

    // Build order array
    final fieldOrder = buildFieldOrder(pageFields);

    // Write page comment
    if (RegExp(r'^(Two|One|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|therteen|fourteen|fifteen|sixteen|seventeen|eighteen|nineteen|twenty|twoTen)')
        .hasMatch(label)) {
      buf.writeln('  // $label');
    } else if (RegExp(r'^\d+$').hasMatch(label)) {
      buf.writeln('  // $label');
    } else {
      buf.writeln('  // ${i + 1}');
    }

    // Write ElmModelNewOrder
    if (orderedTypes.length == 1 && typeFieldMap[orderedTypes.first]!.length <= 3) {
      // Single-line format for simple pages
      final t = orderedTypes.first;
      final fields = typeFieldMap[t]!;
      final classRef = _classRef(className);
      buf.write('  ${_toPascal(prefix)}ModelNewOrder(');
      buf.write('${t.name}: [');
      buf.write(fields.map((f) => '$classRef.${f.name}').join(', '));
      buf.write('], order: [');
      for (final ft in fieldOrder) {
        buf.write('EnOrder.${ft.name}, ');
      }
      buf.writeln(']),');
    } else {
      buf.writeln('  ${_toPascal(prefix)}ModelNewOrder(');
      final classRef = _classRef(className);

      // Write type lists
      for (final t in orderedTypes) {
        final fields = typeFieldMap[t]!;
        buf.writeln('    ${t.name}: [');
        for (final f in fields) {
          buf.writeln('      $classRef.${f.name},');
        }
        buf.writeln('    ],');
      }

      // Write order array
      buf.writeln('    order: [');
      var groupIdx = 1;
      FieldType? prevType;
      for (final ft in fieldOrder) {
        if (prevType != null && ft != prevType) {
          // Different type from previous - add separator comment for groups
          if (fieldOrder.where((x) => x == ft).length > 1 ||
              fieldOrder.where((x) => x == prevType).length > 1) {
            // Only add group markers when there are interleaved fields
          }
        }
        buf.writeln('      EnOrder.${ft.name},');
        prevType = ft;
      }
      buf.writeln('    ],');
      buf.writeln('  ),');
    }
  }

  buf.writeln('];');
  return buf.toString();
}

String _classRef(String className) {
  // Normalize FInal → Final in class references
  return className.replaceAll('FInal', 'Final');
}

// ============================================================
// Source file processing
// ============================================================

class ParsedSource {
  final String className;
  final String fileName;
  final List<ParsedField> fields;
  final List<PageDelimiter> delimiters;
  final List<List<ParsedField>> pages;
  final List<String> pageLabels;
  ParsedSource({
    required this.className,
    required this.fileName,
    required this.fields,
    required this.delimiters,
    required this.pages,
    required this.pageLabels,
  });
}

ParsedSource? processFile(String filePath, {bool verbose = false}) {
  final source = File(filePath).readAsStringSync();
  final filename = filePath.split('/').last;
  // Extract class name
  final classMatch = RegExp(r'class\s+(\w+)\s*\{').firstMatch(source);
  if (classMatch == null) {
    stderr.writeln('  ERROR: No class found in $filename');
    return null;
  }
  final className = classMatch.group(1)!;

  // Extract file numeric name from filename
  // elm_text_ders_pre.dart → pre
  // elm_text_ders_one.dart → one → 1
  // elm_text_ders_final.dart → final
  final nameMatch = RegExp(r'elm_text_ders_(.+)\.dart').firstMatch(filename);
  if (nameMatch == null) {
    stderr.writeln('  ERROR: Cannot extract name from $filename');
    return null;
  }
  final rawName = nameMatch.group(1)!;
  final fileName = wordToNum[rawName] ?? rawName;

  if (verbose) {
    stderr.writeln('  Class: $className, Name: $rawName → $fileName');
  }

  // Extract fields
  final fields = extractFields(source);
  if (verbose) {
    stderr.writeln('  Fields: ${fields.length}');
    for (final f in fields) {
      stderr.writeln(
          '    ${f.name} (${f.type.name}): ${f.value.substring(0, (f.value.length > 40 ? 40 : f.value.length))}...');
    }
  }

  // Parse delimiters
  final delimiters = parseDelimiters(source, verbose: verbose);
  if (verbose) {
    stderr.writeln('  Delimiters: ${delimiters.length}');
  }

  // Group by page
  final pageGroupResult = groupByPage(source, fields, delimiters);
  final pages = pageGroupResult.pages;
  final pageLabels = pageGroupResult.labels;
  if (verbose) {
    stderr.writeln('  Pages: ${pages.length}');
    for (var i = 0; i < pages.length; i++) {
      stderr.writeln(
          '    Page ${i + 1} (${i < pageLabels.length ? pageLabels[i] : '?'}): ${pages[i].length} fields');
      for (final f in pages[i]) {
        stderr.writeln('      ${f.name} (${f.type.name})');
      }
    }
  }

  return ParsedSource(
    className: className,
    fileName: fileName,
    fields: fields,
    delimiters: delimiters,
    pages: pages,
    pageLabels: pageLabels,
  );
}

// ============================================================
// Main
// ============================================================

void main(List<String> args) {
  final scratchDir = Directory.current.path;

  // Find static text directory
  final textDir = Directory('$scratchDir/lib/core/data/static/text');
  if (!textDir.existsSync()) {
    stderr.writeln('Error: static text directory not found at $textDir');
    stderr.writeln('Run from project root (where lib/ is).');
    exit(1);
  }

  final textFiles = textDir
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  final dryRun = args.contains('--dry-run');
  final verbose = args.contains('--verbose');
  final renameToKhatira = args.contains('--rename-prefix') &&
      args[args.indexOf('--rename-prefix') + 1] == 'khatira';

  if (verbose) {
    stderr.writeln('Found ${textFiles.length} text files');
    stderr.writeln('Dry run: $dryRun');
    stderr.writeln('Rename to khatira: $renameToKhatira');
  }

  // Ensure output directory exists
  final outDir = Directory('$scratchDir/$outputDir');
  if (!dryRun) {
    outDir.createSync(recursive: true);
  }

  for (final file in textFiles) {
    final filename = file.path.split('/').last;
    stderr.writeln('Processing: $filename');

    final parsed = processFile(file.path, verbose: verbose);
    if (parsed == null) continue;

    final output = generateElmList(
      className: parsed.className,
      fileName: parsed.fileName,
      pages: parsed.pages,
      delimiters: parsed.delimiters,
      pageLabels: parsed.pageLabels,
      renameToKhatira: renameToKhatira,
    );

    final prefix = renameToKhatira ? 'khatira' : 'elm';
    final outputFilename =
        '${prefix}_list_${parsed.fileName}_new_order.dart';
    final outputPath = '$scratchDir/$outputDir/$outputFilename';

    if (dryRun) {
      print(
          '  Would write: $outputFilename (${parsed.pages.length} pages, ${parsed.fields.length} fields)');
      print('  --- Preview (first 300 chars) ---');
      print(output.substring(0, output.length > 300 ? 300 : output.length));
      print('  ---');
    } else {
      File(outputPath).writeAsStringSync(output);
      stderr.writeln(
          '  Wrote: $outputFilename (${parsed.pages.length} pages)');
    }
  }

  if (dryRun) {
    stderr.writeln('\nDry-run complete. ${textFiles.length} files processed.');
  } else {
    stderr.writeln(
        '\nDone. ${textFiles.length} files generated in $outputDir/');
  }
}
