import 'dart:convert';

import 'package:erply_login/constants/shared_prefs.dart';
import 'package:erply_login/helper/shared_pref_helper.dart';
import 'package:erply_login/models/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginServices {
  //LOGIN_SERVICES_WORK_AS_SINGLETON
  factory LoginServices() {
    return _singleton;
  }
  LoginServices._internal();
  static final LoginServices _singleton = LoginServices._internal();
  static const kloginKey = "loginInfo";

  Future setLoginInfo(UserInfo userInfo) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String user = jsonEncode(userInfo);
    pref.setString(kloginKey, user);
    // SharedPrefHelper.saveStringFor(key: SharedPrefs.kloginKey, value: user);
  }

  Future<UserInfo> getLoginInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var json = jsonDecode(pref.getString(kloginKey) ?? "");
    UserInfo user = UserInfo.fromJson(json);
    return user;
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.containsKey(kloginKey);
  }

  Future logoutUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(kloginKey);
  }
}
