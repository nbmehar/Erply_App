import 'package:flutter/material.dart';
import 'package:erply_login/models/user_info.dart';
import 'package:erply_login/services/login_services.dart';
import 'package:erply_login/services/open_url.dart';
import 'package:erply_login/views/splash/splash_screen.dart';

class SettingsProvider extends ChangeNotifier {
  // Logout User
  void onTapSignOut(BuildContext context) async {
    await LoginServices().logoutUser();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => Splash()));
  }

  // onTapBack Office
  void onTapBackOffice() async {
    UserInfo userInfo = await LoginServices().getLoginInfo();
    final String backOfficeUrl =
        "https://eu.erply.com/" + (userInfo.clientCode ?? "");
    OpenUrl().start(url: backOfficeUrl);
  }

  // onTapErplyWiki
  void onTapErplyWiki() {
    const String erplyWikiUrl = "http://wiki.erply.com/";
    OpenUrl().start(url: erplyWikiUrl);
  }

  // on Tap Contact us
  void onTapContactUs() {
    const String contactUsUrl = "https://erply.com/contact-us/";
    OpenUrl().start(url: contactUsUrl);
  }
}
