class ElmModel {
  // Content of every page
  // title
  final String? title;
  // subtitle
  final List<String>? subtitles;
  // text
  final List<String>? texts;
  // ayah
  final List<String>? ayahs;
  final String? footer;

  // Constructor (named to make allow rearange them like i want)
  ElmModel({
    this.title,
    this.subtitles,
    this.texts,
    this.ayahs,
    this.footer,
  });
}
