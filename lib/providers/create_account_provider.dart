import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:erply_login/views/auth/login_screen.dart';

class CreateAccountProvider with ChangeNotifier {
  bool _isAgreeToPolicy = false;

  void onTapLogin(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const Login()));
  }

  set agreeToPolicy(bool agree) {
    _isAgreeToPolicy = agree;
    notifyListeners();
  }

  bool get isUserAgreeToPolicy => _isAgreeToPolicy;
}
