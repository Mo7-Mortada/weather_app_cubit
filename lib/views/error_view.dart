import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final IconData icon;
  final String message;

  const ErrorView({super.key, required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 24),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey[800],
                fontWeight: FontWeight.w500,
              ),
            ),
            // const SizedBox(height: 16),
            // // إضافة زر إعادة محاولة تجعل التطبيق احترافياً أكثر
            // ElevatedButton(
            //   onPressed: () {
            //     // منطق إعادة المحاولة إذا أردت
            //   },
            //   child: const Text("إعادة المحاولة"),
            // ),
          ],
        ),
      ),
    );
  }
}
