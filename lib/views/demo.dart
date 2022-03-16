import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "LOGIN SUCCESSFUL",
          style: TextStyle(color: Colors.purple, fontSize: 38),
        ),
      ),
    );
  }
}
