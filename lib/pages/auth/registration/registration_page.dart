import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Registration page"),
        ),
        body: Container(
          child: const Center(
            child: Text("Registration page"),
          ),
        )
    );
  }
}
