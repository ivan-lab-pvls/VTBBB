// ignore_for_file: must_be_immutable

import 'package:banking_app/dataSet/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ShowNewsFullScreen extends StatelessWidget {
  const ShowNewsFullScreen({
    super.key,
    required this.s,
  });
  final String s;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(s),
        ),
      ),
    );
  }
}

class AllNewsPage extends StatelessWidget {
  final PageController controller;
  int? indexOfNews;
  AllNewsPage({super.key, required this.controller, required this.indexOfNews});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 55,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xFFBDBDBD),
            size: 40,
          ),
        ),
        toolbarHeight: MediaQuery.sizeOf(context).height * .08,
        title: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Text(
            "${Constants.dailynews[indexOfNews!].title}",
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: MediaQuery.sizeOf(context).height * .25,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: NetworkImage(
                            "${Constants.dailynews[indexOfNews!].img}",
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Text(
                      "${Constants.dailynews[indexOfNews!].date}",
                      style: TextStyle(
                        fontSize: 11,
                        color: Color.fromARGB(255, 79, 79, 79),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),
                    Text(
                      "${Constants.dailynews[indexOfNews!].title}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .05,
                    ),
                    SingleChildScrollView(
                      child: Text(
                        "${Constants.dailynews[indexOfNews!].desc}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 54, 54, 54),
                        ),
                      ),
                    )
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
