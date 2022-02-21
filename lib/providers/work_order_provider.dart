import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:erply_login/models/user_info.dart';
import 'package:erply_login/services/api_error_handler.dart';
import 'package:erply_login/services/base_client.dart';
import 'package:erply_login/models/work_order_model.dart';
import 'package:erply_login/services/login_services.dart';

class WorkOrderProvider with ChangeNotifier {
  bool isLoading = false;

  Future getWorkOrders(BuildContext context) async {
    try {
      var response = await BaseClient()
          .get(
            "https://api-as-eu10.erply.com/api/v1/",
            'workorder',
          )
          .catchError(ApiErrorHandler(context).handleError);
      // log("RES" +response.toString());
      // print(response.runtimeType.toString());

      if (response != null) {
        List jsonData = response;
        List<WorkOrderModel> allData =
            jsonData.map((e) => WorkOrderModel.fromMap(e)).toList();
        return allData;
      } else {
        debugPrint("something went wrong");
      }
    } catch (e) {
      debugPrint("DDD" + e.toString());
    }
  }
}
