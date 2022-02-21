import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:erply_login/components/custom_alerts.dart';
import 'package:erply_login/models/user_info.dart';
import 'package:erply_login/services/api_error_handler.dart';
import 'package:erply_login/services/base_client.dart';
import 'package:erply_login/services/login_services.dart';
import 'package:erply_login/views/auth/create_account.dart';
import 'package:erply_login/views/home/home.dart';

class LoginProvider with ChangeNotifier {
  bool isSigning = false;
  var clientCodeC = TextEditingController();
  var usernameC = TextEditingController();
  var passwordC = TextEditingController();

  void onTapCreateAccount(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const CreateAccount()));
  }

  bool _isValidLoginInfo(BuildContext context) {
    CustomAlerts customAlerts = CustomAlerts(context);
    if (clientCodeC.text.isEmpty) {
      customAlerts.showError("please enter valid Client Code.");
      return false;
    } else if (usernameC.text.isEmpty) {
      customAlerts.showError("please enter valid Username");
      return false;
    } else if (passwordC.text.isEmpty) {
      customAlerts.showError("please enter valid Password");
      return false;
    } else {
      return true;
    }
  }

  Future login(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (!_isValidLoginInfo(context)) return;
    isSigning = true;
    notifyListeners();
    var body = {
      "username": usernameC.text,
      "password": passwordC.text,
      "request": "verifyUser",
      "clientCode": clientCodeC.text,
      //"sessionLength":"10"
    };
    var response = await BaseClient()
        .post("https://${clientCodeC.text}.erply.com/api/", body)
        .catchError(ApiErrorHandler(context).handleError);
    isSigning = false;
    notifyListeners();

    if (response != null) {
      Map<String, dynamic> data = response["records"][0];
      data["clientCode"] = clientCodeC.text;
      UserInfo userInfo = UserInfo.fromJson(data);
      LoginServices().setLoginInfo(userInfo);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Home()));
    } else {
      debugPrint("something wrong :)");
    }
  }
}
