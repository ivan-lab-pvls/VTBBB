// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: MediaQuery.sizeOf(context).height * .08,
        title: const Text(
          "SETTINGS",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.sizeOf(context).height * .025,
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  privacyRead(
                      'https://docs.google.com/document/d/1dWJFecweju7x__gAjgmaRBzD9ENeF8SaU9YafEvNBDQ/edit?usp=sharing');
                },
                leading: Icon(
                  Icons.privacy_tip_outlined,
                  color: Colors.blue,
                ),
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF171B34),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .03),
              ListTile(
                onTap: () {
                  privacyRead(
                      'https://docs.google.com/document/d/13Kn0I_rArkpMAFLOdzNnazsmeXJcGeXQJPCEOhwUqWU/edit?usp=sharing');
                },
                leading: Icon(
                  Icons.newspaper_outlined,
                  color: Colors.blue,
                ),
                title: Text(
                  "Terms of Use",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF171B34),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .03),
              ListTile(
                onTap: () {
                  privacyRead('https://forms.gle/M1oNqK4ThSH2gTwKA');
                },
                leading: Icon(
                  Icons.support_agent_outlined,
                  color: Colors.blue,
                ),
                title: Text(
                  "Write support",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF171B34),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .03),
              ListTile(
                onTap: () => InAppReview.instance
                    .openStoreListing(appStoreId: '6469833644'),
                leading: Icon(
                  Icons.star_border_outlined,
                  color: Colors.blue,
                ),
                title: Text(
                  "Rate App",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF171B34),
                    fontWeight: FontWeight.w500,
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
