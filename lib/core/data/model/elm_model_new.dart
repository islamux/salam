class ElmModelNew {
  // Content of every page
  // title
  final List<String>? titles;
  // subtitle
  final List<String>? subtitles;
  // text
  final List<String>? texts;
  // ayah
  final List<String>? ayahs;
  final String? footer;

  // Constructor (named to make allow rearange them like i want)
  ElmModelNew({
//    التحقق من أن الحقول ليست null قبل الاستخدام
    // بهذه الطريقة، إذا لم يتم تعيين أي قيم، ستكون الحقول عبارة عن قائمة فارغة، وبالتالي لن تتسبب في حدوث خطأ.
    this.titles = const [],
    this.subtitles = const [], // to make
    this.texts = const [],
    this.ayahs = const [],
    this.footer,
  });
}
