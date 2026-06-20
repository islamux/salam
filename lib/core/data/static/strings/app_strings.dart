/// Centralized Arabic UI strings for the app.
///
/// All Arabic text displayed in the UI should be referenced from here
/// to enable future localization. When adding a locale, create
/// `app_strings_ar.dart` (default) and `app_strings_en.dart`, etc.,
/// then swap via a locale resolver.
class AppStrings {
  AppStrings._();

  // =========================================================================
  // Page / AppBar Titles
  // =========================================================================
  static String khatiraTitle(int number) => "الخاطرة $number";
  static const String preTitle = "  المقدمة  ";
  static const String finalTitle = "الخاتمة";

  // =========================================================================
  // Home Screen
  // =========================================================================
  static const String homeAppBarTitle = " خواطر إيمانية";
  static const String homeShareButton = "شارك";
  static const String homeScrollHint = "إسحب للأعلى للمزيد";

  // =========================================================================
  // Search
  // =========================================================================
  static const String searchHint = "ابحث هنا...";
  static const String searchNoResults = "لا توجد نتائج مطابقة.";
  static const String searchEnterQuery = "يرجى إدخال استعلام للبحث.";
  static const String searchFieldLabel = "ابحث";
  static const String searchPrompt = "ابحث عن المحتوى المطلوب";
  static const String searchNoResultsFound = "لم يتم العثور على نتائج";
  static const String resultDetail = 'تفاصيل النتيجة';
  static const String selectedResult = 'النتيجة المختارة';

  // Search – field names
  static const String fieldTitle = 'العنوان';
  static const String fieldSubtitle = 'العنوان الفرعي';
  static const String fieldText = 'النص';
  static const String fieldAyah = 'الآية';
  static const String fieldFooter = 'الهوامش';
  static String searchDisplayTitle(int pageIndex, String listName) =>
      'صفحة $pageIndex - $listName';

  // Search – lesson list names (index 0 = pre, 1…32 = ders, 33 = final)
  static const String lessonPre = 'الدرس التمهيدي';
  static const String lesson1 = 'الدرس الأول';
  static const String lesson2 = 'الدرس الثاني';
  static const String lesson3 = 'الدرس الثالث';
  static const String lesson4 = 'الدرس الرابع';
  static const String lesson5 = 'الدرس الخامس';
  static const String lesson6 = 'الدرس السادس';
  static const String lesson7 = 'الدرس السابع';
  static const String lesson8 = 'الدرس الثامن';
  static const String lesson9 = 'الدرس التاسع';
  static const String lesson10 = 'الدرس العاشر';
  static const String lesson11 = 'الدرس الحادي عشر';
  static const String lesson12 = 'الدرس الثاني عشر';
  static const String lesson13 = 'الدرس الثالث عشر';
  static const String lesson14 = 'الدرس الرابع عشر';
  static const String lesson15 = 'الدرس الخامس عشر';
  static const String lesson16 = 'الدرس السادس عشر';
  static const String lesson17 = 'الدرس السابع عشر';
  static const String lesson18 = 'الدرس الثامن عشر';
  static const String lesson19 = 'الدرس التاسع عشر';
  static const String lesson20 = 'الدرس العشرون';
  static const String lesson21 = 'الدرس الحادي والعشرون';
  static const String lesson22 = 'الدرس الثاني والعشرون';
  static const String lesson23 = 'الدرس الثالث والعشرون';
  static const String lesson24 = 'الدرس الرابع والعشرون';
  static const String lesson25 = 'الدرس الخامس والعشرون';
  static const String lesson26 = 'الدرس السادس والعشرون';
  static const String lesson27 = 'الدرس السابع والعشرون';
  static const String lesson28 = 'الدرس الثامن والعشرون';
  static const String lesson29 = 'الدرس التاسع والعشرون';
  static const String lesson30 = 'الدرس الثلاثون';
  static const String lesson31 = 'الدرس الحادي والثلاثون';
  static const String lesson32 = 'الدرس الثاني والثلاثون';
  static const String lessonFinal = 'الدرس الأخير';

  // =========================================================================
  // Alert / Dialog
  // =========================================================================
  static const String alertTitle = "! تنبيه";
  static const String alertExitMessage = "هل تريد الخروج من التطبيق؟";
  static const String alertYes = "نعم";
  static const String alertNo = "لا";

  // =========================================================================
  // Drawer
  // =========================================================================
  static const String drawerContactUs = 'تواصل معنا ';
  static const String drawerShareApp = ' شارك التطبيق عبر وسائل التواصل';

  // =========================================================================
  // Content Page
  // =========================================================================
  static const String fontLabel = "الخط";
}
