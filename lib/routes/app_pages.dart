import 'package:get/get.dart';
import 'package:test_app/pages/auth/forgot/forgot_page.dart';
import 'package:test_app/pages/auth/login/login_page.dart';
import 'package:test_app/pages/auth/registration/registration_page.dart';
import 'package:test_app/pages/home_page/home_page.dart';
import 'package:test_app/pages/home_page/home_page_binding.dart';
import 'package:test_app/pages/splash_page/splash_page.dart';
import 'package:test_app/routes/app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.SplashScreen,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.Register,
      page: () => const RegistrationPage(),
    ),
    GetPage(
      name: AppRoutes.ForgotPassword,
      page: () => const ForgotPage(),
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => const HomePage(title: "Home Page"),
      binding: HomePageBinding(),
    ),
  ];
}