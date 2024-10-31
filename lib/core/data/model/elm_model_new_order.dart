class ElmModelNewOrder {
  final List<String>? titles;
  final List<String>? subtitles;
  final List<String>? texts;
  final List<String>? ayahs;
  final String? footer;
  final String? order;

  ElmModelNewOrder({
    this.titles,
    this.subtitles,
    this.texts,
    this.ayahs,
    this.footer,
    required this.order,
  });
}
