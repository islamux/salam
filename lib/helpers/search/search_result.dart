class SearchResult {
  final String listName;
  final int pageIndex;
  final String matchedText;
  final String routeName;
  final String fieldName;

  SearchResult({
    required this.listName,
    required this.pageIndex,
    required this.matchedText,
    required this.routeName,
    required this.fieldName,
  });

  String get displayTitle => 'صفحة $pageIndex - $listName';
}
