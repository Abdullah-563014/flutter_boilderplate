import 'package:flutter/material.dart';
import 'package:test_app/constants/app_constants.dart';

class Button extends StatelessWidget {
  final void Function() onTap;
  final Color? bgColor;
  final double? borderRadius;
  final Widget child;

  const Button({
    Key? key,
    required this.onTap,
    required this.child,
    this.bgColor,
    this.borderRadius,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor ?? AppConstants.primaryColor,
          borderRadius: BorderRadius.circular(
            borderRadius ?? 5.0,
          ),
        ),
        child: child,
      ),
    );
  }
}