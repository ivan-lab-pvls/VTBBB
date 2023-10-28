import 'package:banking_app/views/news_list.dart';
import 'package:banking_app/views/user_cart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final PageController controller;
  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: MediaQuery.sizeOf(context).height * .08,
        title: const Text(
          "HOME",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const UserCart(),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .043),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          ' News',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'View all ',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF00AAFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .043),
                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 800),
                      tween: Tween(
                        begin: 250,
                        end: 0,
                      ),
                      builder: (context, value, child) {
                        return Padding(
                          padding: EdgeInsets.only(top: value),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: NewsListNoOnPressed(
                                controller: widget.controller,
                              )),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
