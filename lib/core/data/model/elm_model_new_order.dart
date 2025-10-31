import 'dart:convert';
import 'package:elm/core/data/model/enum_order.dart';

/// ElmModelNewOrder represents a single content item in the Elm application.
///
/// This class contains all content fields (titles, texts, ayahs, etc.) and
/// an order array that defines the rendering sequence for UI display.
class ElmModelNewOrder {
  /// Optional list of title strings for this content item
  final List<String>? titles;

  /// Optional list of subtitle strings for this content item
  final List<String>? subtitles;

  /// Optional list of main text content for this content item
  final List<String>? texts;

  /// Optional list of Quranic verses or hadith for this content item
  final List<String>? ayahs;

  /// Optional footer text for this content item
  final String? footer;

  /// Required list defining the rendering sequence of content elements
  /// Each element must be one of: titles, subtitles, texts, ayahs, footer
  final List<EnOrder> order;

  ElmModelNewOrder({
    this.titles,
    this.subtitles,
    this.texts,
    this.ayahs,
    this.footer,
    required this.order,
  });

  /// Creates an ElmModelNewOrder from a JSON map
  ///
  /// This factory constructor parses JSON data and converts it to an ElmModelNewOrder instance.
  /// The JSON format follows the schema defined in elm_data_schema.json.
  ///
  /// Example JSON:
  /// ```json
  /// {
  ///   "titles": ["Title"],
  ///   "texts": ["Text 1", "Text 2"],
  ///   "ayahs": ["Quran verse"],
  ///   "order": ["titles", "texts", "ayahs"]
  /// }
  /// ```
  factory ElmModelNewOrder.fromJson(Map<String, dynamic> json) {
    return ElmModelNewOrder(
      titles: (json['titles'] as List?)?.cast<String>(),
      subtitles: (json['subtitles'] as List?)?.cast<String>(),
      texts: (json['texts'] as List?)?.cast<String>(),
      ayahs: (json['ayahs'] as List?)?.cast<String>(),
      footer: json['footer'] as String?,
      order: (json['order'] as List<dynamic>)
          .map((e) => EnOrder.values.firstWhere(
                (element) => element.toString().split('.').last == e,
                orElse: () => throw FormatException(
                  'Invalid EnOrder value: $e. Valid values are: titles, subtitles, texts, ayahs, footer',
                ),
              ))
          .toList(),
    );
  }

  /// Converts this ElmModelNewOrder to a JSON map
  ///
  /// Returns a JSON-encodable Map<String, dynamic> that can be serialized
  /// using json.encode() or Dart's JSON serialization tools.
  ///
  /// Example output:
  /// ```json
  /// {
  ///   "titles": ["Title"],
  ///   "texts": ["Text 1", "Text 2"],
  ///   "ayahs": ["Quran verse"],
  ///   "order": ["titles", "texts", "ayahs"]
  /// }
  /// ```
  Map<String, dynamic> toJson() {
    return {
      if (titles != null) 'titles': titles,
      if (subtitles != null) 'subtitles': subtitles,
      if (texts != null) 'texts': texts,
      if (ayahs != null) 'ayahs': ayahs,
      if (footer != null) 'footer': footer,
      'order': order.map((e) => e.toString().split('.').last).toList(),
    };
  }

  /// Creates a copy of this ElmModelNewOrder with optional field overrides
  ///
  /// Useful for creating modified versions of existing items without
  /// manually setting all fields.
  ///
  /// Example:
  /// ```dart
  /// final modifiedItem = originalItem.copyWith(
  ///   footer: "New footer",
  ///   titles: ["Modified title"],
  /// );
  /// ```
  ElmModelNewOrder copyWith({
    List<String>? titles,
    List<String>? subtitles,
    List<String>? texts,
    List<String>? ayahs,
    String? footer,
    List<EnOrder>? order,
  }) {
    return ElmModelNewOrder(
      titles: titles ?? this.titles,
      subtitles: subtitles ?? this.subtitles,
      texts: texts ?? this.texts,
      ayahs: ayahs ?? this.ayahs,
      footer: footer ?? this.footer,
      order: order ?? this.order,
    );
  }

  @override
  String toString() {
    return 'ElmModelNewOrder(titles: $titles, subtitles: $subtitles, texts: $texts, ayahs: $ayahs, footer: $footer, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ElmModelNewOrder &&
        other.titles == titles &&
        other.subtitles == subtitles &&
        other.texts == texts &&
        other.ayahs == ayahs &&
        other.footer == footer &&
        other.order == order;
  }

  @override
  int get hashCode {
    return Object.hash(titles, subtitles, texts, ayahs, footer, order);
  }
}

/// Extension on ElmModelNewOrder for convenient JSON operations
extension ElmModelNewOrderJson on ElmModelNewOrder {
  /// Serializes this object to a JSON string
  ///
  /// Equivalent to: json.encode(toJson())
  String toJsonString() => json.encode(toJson());
}

/// Helper functions for ElmModelNewOrder JSON operations
class ElmModelNewOrderHelpers {
  /// Creates an ElmModelNewOrder from a JSON string
  ///
  /// Equivalent to: ElmModelNewOrder.fromJson(json.decode(jsonString))
  static ElmModelNewOrder fromJsonString(String jsonString) {
    return ElmModelNewOrder.fromJson(json.decode(jsonString));
  }
}
