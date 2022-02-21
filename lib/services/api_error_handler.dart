import 'package:flutter/material.dart';
import 'package:erply_login/components/custom_alerts.dart';
import 'package:erply_login/services/app_exceptions.dart';

class ApiErrorHandler {
  BuildContext context;
  ApiErrorHandler(this.context);
  void handleError(error) {
    if (error is BadRequestException) {
      CustomAlerts(context).showError(error.message!);
    } else if (error is FetchDataException) {
      CustomAlerts(context).showError(error.message!);
    } else if (error is ApiNotRespondingException) {
      CustomAlerts(context).showError(error.message!);
    } else if (error is SessionOverException) {
      CustomAlerts(context).showError(error.message!);
    } else if (error is InvalidCredentials) {
      CustomAlerts(context).showError(error.message!);
      debugPrint(error.message);
    } else if (error is UserIsblocked) {
      CustomAlerts(context).showError(error.message!);
      debugPrint(error.message);
    }
  }
}
