import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:erply_login/constants/shared_prefs.dart';
import 'package:erply_login/helper/shared_pref_helper.dart';
import 'package:erply_login/models/get_all_customers_model.dart';
import 'package:erply_login/models/user_info.dart';
import 'package:erply_login/services/api_error_handler.dart';
import 'package:erply_login/services/base_client.dart';
import 'package:erply_login/services/login_services.dart';
import 'package:erply_login/views/auth/login_screen.dart';

class CustomerProvider with ChangeNotifier {
  Future<List<GetallCustomers>> getAllCustomers(
    BuildContext context,
  ) async {
    List<GetallCustomers> getAllCustomers;
    var client = http.Client();
    // String? _sessionKey = await SharedPrefHelper.getStringPrefFor(key: SharedPrefs.kloginKey);
    UserInfo userInfo = await LoginServices().getLoginInfo();
    try {
      var url = Uri.parse('https://api-crm-eu10.erply.com/v1/customers');
      var response = await client.get(url, headers: {
        "clientCode": userInfo.clientCode!,
        "sessionKey": userInfo.sessionKey!
      });
      // print ("======================");
      // print(response.body);
      getAllCustomers = getallCustomersFromMap(response.body);
    } finally {
      client.close();
    }

    return getAllCustomers;
  }
}
