
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/pages/home_page/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);


  void gotoNextPage() {
    Timer(const Duration(seconds: 3), () {
      Get.off(const HomePage(title: "Home Page"));
    });
  }


  @override
  Widget build(BuildContext context) {
    gotoNextPage();

    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Color(0xFF81C784),
                  Colors.limeAccent,
                ],
                stops: [
                  0.3,
                  0.6,
                  1
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            )
        ),
        child: const Center(
          child: FlutterLogo(size: 200,),
        ),
      ),
    );
  }
}
