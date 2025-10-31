#!/usr/bin/env dart
/// Migration Script: Convert Elm Dart Files to JSON
///
/// This script converts all ElmList Dart files to a single JSON file
/// following the schema defined in lib/core/data/json/schemas/elm_data_schema.json
///
/// Usage:
///   dart run scripts/convert_to_json.dart
///
/// Output:
///   lib/core/data/json/data/elm_all_data.json

import 'dart:io';
import 'dart:convert';
import 'dart:mirrors';

void main() async {
  print('=== Elm Data Migration: Dart to JSON ===\n');

  try {
    // Step 1: Find all Elm list files
    print('Step 1: Finding Elm list files...');
    final listFiles = await findElmListFiles();
    print('Found ${listFiles.length} list files\n');

    // Step 2: Extract data from each file
    print('Step 2: Extracting data from Dart files...');
    final Map<String, List<Map<String, dynamic>>> allLists = {};
    int totalItems = 0;

    for (final file in listFiles) {
      print('  Processing: ${file.path}');
      final listNumber = extractListNumber(file.path);
      final items = await extractElmItems(file);
      allLists[listNumber] = items;
      totalItems += items.length;
      print('    ✓ Extracted ${items.length} items\n');
    }

    // Step 3: Generate JSON structure
    print('Step 3: Generating JSON structure...');
    final jsonData = <String, dynamic>{
      'version': '1.0.0',
      'generated': DateTime.now().toUtc().toIso8601String(),
      'totalLists': allLists.length,
      'lists': allLists,
    };

    // Step 4: Write to file
    print('Step 4: Writing JSON file...');
    final outputDir = Directory('lib/core/data/json/data');
    await outputDir.create(recursive: true);

    final outputFile = File('${outputDir.path}/elm_all_data.json');
    final encoder = JsonEncoder.withIndent('  ');
    await outputFile.writeAsString(encoder.convert(jsonData));

    print('\n=== Migration Complete ===');
    print('Output: ${outputFile.path}');
    print('Total Lists: ${allLists.length}');
    print('Total Items: $totalItems');
    print('File Size: ${(outputFile.lengthSync() / 1024).toStringAsFixed(2)} KB');

    // Validation
    print('\n=== Validation ===');
    await validateJsonFile(outputFile.path);

  } catch (e, stackTrace) {
    print('\n❌ ERROR: $e');
    print('\nStack Trace:');
    print(stackTrace);
    exit(1);
  }
}

/// Find all Elm list Dart files
Future<List<File>> findElmListFiles() async {
  final dir = Directory('lib/core/data/model/elm_lists');
  if (!await dir.exists()) {
    throw Exception('Elm lists directory not found: ${dir.path}');
  }

  final files = await dir
      .list()
      .where((entity) => entity is File)
      .cast<File>()
      .where((file) => file.path.endsWith('_new_order.dart'))
      .toList();

  // Sort files by list number
  files.sort((a, b) => a.path.compareTo(b.path));

  return files;
}

/// Extract list number from file path
String extractListNumber(String filePath) {
  // Examples:
  // elm_list_1_new_order.dart -> "1"
  // elm_list_pre_new_order.dart -> "pre"
  // elm_list_final_new_order.dart -> "final"

  final basename = filePath.split('/').last;
  final match = RegExp(r'elm_list_(\w+)_new_order.dart').firstMatch(basename);

  if (match == null) {
    throw Exception('Invalid file name format: $filePath');
  }

  return match.group(1)!;
}

/// Extract ElmModelNewOrder items from a Dart file
Future<List<Map<String, dynamic>>> extractElmItems(File file) async {
  final content = await file.readAsString();

  // Find all ElmModelNewOrder instances
  // Use counting to handle nested parentheses properly
  final RegExp itemRegex = RegExp(
    r'ElmModelNewOrder\(',
    multiLine: true,
  );

  final items = <Map<String, dynamic>>[];
  int searchStart = 0;

  while (searchStart < content.length) {
    // Find next match starting from searchStart
    final match = itemRegex.firstMatch(content.substring(searchStart));
    if (match == null) break;

    final absoluteMatchStart = searchStart + match.start;
    final openingParenIndex = absoluteMatchStart + match.group(0)!.length - 1; // Position of '('

    // Count parentheses to find the matching closing ')'
    int depth = 1;
    int endIndex = openingParenIndex + 1;

    while (endIndex < content.length && depth > 0) {
      final char = content[endIndex];
      if (char == '(') {
        depth++;
      } else if (char == ')') {
        depth--;
      }
      endIndex++;
    }

    if (depth == 0) {
      // Extract content between the outermost parentheses
      final itemContent = content.substring(openingParenIndex + 1, endIndex - 1);
      final item = parseElmItem(itemContent, file.path);
      items.add(item);

      // Continue searching after the closing ')'
      searchStart = endIndex;
    } else {
      // Unmatched parentheses, skip this match
      searchStart = absoluteMatchStart + 1;
    }
  }

  return items;
}

/// Parse a single ElmModelNewOrder instance
Map<String, dynamic> parseElmItem(String itemContent, String filePath) {
  final item = <String, dynamic>{};

  // Extract titles
  final titles = extractStringList(itemContent, 'titles:');
  if (titles.isNotEmpty) {
    item['titles'] = titles;
  }

  // Extract subtitles
  final subtitles = extractStringList(itemContent, 'subtitles:');
  if (subtitles.isNotEmpty) {
    item['subtitles'] = subtitles;
  }

  // Extract texts
  final texts = extractStringList(itemContent, 'texts:');
  if (texts.isNotEmpty) {
    item['texts'] = texts;
  }

  // Extract ayahs
  final ayahs = extractStringList(itemContent, 'ayahs:');
  if (ayahs.isNotEmpty) {
    item['ayahs'] = ayahs;
  }

  // Extract footer
  final footer = extractStringValue(itemContent, 'footer:');
  if (footer != null && footer.isNotEmpty) {
    item['footer'] = footer;
  }

  // Extract order (required)
  final order = extractOrderList(itemContent, filePath);
  item['order'] = order;

  return item;
}

/// Extract a list of strings from item content
List<String> extractStringList(String content, String fieldName) {
  final List<String> values = [];

  // Build regex with PROPER string interpolation
  final fieldPattern = RegExp.escape(fieldName);
  final pattern = r'(' + fieldPattern + r')\s*(?:<[^>]+>)?\s*\[([\s\S]*?)\]';
  final fieldRegex = RegExp(pattern);

  final match = fieldRegex.firstMatch(content);
  if (match == null) {
    return values;
  }

  final arrayContent = match.group(2)!;

  // Extract all ElmText references (e.g., ElmTextDersOne.titleOneOne)
  final elmTextRegex = RegExp(r'(ElmText\w*\.\w+)');
  for (final match in elmTextRegex.allMatches(arrayContent)) {
    final identifier = match.group(1)!;
    // Convert to placeholder format {{ClassName_fieldName}}
    values.add('{{${identifier.replaceAll('.', '_')}}}');
  }

  return values;
}

/// Extract a single string value from item content
String? extractStringValue(String content, String fieldName) {
  final fieldPattern = RegExp.escape(fieldName);
  final valueRegex = RegExp(
    r'$fieldPattern\s+([^,\n\]]+)(?:,|\n|$)',
  );

  final match = valueRegex.firstMatch(content);
  if (match == null) return null;

  var value = match.group(1)!.trim();

  // Remove quotes if present
  if ((value.startsWith("'") && value.endsWith("'")) ||
      (value.startsWith('"') && value.endsWith('"'))) {
    value = value.substring(1, value.length - 1);
  }

  // Check if it's a reference to ElmText class
  if (value.contains('ElmText') || value.contains('.')) {
    // Placeholder for reference resolution
    return '{{${value.replaceAll('.', '_')}}}';
  }

  return value;
}

/// Extract order array from item content
List<String> extractOrderList(String content, String filePath) {
  final List<String> order = [];

  // More flexible regex - make ending optional since content might end with ]
  final orderRegex = RegExp(
    r'order:\s*(?:<[^>]+>)?\s*\[[\s\S]*?\](?:\s*(?:,|\)|\]|\n)|$)',
  );

  final match = orderRegex.firstMatch(content);
  if (match == null) {
    // Show more context for debugging
    print('    Content sample: ${content.substring(0, content.length > 500 ? 500 : content.length)}');
    throw Exception('Missing or invalid order field in file: $filePath');
  }

  final orderContent = match.group(0)!;

  // Extract enum values - handle line breaks in enum names
  final enumRegex = RegExp(r'EnOrder\s*\.\s*(\w+)');
  for (final enumMatch in enumRegex.allMatches(orderContent)) {
    final enumValue = enumMatch.group(1)!.toLowerCase();
    order.add(enumValue);
  }

  if (order.isEmpty) {
    throw Exception('Empty order array in file: $filePath');
  }

  return order;
}

/// Validate generated JSON file
Future<void> validateJsonFile(String filePath) async {
  print('Validating JSON file...');

  // Read file
  final content = await File(filePath).readAsString();

  // Parse JSON
  try {
    final json = jsonDecode(content) as Map<String, dynamic>;
    print('  ✓ Valid JSON syntax');

    // Validate structure
    if (!json.containsKey('version')) {
      throw Exception('Missing required field: version');
    }
    print('  ✓ Has version field');

    if (!json.containsKey('generated')) {
      throw Exception('Missing required field: generated');
    }
    print('  ✓ Has generated field');

    if (!json.containsKey('totalLists')) {
      throw Exception('Missing required field: totalLists');
    }
    print('  ✓ Has totalLists field');

    if (!json.containsKey('lists')) {
      throw Exception('Missing required field: lists');
    }
    print('  ✓ Has lists field');

    final lists = json['lists'] as Map<String, dynamic>;
    print('  ✓ Lists count: ${lists.length}');

    // Validate each list
    for (final entry in lists.entries) {
      final listNumber = entry.key;
      final items = entry.value as List;

      if (items.isEmpty) {
        print('  ⚠ Warning: List $listNumber is empty');
      }

      for (int i = 0; i < items.length; i++) {
        final item = items[i] as Map<String, dynamic>;
        if (!item.containsKey('order')) {
          throw Exception('List $listNumber, item $i: Missing order field');
        }
      }
    }

    print('\n✅ All validations passed!');

  } catch (e) {
    print('\n❌ Validation failed: $e');
    rethrow;
  }
}
