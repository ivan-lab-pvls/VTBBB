import 'package:banking_app/presentation/screens/home_page.dart';
import 'package:banking_app/presentation/screens/income_page.dart';
import 'package:banking_app/presentation/screens/news_page.dart';
import 'package:banking_app/presentation/screens/settings_page.dart';
import 'package:banking_app/views/bottom_bar_item.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          HomePage(controller: controller),
          IncomePage(),
          NewsPage(controller: controller),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: .2,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 13),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarItem(
                onTap: () => setState(() {
                  index = 0;
                  controller.animateToPage(index,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear);
                }),
                index: index,
                img1: "assets/images/home_filled.png",
                img2: "assets/images/home.png",
                currentIndex: 0,
              ),
              BottomBarItem(
                onTap: () => setState(() {
                  index = 1;
                  controller.animateToPage(index,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear);
                }),
                index: index,
                img1: "assets/images/income_filled.png",
                img2: "assets/images/income.png",
                currentIndex: 1,
              ),
              BottomBarItem(
                onTap: () => setState(() {
                  index = 2;
                  controller.animateToPage(index,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear);
                }),
                index: index,
                img1: "assets/images/news_filled.png",
                img2: "assets/images/news.png",
                currentIndex: 2,
              ),
              BottomBarItem(
                onTap: () => setState(() {
                  index = 3;
                  controller.animateToPage(index,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear);
                }),
                index: index,
                img1: "assets/images/settings_filled.png",
                img2: "assets/images/settings.png",
                currentIndex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
