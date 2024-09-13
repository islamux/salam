// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:elm/controller/elm1_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Elm1Controller controller;

  setUp(() {
    // إنشاء instance من Elm1Controller
    controller = Elm1Controller();
  });

  test('increaseFontSize يجب أن تزيد حجم الخط', () {
    // التحقق من حجم الخط الابتدائي
    double initialFontSize = controller.fontSize;
    expect(initialFontSize, 21.0); // حجم الخط الابتدائي الذي افترضته

    // استدعاء increaseFontSize()
    controller.increaseFontSize();

    // التحقق من أن حجم الخط قد زاد
    expect(controller.fontSize, initialFontSize + 2.0);
  });
}
