String removeSearchDiacritics(String? text) {
  if (text == null) return '';
  return text.replaceAll(RegExp(r'[^\u0621-\u064A\s]'), '');
}
