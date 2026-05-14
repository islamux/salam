import 'package:khatir/core/data/model/enum_order.dart';

class ElmModelNewOrder {
  final List<String>? titles;
  final List<String>? subtitles;
  final List<String>? texts;
  final List<String>? ayahs;
  final String? footer;
  final List<EnOrder> order;

  ElmModelNewOrder({
    this.titles,
    this.subtitles,
    this.texts,
    this.ayahs,
    this.footer,
    required this.order,
  });

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
