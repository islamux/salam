# تطبيق خواطر إيمانية — Khatira

تطبيق Flutter يعرض 34 خاطرة إيمانية (32 درسًا + مقدمة + خاتمة) مع دعم كامل للغة العربية، وإدارة حالة باستخدام BLoC، وميزات بحث ومشاركة.

## الميزات

- **عرض الخواطر**: 34 فصلًا إيمانيًا مقسمة على صفحات
- **بحث**: بحث شامل في النصوص والعناوين والآيات
- **مشاركة**: مشاركة المحتوى النصي بسهولة
- **تخصيص حجم الخط**: تكبير وتصغير النصوص (21–37)
- **إشعارات يومية**: 5 إشعارات يومية للتذكير
- **دعم كامل للغة العربية**: محتوى وواجهة

## التقنيات

| التقنية | الاستخدام |
|---------|-----------|
| Flutter 3.35 · Dart 3.9 | Framework |
| flutter_bloc 9 | State management |
| share_plus 11 | مشاركة النصوص |
| flutter_screenutil 5 | تصميم متجاوب |

## التوثيق

- [Project Blueprint](docs/PROJECT_BLUEPRINT.md) — معمارية التطبيق
- [Search Functionality](docs/SEARCH_FUNCTIONALITY.md) — آلية البحث
- [Architecture Refactoring](docs/architecture-refactoring-status.md) — إعادة هيكلة الكود

## الأوامر الأساسية

```bash
flutter analyze        # فحص الكود
flutter test           # تشغيل الاختبارات (58 اختبارًا)
dart format .          # تنسيق الكود

flutter build apk --release --android-skip-build-dependency-validation
```

## هيكل المشروع الرئيسي

```
lib/
├── core/              # أساسيات: model, repository, routing, services
├── features/          # الميزات
│   ├── khatira/       # صفحات المحتوى (34 صفحة)
│   ├── home/          # الصفحة الرئيسية
│   └── search/        # البحث
├── main.dart          # نقطة الدخول
└── app.dart           # واجهة التطبيق
```

## الرخصة

جميع الحقوق محفوظة للمؤلف.
