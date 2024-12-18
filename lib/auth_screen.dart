import 'package:flutter/material.dart'; 
// استيراد مكتبة Flutter لتوفير الأدوات والمكونات الأساسية.

import 'pages/login_page.dart'; 
// استيراد صفحة تسجيل الدخول.

import 'pages/signup_page.dart'; 
// استيراد صفحة التسجيل.

class AuthScreen extends StatefulWidget { 
  const AuthScreen({super.key}); 
  // تعريف كلاس AuthScreen كـ StatefulWidget لأنه يحتوي على حالة متغيرة.

  @override 
  _AuthScreenState createState() => _AuthScreenState(); 
  // إنشاء حالة مرتبطة بـ AuthScreen.
}

class _AuthScreenState extends State<AuthScreen> { 
  bool isSignUp = true; 
  // متغير لتحديد إذا ما كانت الشاشة تعرض "Sign Up" أو "Log In".

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      body: SingleChildScrollView( 
        child: Column( 
          children: [
            // قسم العنوان العلوي مع تأثير التدرج.
            Container(
              height: MediaQuery.of(context).size.height * 0.35, 
              // تحديد ارتفاع القسم العلوي ليكون نسبة من ارتفاع الشاشة.

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFB0B0B0), // الرمادي الفاتح.
                    Color(0xFF8E8E8E), // الرمادي المتوسط.
                    Color(0xFF4F4F4F), // الرمادي الداكن.
                  ],
                  begin: Alignment.topCenter, 
                  end: Alignment.bottomCenter, 
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70), 
                  // جعل الزاوية السفلى اليسرى دائرية.
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  // توسيط النصوص داخل العمود.

                  children: [
                    Text(
                      "Expense Tracker", 
                      // عنوان التطبيق.
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 32, 
                        fontWeight: FontWeight.bold, 
                      ),
                    ),
                    SizedBox(height: 10), 
                    // مسافة بين العنوان والنص.
                    Text(
                      "Want to save your money?", 
                      // النص الفرعي.
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 16, 
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30), 
            // مسافة بين القسم العلوي والأزرار.

            // أزرار التنقل بين "Sign Up" و "Log In".
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30), 
              // هامش جانبي للأزرار.

              height: 50, 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), 
                border: Border.all(color: Colors.grey), 
              ),
              child: Row(
                children: [
                  // زر تسجيل الدخول (Log In).
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSignUp = false; 
                          // تغيير الحالة إلى "Log In".
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200), 
                        // تأثير الانتقال عند التبديل بين الأزرار.

                        decoration: BoxDecoration(
                          color: !isSignUp ? Colors.grey : Colors.white, 
                          borderRadius: BorderRadius.circular(30), 
                        ),
                        child: Center(
                          child: Text(
                            "Log In", 
                            style: TextStyle(
                              color: !isSignUp ? Colors.white : Colors.grey, 
                              fontWeight: FontWeight.bold, 
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // زر التسجيل (Sign Up).
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSignUp = true; 
                          // تغيير الحالة إلى "Sign Up".
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200), 
                        decoration: BoxDecoration(
                          color: isSignUp ? Colors.grey : Colors.white, 
                          borderRadius: BorderRadius.circular(30), 
                        ),
                        child: Center(
                          child: Text(
                            "Sign Up", 
                            style: TextStyle(
                              color: isSignUp ? Colors.white : Colors.grey, 
                              fontWeight: FontWeight.bold, 
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), 
            // مسافة بين الأزرار والقسم التالي.

            // الانتقال بسلاسة بين صفحات "Sign Up" و "Log In".
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300), 
              child: isSignUp ? const SignUpPage() : const LoginPage(), 
              // عرض الصفحة المناسبة بناءً على الحالة.
            ),

            const SizedBox(height: 30), 
            // مسافة في النهاية.
          ],
        ),
      ),
    );
  }
}
