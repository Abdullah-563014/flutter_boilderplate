import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/pages/splash_page/splash_page.dart';
import 'package:test_app/routes/app_pages.dart';
import 'package:test_app/routes/app_routes.dart';
import 'package:test_app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Boilerplate',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SplashScreen,
      getPages: AppPages.list,
      theme: appTheme(context)
    );
  }
}



