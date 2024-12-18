import 'package:flutter/material.dart';
// استيراد مكتبة Flutter لتوفير الأدوات والمكونات الأساسية للتطبيق.

import 'auth_screen.dart';
// استيراد شاشة تسجيل الدخول/التوثيق من ملف آخر لاستخدامها كواجهة رئيسية للتطبيق.

void main() {
  runApp(const MyApp());
}
// الدالة الرئيسية لتشغيل التطبيق.
// يتم استدعاء runApp لتشغيل تطبيق Flutter باستخدام MyApp كعنصر البداية.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// تعريف الكلاس MyApp الذي يرث من StatelessWidget.
// يمثل هذا الكلاس التطبيق الأساسي وهو غير متغير (stateless).

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
  // بناء واجهة التطبيق باستخدام كلاس MaterialApp.
  // - debugShowCheckedModeBanner: يخفي شريط وضع التصحيح.
  // - home: يُحدد الشاشة الرئيسية للتطبيق (AuthScreen).
}
