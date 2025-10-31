# Schema Design Document

**Generated**: 2025-10-31
**Status**: ✅ Phase 2 Complete

---

## Overview

This document describes the JSON schema design for the Elm application migration from Dart class files to JSON format.

---

## Design Decisions

### 1. Combined JSON File Approach ✅ CHOSEN

**Decision**: Single JSON file containing all 29 Elm lists

**Rationale**:
- ✅ Simplifies data loading (one file to load)
- ✅ Easier content management (single source of truth)
- ✅ Better search performance (one file to query)
- ✅ Simplifies migration script
- ✅ Single source for versioning and metadata

**Alternative Considered**: Per-list JSON files
- ❌ Would require 29 separate file loads
- ❌ Complex to manage
- ❌ Harder to search across content

---

### 2. Schema Structure

#### Top-Level Structure

```json
{
  "version": "1.0.0",
  "generated": "2025-10-31T08:27:00Z",
  "totalLists": 29,
  "lists": {
    "1": [...],
    "2": [...],
    ...
    "27": [...],
    "pre": [...],
    "final": [...]
  }
}
```

**Design Rationale**:
- `version`: Track schema/data version for compatibility
- `generated`: Track when data was created/modified
- `totalLists`: Validation and documentation
- `lists`: Object with list IDs as keys (flexible, supports pre/final)

---

### 3. Field Design

#### ElmItem Structure

Each item contains:
- **titles** (optional, array of strings)
- **subtitles** (optional, array of strings)
- **texts** (optional, array of strings)
- **ayahs** (optional, array of strings)
- **footer** (optional, string or null)
- **order** (required, array of enums)

**Field Rules**:
- `order` is **required** - must be present for all items
- Optional fields use `null` or omit the key
- Arrays can be empty `[]` or omitted
- All strings must have minimum length of 1

**Why This Design**:
1. **Backward Compatible**: Matches existing ElmModelNewOrder structure
2. **Flexible**: Supports all current content patterns
3. **Extensible**: Easy to add new fields if needed
4. **Validated**: JSON schema enforces structure

---

### 4. Order Field Design

**Format**: Array of strings
```json
"order": ["titles", "texts", "texts", "ayahs", "footer"]
```

**Allowed Values**:
- `"titles"`
- `"subtitles"`
- `"texts"`
- `"ayahs"`
- `"footer"`

**Design Decisions**:
- Stored as strings (not enum values) for JSON compatibility
- Duplicates allowed (e.g., multiple "texts" in sequence)
- Maps to `EnOrder` enum in Dart code
- Order array can be longer than available fields

---

### 5. File Organization

#### Directory Structure

```
lib/core/data/json/
├── schemas/
│   └── elm_data_schema.json      ✅ JSON Schema validation
├── data/
│   └── elm_all_data.json         ⏳ Generated JSON file
└── service/
    └── json_data_service.dart    ⏳ Data loading service
```

**Rationale**:
- `schemas/`: Schema definitions for validation
- `data/`: Actual JSON data files
- `service/`: Loading and caching logic

---

### 6. Naming Conventions

#### JSON File Names

```
elm_all_data.json
```
- Lowercase with underscores
- Descriptive: `elm` + `all` + `data`
- Single file for entire application

#### List Keys

```json
{
  "lists": {
    "1": [...],      // elm_list_1_new_order.dart
    "2": [...],      // elm_list_2_new_order.dart
    ...
    "pre": [...],    // elm_list_pre_new_order.dart
    "final": [...]   // elm_list_final_new_order.dart
  }
}
```

**Format**:
- Numeric strings for numbered lists (1-27)
- "pre" for preparation page
- "final" for final page
- **No prefix/suffix** (keep it simple)

---

### 7. Metadata Structure

#### Versioning

```json
{
  "version": "1.0.0",
  "generated": "2025-10-31T08:27:00Z"
}
```

**Version Format**: Semantic versioning (MAJOR.MINOR.PATCH)
- **MAJOR**: Schema breaking changes
- **MINOR**: New features, new lists
- **PATCH**: Content updates, bug fixes

**Version History**:
- `1.0.0`: Initial JSON migration (Dart files → JSON)

#### Generation Timestamp

**Format**: ISO 8601 with UTC timezone
```
"generated": "2025-10-31T08:27:00Z"
```

**Why UTC**: Consistent across timezones, no ambiguity

**Usage**:
- Track when data was last updated
- Display in debug mode
- Help with cache invalidation

---

### 8. Error Handling Design

#### Invalid EnOrder Values

**Error**: If JSON contains invalid order value

```dart
order: (json['order'] as List<dynamic>)
    .map((e) => EnOrder.values.firstWhere(
          (element) => element.toString().split('.').last == e,
          orElse: () => throw FormatException(
            'Invalid EnOrder value: $e. Valid values are: titles, subtitles, texts, ayahs, footer',
          ),
        ))
    .toList()
```

**Error Message Format**:
```
Invalid EnOrder value: <value>. Valid values are: titles, subtitles, texts, ayahs, footer
```

**Recovery**: Application should handle FormatException gracefully

#### Missing Required Fields

**Validation**: JSON Schema enforces required fields
- If `order` is missing → Schema validation fails
- If top-level fields missing → Validation fails

---

### 9. Schema Validation

#### JSON Schema Features Used

- `$schema`: Draft 07 specification
- `$id`: Unique schema identifier
- `type`: Type validation (object, array, string, etc.)
- `properties`: Field validation
- `required`: Mandatory fields
- `enum`: Allowed values (for order field)
- `minItems`: Minimum array length
- `patternProperties`: Flexible list indexing
- `examples`: Documentation

#### Validation Points

1. **Top Level**: All required fields present
2. **List Keys**: Valid list numbers (1-27, pre, final)
3. **ElmItem Fields**: Correct types and constraints
4. **Order Values**: Only allowed enum values
5. **String Length**: No empty strings

---

### 10. Example JSON

#### Complete Example

```json
{
  "version": "1.0.0",
  "generated": "2025-10-31T08:27:00Z",
  "totalLists": 29,
  "lists": {
    "1": [
      {
        "titles": ["بسم الله الرحمن الرحيم"],
        "texts": [
          "هذا نص باللغة العربية يحتوي على معاني عميقة.",
          "النص الثاني يحتوي على معلومات إضافية."
        ],
        "order": ["titles", "texts", "texts"]
      },
      {
        "ayahs": ["وَقُل رَّبِّ زِدْنِي عِلْمًا"],
        "texts": ["نص مرفق بالآية"],
        "order": ["ayahs", "texts"]
      }
    ],
    "pre": [...],
    "final": [...]
  }
}
```

---

### 11. Migration Considerations

#### Backward Compatibility

**Current Code**:
```dart
import '.../elm_list_1_new_order.dart';
final data = elmList1NewOrder;
```

**Migration Strategy**:
1. Keep existing imports during transition
2. Populate variables from JSON in background
3. Gradually switch to JSON-only approach
4. Remove old Dart files after validation

#### Data Consistency

**Validation Steps**:
1. Verify JSON schema is valid
2. Verify all 29 lists are present
3. Verify each list has at least 1 item
4. Verify all order arrays are valid
5. Verify text encoding (UTF-8 for Arabic)

---

### 12. Future Extensibility

#### Adding New Fields

**Current Fields**:
- titles
- subtitles
- texts
- ayahs
- footer

**Future Possibilities**:
- `references`: Additional references
- `category`: Content categorization
- `tags`: Searchable tags
- `difficulty`: Complexity level
- `source`: Source attribution

**Migration Path**:
- Version bump to indicate new schema
- Old code ignores unknown fields
- New code handles new fields

#### Multi-language Support

**Future Structure**:
```json
{
  "1": {
    "ar": [{...}],
    "en": [{...}],
    "fr": [{...}]
  }
}
```

**Current Status**: Not implemented, but schema allows for extension

---

## Implementation Checklist

- [x] ✅ JSON Schema created and validated
- [x] ✅ ElmModelNewOrder updated with JSON methods
- [x] ✅ File organization defined
- [x] ✅ Naming conventions established
- [x] ✅ Metadata structure planned
- [x] ✅ Error handling designed
- [x] ✅ Versioning strategy defined

**Status**: Schema design complete, ready for Phase 3

---

## Files Created

1. `lib/core/data/json/schemas/elm_data_schema.json` - JSON Schema validation
2. `lib/core/data/model/elm_model_new_order.dart` - Updated with JSON support
3. `docs/json-migration/schema-design.md` - This document

---

**Phase 2 Complete** ✅

**Next**: Phase 3 - Migration Script Development
