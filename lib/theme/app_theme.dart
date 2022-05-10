import 'package:flutter/material.dart';
import 'package:test_app/constants/app_constants.dart';

ThemeData appTheme(context) {
  return ThemeData(
    scaffoldBackgroundColor: AppConstants.scaffoldBackgroundColor,
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

const border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Color(0xFFd6dadf), width: 1.0));

const borderFocused = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Color(0xFF146eb4), width: 1.0));

InputDecorationTheme inputDecorationTheme() {
  return const InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    focusColor: AppConstants.primaryColor,
    enabledBorder: border,
    focusedBorder: borderFocused,
    errorBorder: border,
    focusedErrorBorder: border,
    border: border,
    fillColor: Colors.transparent,
    filled: true,
  );
}