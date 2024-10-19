import 'package:elm/core/data/model/elm_lists/elm_list_pre_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elm/controller/elm_pre_cubit_controller/elm_pre_cubit_state.dart';
import 'package:share_plus/share_plus.dart';

class ElmPreCubit extends Cubit<ElmPreState> {
  int currentPageIndex = 0; // الصفحة الحالية
  PageController pageControllerAssma = PageController(); // للتحكم بالصفحات
  double fontSize = 21.0; // حجم الخط الافتراضي

  ElmPreCubit() : super(ElmPreInitial());

  // دالة لإعادة ضبط العداد (أو أي منطق آخر)
  void resetCounter() {
    emit(ElmPreStateUpdated(updatedCounter: 0));
  }

  // زيادة حجم الخط
  void increasFontSize() {
    if (fontSize <= 37.0) {
      fontSize += 2.0;
      emit(ElmPreFontSizeChanged(fontSize));
    }
  }

  // تقليل حجم الخط
  void decreaseFontSize() {
    if (fontSize > 21.0) {
      fontSize -= 2.0;
      emit(ElmPreFontSizeChanged(fontSize));
    }
  }

  // دالة لتغيير الصفحة
  void onPageChanged(int index) {
    currentPageIndex = index;
    emit(ElmPrePageChanged(index));
  }

  // الانتقال إلى صفحة معينة
  void goToPage(int index) {
    pageControllerAssma.jumpToPage(index);
    currentPageIndex = index;
    emit(ElmPrePageChanged(index));
  }

  // دالة مشاركة النص
  void customShareContent(int index) {
    try {
      final String sharetexts = getSharetexts(index);
      Share.share(sharetexts); // مشاركة النص باستخدام SharePlus
      emit(ElmPreShareSuccess()); // نجاح المشاركة
    } catch (e) {
      emit(ElmPreShareFailure(
          erroMessage: 'Failed to share!')); // فشل في المشاركة
    }
  }

  // دالة للحصول على النص القابل للمشاركة
  String getSharetexts(int index) {
    final elm = elmListPreNew[index]; // الحصول على العنصر المحدد من القائمة
    StringBuffer sharetexts = StringBuffer();

    if (elm.titles != null) {
      sharetexts.write('${elm.titles!}\n\n');
    }
    if (elm.subtitles != null) {
      sharetexts.write('${elm.subtitles!}\n\n');
    }
    if (elm.texts != null) {
      sharetexts.write('${elm.texts!}\n\n');
    }
    if (elm.ayahs != null) {
      sharetexts.write('${elm.ayahs!}\n\n');
    }
    if (elm.footer != null) {
      sharetexts.write(elm.footer!);
    }

    return sharetexts.toString().trim(); // إعادة النص بعد تنسيقه
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:elm/controller/elm_pre_cubit_controller/elm_pre_cubit_state.dart';
// import 'package:share_plus/share_plus.dart';

// class ElmPreCubit extends Cubit<ElmPreState> {
//   int currentPageIndex = 0; // Initialize the currentPageIndex
//   PageController pageControllerAssma = PageController();

//   ElmPreCubit() : super(ElmPreInitial());

//   double fontSize = 21.0;
// // Define the page counter or whatever value you want to reset
//   int counter = 0;

//   void resetCounter() {
//     counter = 0; // Reset your counter or state logic here
//     emit(ElmPreStateUpdated(
//         updatedCounter: counter)); // Emit new state after resetting
//   }

//   void increasFontSize() {
//     if (fontSize <= 37.0) {
//       fontSize += 2.0;
//       emit(ElmPreFontSizeChanged(fontSize));
//     }
//   }

//   void decreaseFontSize() {
//     if (fontSize > 21.0) {
//       fontSize -= 2.0;
//       emit(ElmPreFontSizeChanged(fontSize));
//     }
//   }

//   void onPageChanged(int index) {
//     currentPageIndex = index;
//     emit(ElmPrePageChanged(index));
//   }

//   void goToPage(int index) {
//     pageControllerAssma.jumpToPage(index);
//     currentPageIndex = index;
//     emit(ElmPrePageChanged(index));
//   }

//   // Share functionality
//   void customShareContent() {
//     try {
//       final contentToShare =
//           "Check out this page: Page $currentPageIndex"; // Dynamic content
//       Share.share(contentToShare);
//       emit(ElmPreShareSuccess());
//     } catch (e) {
//       emit(ElmPreShareFailure(
//           erroMessage: "Failed to share content: ${e.toString()}"));
//     }
//   }
// }




  // @override
//   String getSharetexts(int index) {
//     final elm = elmListPre[index];
//     StringBuffer sharetexts = StringBuffer();

//     if (elm.titles != null) {
//       sharetexts.write('${elm.titles!}\n\n');
//     }

//     if (elm.subtitles != null) {
//       sharetexts.write('${elm.subtitles!}\n\n');
//     }

//     if (elm.texts != null) {
//       sharetexts.write('${elm.text!}\n\n');
//     }

//     if (elm.ayahs != null) {
//       sharetexts.write('${elm.ayahs!}\n\n');
//     }

//     if (elm.footer != null) {
//       sharetexts.write(elm.footer!);
//     }

//     return sharetexts.toString().trim();
// }


