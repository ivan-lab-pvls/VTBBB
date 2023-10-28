import 'package:banking_app/views/news_list.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  final PageController controller;
  const NewsPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: MediaQuery.sizeOf(context).height * .08,
        title: const Text(
          "NEWS",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: NewsList(controller: controller,),
        ),
      ),
    );
  }
}
