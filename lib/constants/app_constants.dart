import 'package:flutter/material.dart';

class AppConstants {
  static const String title = '';
  static const Color primaryColor = Color(0xFF555FD2);
  static const Color warningColor = Colors.yellow;
  static const Color dangerColor = Color(0xFFFC5130);
  static const Color scaffoldBackgroundColor = Color(0xFF262525);
  static const String server = '';

  static String? validator({String name= '', String? value, int length= 0}) {
    if (value!.isEmpty) {
      return "Please provide ${name.isEmpty ? 'the value' : name}";
    }
    if (value.length < length) {
      return 'Minimum length of  ${name.isEmpty ? 'value' : name} is ${length.toString()}';
    }
    return null;
  }
}