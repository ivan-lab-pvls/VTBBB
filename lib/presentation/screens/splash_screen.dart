import 'package:banking_app/presentation/screens/intro_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003C84),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 2000),
          onEnd: () => Navigator.pushReplacement(context, CupertinoPageRoute(builder: (builder) => const IntroPage())),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "BANKING ",
                      style: TextStyle(
                        color: Color(0xFF00AAFF),
                      ),
                    ),
                    TextSpan(text: "APP"),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
