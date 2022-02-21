import 'package:erply_login/constants/app_colors.dart';
import 'package:flutter/material.dart';


class CustomAlerts {
  BuildContext context;
  CustomAlerts(this.context);
  // SHOW ERROR MESSAGE VIA SNACKBAR 
  void showError(String error) {
    var snackBar = SnackBar(
      content: Text(error),
      backgroundColor: AppColors.errorRed,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  // SHOW Succes MESSAGE VIA SNACKBAR 
  void showSuccessMessage(String message) {
    var snackBar = SnackBar(
      content: Text(message),
      backgroundColor: AppColors.primaryBlue,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
