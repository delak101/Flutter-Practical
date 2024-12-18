import 'package:flutter/material.dart';
// استيراد مكتبة Flutter لتوفير الأدوات اللازمة لإنشاء واجهات المستخدم.

class TopNeuCard extends StatelessWidget {
  final String balance;
  final String income;
  final String expense;
  // تعريف المتغيرات النهائية لتخزين البيانات اللازمة: الرصيد، الدخل، والمصروفات.

  const TopNeuCard({
    super.key,
    required this.balance,
    required this.income,
    required this.expense,
  });
  // تعريف المُنشئ (constructor) مع إضافة المتغيرات المطلوبة.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      // إضافة مسافة حول العنصر الأساسي.

      child: Container(
        height: 200,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // تصميم الزوايا بحيث تكون دائرية.

          color: Colors.grey[300],
          // لون خلفية الصندوق.

          boxShadow: [
            // الظل الخارجي للصندوق.
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
            // الظل الداخلي لإبراز التأثير الثلاثي الأبعاد.
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        // تحديد ارتفاع الصندوق.

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // توزيع العناصر داخل العمود بالتساوي.

            children: [
              // عرض النص الخاص بالرصيد.
              Text(
                'BALANCE',
                style: TextStyle(color: Colors.grey[500], fontSize: 16),
              ),
              Text(
                '\$' + balance,
                // عرض قيمة الرصيد.
                style: TextStyle(color: Colors.grey[800], fontSize: 40),
              ),

              // قسم الدخل والمصروفات.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                // مسافة أفقية حول قسم الدخل والمصروفات.

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // توزيع العناصر أفقياً بين طرفي الصندوق.

                  children: [
                    // قسم الدخل.
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          // مسافة داخل الدائرة.

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          // تصميم الدائرة بلون رمادي فاتح.

                          child: Center(
                            child: Icon(
                              Icons.arrow_upward,
                              // رمز السهم للأعلى.
                              color: Colors.green,
                              // اللون الأخضر للإشارة إلى الدخل.
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        // مسافة بين الدائرة والنصوص.

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // محاذاة النصوص إلى اليسار.

                          children: [
                            Text(
                              'Income',
                              style: TextStyle(color: Colors.grey[500]),
                              // النص "Income" مع لون رمادي فاتح.
                            ),
                            SizedBox(height: 5),
                            // مسافة بين النصوص.

                            Text(
                              '\$' + income,
                              // عرض قيمة الدخل.
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                              // النص بخط عريض ولون رمادي متوسط.
                            ),
                          ],
                        ),
                      ],
                    ),

                    // قسم المصروفات.
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_downward,
                              // رمز السهم للأسفل.
                              color: Colors.red,
                              // اللون الأحمر للإشارة إلى المصروفات.
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expense',
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '\$' + expense,
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
