// ignore_for_file: deprecated_member_use

import 'package:banking_app/presentation/screens/main_page.dart';
import 'package:banking_app/views/continue_button.dart';
import 'package:banking_app/views/page_view.dart';
import 'package:banking_app/views/top_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool isPressed = false;
  final inAppReview = InAppReview.instance;
  PageController controller = PageController();
  int index = 0;
  privacyRead(String linkForOpen) async {
    if (await canLaunch(linkForOpen)) {
      await launch(linkForOpen);
    } else {
      throw 'Error for launch Privacy Policy';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height * .07,
            bottom: MediaQuery.sizeOf(context).height * .05,
          ),

          /// Body
          child: Column(
            children: [
              /// TopBar
              TopBar(
                isPressed: isPressed,
                index: index,
              ),

              /// Page View
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .7,
                child: MyPageView(controller: controller),
              ),

              const Spacer(),
              ContinueButton(
                controller: controller,
                onTap: () {
                  setState(() {
                    if (isPressed == true) {
                      final box = Hive.box<bool>('settings');
                      box.put('splash', true);
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (builder) => const MainPage(),
                        ),
                      );
                      inAppReview.requestReview();
                    } else {
                      setState(() {
                        index++;
                      });
                      controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                      if (index == 2) {
                        isPressed = true;
                      }
                    }
                  });
                },
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .03),
              InkWell(
                onTap: () {
                  privacyRead(
                      'https://docs.google.com/document/d/1dWJFecweju7x__gAjgmaRBzD9ENeF8SaU9YafEvNBDQ/edit?usp=sharing');
                },
                child: const Text(
                  "Privacy Policy",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFBDBDBD),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildDivider(BuildContext context, bool pressed) {
  return SizedBox(
    height: 3,
    width: MediaQuery.sizeOf(context).width * .44,
    child: const ColoredBox(
      color: Colors.blue,
    ),
  );
}
