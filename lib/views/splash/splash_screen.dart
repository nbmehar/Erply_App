import 'package:flutter/material.dart';
import 'package:erply_login/services/login_services.dart';
import 'package:erply_login/views/auth/login_screen.dart';
import 'package:erply_login/views/home/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool processing = true;
  var loginServices = LoginServices();

  @override
  void initState() {
    _checkUserLogin();
    super.initState();
  }

  void _checkUserLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    await loginServices.isUserLoggedIn().then((value) {
      if (value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Home()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Login()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
