import 'package:khatir/core/data/model/enum_order.dart';

class KhatiraModelOrder {
  final List<String>? titles;
  final List<String>? subtitles;
  final List<String>? texts;
  final List<String>? ayahs;
  final String? footer;
  final List<EnOrder> order;

  KhatiraModelOrder({
    this.titles,
    this.subtitles,
    this.texts,
    this.ayahs,
    this.footer,
    required this.order,
  });

  KhatiraModelOrder copyWith({
    List<String>? titles,
    List<String>? subtitles,
    List<String>? texts,
    List<String>? ayahs,
    String? footer,
    List<EnOrder>? order,
  }) {
    return KhatiraModelOrder(
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
    return 'KhatiraModelOrder(titles: $titles, subtitles: $subtitles, texts: $texts, ayahs: $ayahs, footer: $footer, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is KhatiraModelOrder &&
        _listEquals(other.titles, titles) &&
        _listEquals(other.subtitles, subtitles) &&
        _listEquals(other.texts, texts) &&
        _listEquals(other.ayahs, ayahs) &&
        other.footer == footer &&
        _listEquals(other.order, order);
  }

  @override
  int get hashCode {
    return Object.hash(
      Object.hashAll(titles ?? const []),
      Object.hashAll(subtitles ?? const []),
      Object.hashAll(texts ?? const []),
      Object.hashAll(ayahs ?? const []),
      footer,
      Object.hashAll(order),
    );
  }

  static bool _listEquals<T>(List<T>? a, List<T>? b) {
    if (a == null && b == null) return true;
    if (a == null || b == null) return false;
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
