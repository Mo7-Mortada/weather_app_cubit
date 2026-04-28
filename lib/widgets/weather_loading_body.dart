import 'package:flutter/material.dart';

class WeatherLoadingBody extends StatelessWidget {
  const WeatherLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    // داخل الـ Loading Body
    String getLoadingMessage() {
      List<String> messages = [
        "نبحث خلف السحب...",
        "نقيس سرعة الرياح...",
        "نجهز لك التوقعات...",
        "نتواصل مع الأقمار الصناعية...",
        "جاري تحميل الطقس الحالي...",
      ];
      return (messages..shuffle()).first; // يختار رسالة عشوائية في كل مرة تحميل
    }

    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LinearProgressIndicator(
          backgroundColor: Theme.of(
            context,
          ).primaryColor.withValues(alpha: 0.2),
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          ),
        ),
        // دائرة تحميل ملونة بتدرج
        // SizedBox(
        //   width: 60,
        //   height: 60,
        //   child: CircularProgressIndicator(
        //     strokeWidth: 5,
        //     // الـ Indicator هنا سيأخذ لون الـ PrimaryColor الخاص بالثيم الحالي
        //     color: Theme.of(context).primaryColor,
        //     // backgroundColor: Colors.grey,
        //   ),
        // ),
        Spacer(),
        Text(
          getLoadingMessage(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[600],
          ),
        ),
        const SizedBox(height: 70),
      ],
    );
  }
}
