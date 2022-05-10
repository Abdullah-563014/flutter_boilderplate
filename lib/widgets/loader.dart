import 'package:flutter/material.dart';
import 'package:test_app/constants/app_constants.dart';


class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppConstants.primaryColor)),
      ),
    );
  }
}